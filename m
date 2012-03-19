Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vwyodapink@gmail.com>) id 1S9QGu-0004HG-Og
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Mar 2012 01:16:26 +0100
Received: by qcso7 with SMTP id o7so939685qcs.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2012 17:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type; bh=dMNgI3u7c6l/cF+3nZpkGgj35XID3C1UxNyqSwXS7Yg=;
	b=ueUEiNX0QMMuvy1xyFKy+REkn38/7QV9xVj+d/EvjnwEkRx8H2ZGYNhKOXKszA4mPW
	eC289c9EdziUKX67SdhcTx+WZ+QkwJ6qZMCaTgORzd3vtonLW1SCNJSTNw1i9CNma9rJ
	FdECmKhyrm+46QcjgmCHh33SNjfYfL1atty3kUrpl6SGR7lJHGRWp3yXA6FdhHAG/GI5
	gKNq9kZYN6vTcJZR0iczhQzgrzmzxu9J+cn8qIdrwWt39dDx8tRzObFesDP2KaODG22v
	AvypCcOvt9ZD2lvAxDWFpjWz3CcWCtehuLnx8uACki7YO/jzCb2ZP7LzdmgyrICdL14B
	F24Q==
Received: by 10.229.69.30 with SMTP id x30mr3679518qci.97.1332115653291;
	Sun, 18 Mar 2012 17:07:33 -0700 (PDT)
Received: from [192.168.1.3] (dpc674485156.direcpc.com. [67.44.85.156])
	by mx.google.com with ESMTPS id w9sm23477308qao.0.2012.03.18.17.07.02
	(version=SSLv3 cipher=OTHER); Sun, 18 Mar 2012 17:07:32 -0700 (PDT)
Message-ID: <4F66789C.7010503@gmail.com>
Date: Sun, 18 Mar 2012 17:06:52 -0700
From: j <vwyodapink@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120314 Thunderbird/11.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: having issues with libprelude and libpam
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Mar 2012 00:16:26 -0000
X-Groupsio-MsgNum: 37831
Content-Type: multipart/mixed; boundary="------------010401080604060302010002"

--------------010401080604060302010002
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I am trying to get libpam to build which fails due to not finding the 
header from the libprelude build, which currently also fails to build 
for me. I am hoping someone knows of a fix or can point me to the right 
place to dig for a solution, I do not see any listed fixes or 
workarounds from my digging online. I have attached the build logs for 
each as well, since they were long if the preferred method is different, 
sorry and please let me know how to post those. In the libprelude error 
its saying there are files that seem to have moved, but they actually 
exsist in the location it says it does not.

I am running on Ubuntu 11.04 32bit (up to date). Bitbake branch 1.12, OE 
branch overo-2011.03 (both up to date). I know this is not your guys 
branch but have not gotten any feed back on gumstix in relation to 
issues building these packages, so checked them verse what I believe was 
the master branch and they had no diff. If I can give more info on 
system specs or anything like that please let me know. I believe I know 
the "issues" just not sure how to go about solving them, as libprelude 
seems like a more serious error. These are the only two packages that 
fail to build for image that do not rely on these lib's. I also have 
both of these installed on the build machine itself, I also built 
everything each rely on for the build, at least I believe I did none 
failed.

Thanks a ton for any help or info.

--------------010401080604060302010002
Content-Type: text/x-log;
 name="libpam-1.1.1-r2-builderror.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="libpam-1.1.1-r2-builderror.log"

+ do_compile
+ base_do_compile
+ '[' -e Makefile -o -e makefile -o -e GNUmakefile ']'
+ oe_runmake
+ oenote make -j 9
+ echo NOTE: 'make -j 9'
NOTE: make -j 9
+ make -j 9
make  all-recursive
make[1]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libpam-1.1.1-r2/Linux-PAM-1.1.1'
Making all in libpam
make[2]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libpam-1.1.1-r2/Linux-PAM-1.1.1/libpam'
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I..    -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\"  -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_account.lo -MD -MP -MF .deps/pam_account.Tpo -c -o pam_account.lo pam_account.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I..    -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\"  -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_auth.lo -MD -MP -MF .deps/pam_auth.Tpo -c -o pam_auth.lo pam_auth.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I..    -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\"  -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_data.lo -MD -MP -MF .deps/pam_data.Tpo -c -o pam_data.lo pam_data.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I..    -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\"  -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_delay.lo -MD -MP -MF .deps/pam_delay.Tpo -c -o pam_delay.lo pam_delay.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I..    -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\"  -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_dispatch.lo -MD -MP -MF .deps/pam_dispatch.Tpo -c -o pam_dispatch.lo pam_dispatch.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I..    -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\"  -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_end.lo -MD -MP -MF .deps/pam_end.Tpo -c -o pam_end.lo pam_end.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I..    -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\"  -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_env.lo -MD -MP -MF .deps/pam_env.Tpo -c -o pam_env.lo pam_env.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I..    -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\"  -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_get_authtok.lo -MD -MP -MF .deps/pam_get_authtok.Tpo -c -o pam_get_authtok.lo pam_get_authtok.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I..    -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\"  -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_handlers.lo -MD -MP -MF .deps/pam_handlers.Tpo -c -o pam_handlers.lo pam_handlers.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I.. -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\" -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_auth.lo -MD -MP -MF .deps/pam_auth.Tpo -c pam_auth.c  -fPIC -DPIC -o .libs/pam_auth.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I.. -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\" -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_env.lo -MD -MP -MF .deps/pam_env.Tpo -c pam_env.c  -fPIC -DPIC -o .libs/pam_env.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I.. -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\" -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_end.lo -MD -MP -MF .deps/pam_end.Tpo -c pam_end.c  -fPIC -DPIC -o .libs/pam_end.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I.. -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\" -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_dispatch.lo -MD -MP -MF .deps/pam_dispatch.Tpo -c pam_dispatch.c  -fPIC -DPIC -o .libs/pam_dispatch.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I.. -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\" -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_data.lo -MD -MP -MF .deps/pam_data.Tpo -c pam_data.c  -fPIC -DPIC -o .libs/pam_data.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I.. -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\" -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_delay.lo -MD -MP -MF .deps/pam_delay.Tpo -c pam_delay.c  -fPIC -DPIC -o .libs/pam_delay.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I.. -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\" -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_account.lo -MD -MP -MF .deps/pam_account.Tpo -c pam_account.c  -fPIC -DPIC -o .libs/pam_account.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I.. -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\" -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_handlers.lo -MD -MP -MF .deps/pam_handlers.Tpo -c pam_handlers.c  -fPIC -DPIC -o .libs/pam_handlers.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I.. -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\" -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_get_authtok.lo -MD -MP -MF .deps/pam_get_authtok.Tpo -c pam_get_authtok.c  -fPIC -DPIC -o .libs/pam_get_authtok.o
mv -f .deps/pam_account.Tpo .deps/pam_account.Plo
mv -f .deps/pam_auth.Tpo .deps/pam_auth.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I..    -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\"  -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_item.lo -MD -MP -MF .deps/pam_item.Tpo -c -o pam_item.lo pam_item.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I..    -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\"  -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_misc.lo -MD -MP -MF .deps/pam_misc.Tpo -c -o pam_misc.lo pam_misc.c
mv -f .deps/pam_data.Tpo .deps/pam_data.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I..    -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\"  -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_password.lo -MD -MP -MF .deps/pam_password.Tpo -c -o pam_password.lo pam_password.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I.. -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\" -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_item.lo -MD -MP -MF .deps/pam_item.Tpo -c pam_item.c  -fPIC -DPIC -o .libs/pam_item.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I.. -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\" -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_misc.lo -MD -MP -MF .deps/pam_misc.Tpo -c pam_misc.c  -fPIC -DPIC -o .libs/pam_misc.o
mv -f .deps/pam_end.Tpo .deps/pam_end.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I..    -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\"  -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_prelude.lo -MD -MP -MF .deps/pam_prelude.Tpo -c -o pam_prelude.lo pam_prelude.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I.. -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\" -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_password.lo -MD -MP -MF .deps/pam_password.Tpo -c pam_password.c  -fPIC -DPIC -o .libs/pam_password.o
mv -f .deps/pam_dispatch.Tpo .deps/pam_dispatch.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I..    -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\"  -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_session.lo -MD -MP -MF .deps/pam_session.Tpo -c -o pam_session.lo pam_session.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I.. -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\" -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_prelude.lo -MD -MP -MF .deps/pam_prelude.Tpo -c pam_prelude.c  -fPIC -DPIC -o .libs/pam_prelude.o
mv -f .deps/pam_env.Tpo .deps/pam_env.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I..    -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\"  -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_start.lo -MD -MP -MF .deps/pam_start.Tpo -c -o pam_start.lo pam_start.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I.. -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\" -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_session.lo -MD -MP -MF .deps/pam_session.Tpo -c pam_session.c  -fPIC -DPIC -o .libs/pam_session.o
pam_prelude.c:13:32: fatal error: libprelude/prelude.h: No such file or directory
compilation terminated.
make[2]: *** [pam_prelude.lo] Error 1
make[2]: *** Waiting for unfinished jobs....
mv -f .deps/pam_get_authtok.Tpo .deps/pam_get_authtok.Plo
mv -f .deps/pam_password.Tpo .deps/pam_password.Plo
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I.. -DDEFAULT_MODULE_PATH=\"/usr/lib/security/\" -DLIBPAM_COMPILE -I./include -DPRELUDE=1 -DPAM_VERSION=\"1.1.1\" -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT pam_start.lo -MD -MP -MF .deps/pam_start.Tpo -c pam_start.c  -fPIC -DPIC -o .libs/pam_start.o
mv -f .deps/pam_session.Tpo .deps/pam_session.Plo
mv -f .deps/pam_handlers.Tpo .deps/pam_handlers.Plo
mv -f .deps/pam_delay.Tpo .deps/pam_delay.Plo
mv -f .deps/pam_start.Tpo .deps/pam_start.Plo
mv -f .deps/pam_misc.Tpo .deps/pam_misc.Plo
mv -f .deps/pam_item.Tpo .deps/pam_item.Plo
make[2]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libpam-1.1.1-r2/Linux-PAM-1.1.1/libpam'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libpam-1.1.1-r2/Linux-PAM-1.1.1'
make: *** [all] Error 2
+ die 'oe_runmake failed'
+ oefatal 'oe_runmake failed'
+ echo FATAL: 'oe_runmake failed'
FATAL: oe_runmake failed
+ exit 1

--------------010401080604060302010002
Content-Type: text/x-log;
 name="libprelude-1.0.0-r1-builderror.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="libprelude-1.0.0-r1-builderror.log"

+ do_compile
+ base_do_compile
+ '[' -e Makefile -o -e makefile -o -e GNUmakefile ']'
+ oe_runmake
+ oenote make -j 9
+ echo NOTE: 'make -j 9'
NOTE: make -j 9
+ make -j 9
rm -f prelude-config.h
echo "/* Used from libprelude headers */" >> prelude-config.h
/bin/grep "HAVE_VARIADIC_MACROS"          < ./config.h >> prelude-config.h
/bin/grep "PRELUDE_ALIGNED_ACCESS"        < ./config.h >> prelude-config.h
/bin/grep "PRELUDE_WORDS_BIGENDIAN"       < ./config.h >> prelude-config.h
/bin/grep "__PRELUDE_FUNC__"              < ./config.h >> prelude-config.h
/bin/grep "TIME_WITH_SYS_TIME"            < ./config.h >> prelude-config.h
/bin/grep "HAVE_UID_T"                    < ./config.h >> prelude-config.h
/bin/grep "HAVE_GID_T"                    < ./config.h >> prelude-config.h
make  all-recursive
make[1]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0'
Making all in libltdl
make[2]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/libltdl'
make  all-am
make[3]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/libltdl'
/bin/sh ../arm-angstrom-linux-gnueabi-libtool  --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -DLT_CONFIG_H=3D'<config.h>' -DLTDL -I. -I. -Ilib=
ltdl -I./libltdl -I./libltdl   -fexpensive-optimizations -fomit-frame-point=
er -frename-registers -O2 -ggdb2 -MT dlopen.lo -MD -MP -MF .deps/dlopen.Tpo=
 -c -o dlopen.lo `test -f 'loaders/dlopen.c' || echo './'`loaders/dlopen.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool  --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -DLTDLOPEN=3Dlibltdlc -DLT_CONFIG_H=3D'<config.h>=
' -DLTDL -I. -I. -Ilibltdl -I./libltdl -I./libltdl   -fexpensive-optimizati=
ons -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT libltdlc_la-preo=
pen.lo -MD -MP -MF .deps/libltdlc_la-preopen.Tpo -c -o libltdlc_la-preopen.=
lo `test -f 'loaders/preopen.c' || echo './'`loaders/preopen.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool  --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -DLTDLOPEN=3Dlibltdlc -DLT_CONFIG_H=3D'<config.h>=
' -DLTDL -I. -I. -Ilibltdl -I./libltdl -I./libltdl   -fexpensive-optimizati=
ons -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT libltdlc_la-lt__=
alloc.lo -MD -MP -MF .deps/libltdlc_la-lt__alloc.Tpo -c -o libltdlc_la-lt__=
alloc.lo `test -f 'lt__alloc.c' || echo './'`lt__alloc.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool  --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -DLTDLOPEN=3Dlibltdlc -DLT_CONFIG_H=3D'<config.h>=
' -DLTDL -I. -I. -Ilibltdl -I./libltdl -I./libltdl   -fexpensive-optimizati=
ons -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT libltdlc_la-lt_d=
lloader.lo -MD -MP -MF .deps/libltdlc_la-lt_dlloader.Tpo -c -o libltdlc_la-=
lt_dlloader.lo `test -f 'lt_dlloader.c' || echo './'`lt_dlloader.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool  --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -DLTDLOPEN=3Dlibltdlc -DLT_CONFIG_H=3D'<config.h>=
' -DLTDL -I. -I. -Ilibltdl -I./libltdl -I./libltdl   -fexpensive-optimizati=
ons -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT libltdlc_la-lt_e=
rror.lo -MD -MP -MF .deps/libltdlc_la-lt_error.Tpo -c -o libltdlc_la-lt_err=
or.lo `test -f 'lt_error.c' || echo './'`lt_error.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool  --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -DLTDLOPEN=3Dlibltdlc -DLT_CONFIG_H=3D'<config.h>=
' -DLTDL -I. -I. -Ilibltdl -I./libltdl -I./libltdl   -fexpensive-optimizati=
ons -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT libltdlc_la-ltdl=
.lo -MD -MP -MF .deps/libltdlc_la-ltdl.Tpo -c -o libltdlc_la-ltdl.lo `test =
-f 'ltdl.c' || echo './'`ltdl.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool  --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -DLTDLOPEN=3Dlibltdlc -DLT_CONFIG_H=3D'<config.h>=
' -DLTDL -I. -I. -Ilibltdl -I./libltdl -I./libltdl   -fexpensive-optimizati=
ons -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT libltdlc_la-slis=
t.lo -MD -MP -MF .deps/libltdlc_la-slist.Tpo -c -o libltdlc_la-slist.lo `te=
st -f 'slist.c' || echo './'`slist.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -DLT_CONFIG_H=3D'<config.h>' -DLTDL -I. -I. -Ilib=
ltdl -I./libltdl -I./libltdl   -fexpensive-optimizations -fomit-frame-point=
er -frename-registers -O2 -ggdb2 -MT lt__strl.lo -MD -MP -MF .deps/lt__strl=
.Tpo -c -o lt__strl.lo lt__strl.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -DLTDLO=
PEN=3Dlibltdlc "-DLT_CONFIG_H=3D<config.h>" -DLTDL -I. -I. -Ilibltdl -I./li=
bltdl -I./libltdl -fexpensive-optimizations -fomit-frame-pointer -frename-r=
egisters -O2 -ggdb2 -MT libltdlc_la-lt__alloc.lo -MD -MP -MF .deps/libltdlc=
_la-lt__alloc.Tpo -c lt__alloc.c  -fPIC -DPIC -o .libs/libltdlc_la-lt__allo=
c.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. "-DLT_C=
ONFIG_H=3D<config.h>" -DLTDL -I. -I. -Ilibltdl -I./libltdl -I./libltdl -fex=
pensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -M=
T dlopen.lo -MD -MP -MF .deps/dlopen.Tpo -c loaders/dlopen.c  -fPIC -DPIC -=
o .libs/dlopen.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. "-DLT_C=
ONFIG_H=3D<config.h>" -DLTDL -I. -I. -Ilibltdl -I./libltdl -I./libltdl -fex=
pensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -M=
T lt__strl.lo -MD -MP -MF .deps/lt__strl.Tpo -c lt__strl.c  -fPIC -DPIC -o =
.libs/lt__strl.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -DLTDLO=
PEN=3Dlibltdlc "-DLT_CONFIG_H=3D<config.h>" -DLTDL -I. -I. -Ilibltdl -I./li=
bltdl -I./libltdl -fexpensive-optimizations -fomit-frame-pointer -frename-r=
egisters -O2 -ggdb2 -MT libltdlc_la-preopen.lo -MD -MP -MF .deps/libltdlc_l=
a-preopen.Tpo -c loaders/preopen.c  -fPIC -DPIC -o .libs/libltdlc_la-preope=
n.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -DLTDLO=
PEN=3Dlibltdlc "-DLT_CONFIG_H=3D<config.h>" -DLTDL -I. -I. -Ilibltdl -I./li=
bltdl -I./libltdl -fexpensive-optimizations -fomit-frame-pointer -frename-r=
egisters -O2 -ggdb2 -MT libltdlc_la-slist.lo -MD -MP -MF .deps/libltdlc_la-=
slist.Tpo -c slist.c  -fPIC -DPIC -o .libs/libltdlc_la-slist.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -DLTDLO=
PEN=3Dlibltdlc "-DLT_CONFIG_H=3D<config.h>" -DLTDL -I. -I. -Ilibltdl -I./li=
bltdl -I./libltdl -fexpensive-optimizations -fomit-frame-pointer -frename-r=
egisters -O2 -ggdb2 -MT libltdlc_la-lt_dlloader.lo -MD -MP -MF .deps/libltd=
lc_la-lt_dlloader.Tpo -c lt_dlloader.c  -fPIC -DPIC -o .libs/libltdlc_la-lt=
_dlloader.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -DLTDLO=
PEN=3Dlibltdlc "-DLT_CONFIG_H=3D<config.h>" -DLTDL -I. -I. -Ilibltdl -I./li=
bltdl -I./libltdl -fexpensive-optimizations -fomit-frame-pointer -frename-r=
egisters -O2 -ggdb2 -MT libltdlc_la-lt_error.lo -MD -MP -MF .deps/libltdlc_=
la-lt_error.Tpo -c lt_error.c  -fPIC -DPIC -o .libs/libltdlc_la-lt_error.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -DLTDLO=
PEN=3Dlibltdlc "-DLT_CONFIG_H=3D<config.h>" -DLTDL -I. -I. -Ilibltdl -I./li=
bltdl -I./libltdl -fexpensive-optimizations -fomit-frame-pointer -frename-r=
egisters -O2 -ggdb2 -MT libltdlc_la-ltdl.lo -MD -MP -MF .deps/libltdlc_la-l=
tdl.Tpo -c ltdl.c  -fPIC -DPIC -o .libs/libltdlc_la-ltdl.o
mv -f .deps/lt__strl.Tpo .deps/lt__strl.Plo
mv -f .deps/libltdlc_la-lt__alloc.Tpo .deps/libltdlc_la-lt__alloc.Plo
mv -f .deps/dlopen.Tpo .deps/dlopen.Plo
mv -f .deps/libltdlc_la-lt_error.Tpo .deps/libltdlc_la-lt_error.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dlink ar=
m-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dne=
on -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home/vdub=
hack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99  -fex=
pensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -m=
odule -avoid-version -Wl,-O1 -Wl,--hash-style=3Dgnu -o dlopen.la  dlopen.lo=
 -ldl -ldl=20
mv -f .deps/libltdlc_la-lt_dlloader.Tpo .deps/libltdlc_la-lt_dlloader.Plo
mv -f .deps/libltdlc_la-slist.Tpo .deps/libltdlc_la-slist.Plo
mv -f .deps/libltdlc_la-preopen.Tpo .deps/libltdlc_la-preopen.Plo
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-ar cru=
 .libs/dlopen.a .libs/dlopen.o=20
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-ranlib=
 .libs/dlopen.a
arm-angstrom-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f "dlopen.la"=
 && ln -s "../dlopen.la" "dlopen.la" )
mv -f .deps/libltdlc_la-ltdl.Tpo .deps/libltdlc_la-ltdl.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dlink ar=
m-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dne=
on -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home/vdub=
hack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99  -fex=
pensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -n=
o-undefined -dlpreopen dlopen.la  -Wl,-O1 -Wl,--hash-style=3Dgnu -o libltdl=
c.la  libltdlc_la-preopen.lo libltdlc_la-lt__alloc.lo libltdlc_la-lt_dlload=
er.lo libltdlc_la-lt_error.lo libltdlc_la-ltdl.lo libltdlc_la-slist.lo lt__=
strl.lo -ldl=20
arm-angstrom-linux-gnueabi-libtool: link: rm -f .libs/libltdlc.nm .libs/lib=
ltdlc.nmS .libs/libltdlc.nmT
arm-angstrom-linux-gnueabi-libtool: link: (cd .libs && arm-angstrom-linux-g=
nueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Ds=
oftfp -mthumb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/=
sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -fexpensive-optimizatio=
ns -fomit-frame-pointer -frename-registers -O2 -ggdb2 -c -fno-builtin  -fPI=
C -DPIC "libltdlcS.c")
arm-angstrom-linux-gnueabi-libtool: link: rm -f ".libs/libltdlcS.c" ".libs/=
libltdlc.nm" ".libs/libltdlc.nmS" ".libs/libltdlc.nmT"
arm-angstrom-linux-gnueabi-libtool: link: (cd .libs/libltdlc.lax/dlopen.a &=
& arm-angstrom-linux-gnueabi-ar x "/home/vdubhack/overo-oe/tmp/work/armv7a-=
angstrom-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/libltdl/./.libs=
/dlopen.a")
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-ar cru=
 .libs/libltdlc.a .libs/libltdlc_la-preopen.o .libs/libltdlc_la-lt__alloc.o=
 .libs/libltdlc_la-lt_dlloader.o .libs/libltdlc_la-lt_error.o .libs/libltdl=
c_la-ltdl.o .libs/libltdlc_la-slist.o .libs/lt__strl.o .libs/libltdlcS.o  .=
libs/libltdlc.lax/dlopen.a/dlopen.o=20
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-ranlib=
 .libs/libltdlc.a
arm-angstrom-linux-gnueabi-libtool: link: rm -fr .libs/libltdlc.lax
arm-angstrom-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f "libltdlc.l=
a" && ln -s "../libltdlc.la" "libltdlc.la" )
make[3]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/libltdl'
make[2]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/libltdl'
Making all in libmissing
make[2]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/libmissing'
rm -f alloca.h-t alloca.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  cat ./alloca.in.h; \
	} > alloca.h-t && \
	mv -f alloca.h-t alloca.h
rm -f arg-nonnull.h-t arg-nonnull.h && \
	sed -n -e '/GL_ARG_NONNULL/,$p' \
	  < .././arg-nonnull.h \
	  > arg-nonnull.h-t && \
	mv arg-nonnull.h-t arg-nonnull.h
rm -f warn-on-use.h-t warn-on-use.h && \
	sed -n -e '/^.ifndef/,$p' \
	  < .././warn-on-use.h \
	  > warn-on-use.h-t && \
	mv warn-on-use.h-t warn-on-use.h
rm -f configmake.h-t && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  echo '#define PREFIX "/usr"'; \
	  echo '#define EXEC_PREFIX "/usr"'; \
	  echo '#define BINDIR "/usr/bin"'; \
	  echo '#define SBINDIR "/usr/sbin"'; \
	  echo '#define LIBEXECDIR "/usr/libexec"'; \
	  echo '#define DATAROOTDIR "/usr/share"'; \
	  echo '#define DATADIR "/usr/share"'; \
	  echo '#define SYSCONFDIR "/etc"'; \
	  echo '#define SHAREDSTATEDIR "/com"'; \
	  echo '#define LOCALSTATEDIR "/var"'; \
	  echo '#define INCLUDEDIR "/usr/include"'; \
	  echo '#define OLDINCLUDEDIR "/usr/include"'; \
	  echo '#define DOCDIR "/usr/share/doc/libprelude"'; \
	  echo '#define INFODIR "/usr/share/info"'; \
	  echo '#define HTMLDIR "/usr/share/doc/libprelude"'; \
	  echo '#define DVIDIR "/usr/share/doc/libprelude"'; \
	  echo '#define PDFDIR "/usr/share/doc/libprelude"'; \
	  echo '#define PSDIR "/usr/share/doc/libprelude"'; \
	  echo '#define LIBDIR "/usr/lib"'; \
	  echo '#define LISPDIR ""'; \
	  echo '#define LOCALEDIR "/usr/share/locale"'; \
	  echo '#define MANDIR "/usr/share/man"'; \
	  echo '#define MANEXT ""'; \
	  echo '#define PKGDATADIR "/usr/share/libprelude"'; \
	  echo '#define PKGINCLUDEDIR "/usr/include/libprelude"'; \
	  echo '#define PKGLIBDIR "/usr/lib/libprelude"'; \
	  echo '#define PKGLIBEXECDIR "/usr/libexec/libprelude"'; \
	} | sed '/""/d' > configmake.h-t && \
	if test -f configmake.h && cmp configmake.h-t configmake.h > /dev/null; th=
en \
	  rm -f configmake.h-t; \
	else \
	  rm -f configmake.h; mv configmake.h-t configmake.h; \
	fi
/bin/mkdir -p arpa
rm -f langinfo.h-t langinfo.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''HAVE_LANGINFO_H''@|1|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_LANGINFO_H''@|<langinfo.h>|g' \
	      -e 's|@''GNULIB_NL_LANGINFO''@|1|g' \
	      -e 's|@''HAVE_LANGINFO_CODESET''@|1|g' \
	      -e 's|@''HAVE_LANGINFO_ERA''@|1|g' \
	      -e 's|@''HAVE_NL_LANGINFO''@|1|g' \
	      -e 's|@''REPLACE_NL_LANGINFO''@|0|g' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./langinfo.in.h; \
	} > langinfo.h-t && \
	mv langinfo.h-t langinfo.h
rm -f math.h-t math.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
	  sed -e 's|@''INCLUDE_NEXT_AS_FIRST_DIRECTIVE''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_AS_FIRST_DIRECTIVE_MATH_H''@|<math.h>|g' \
	      -e 's|@''GNULIB_ACOSL''@|0|g' \
	      -e 's|@''GNULIB_ASINL''@|0|g' \
	      -e 's|@''GNULIB_ATANL''@|0|g' \
	      -e 's|@''GNULIB_CEILF''@|0|g' \
	      -e 's|@''GNULIB_CEILL''@|0|g' \
	      -e 's|@''GNULIB_COSL''@|0|g' \
	      -e 's|@''GNULIB_EXPL''@|0|g' \
	      -e 's|@''GNULIB_FLOORF''@|0|g' \
	      -e 's|@''GNULIB_FLOORL''@|0|g' \
	      -e 's|@''GNULIB_FREXP''@|1|g' \
	      -e 's|@''GNULIB_FREXPL''@|1|g' \
	      -e 's|@''GNULIB_ISFINITE''@|0|g' \
	      -e 's|@''GNULIB_ISINF''@|0|g' \
	      -e 's|@''GNULIB_ISNAN''@|0|g' \
	      -e 's|@''GNULIB_ISNANF''@|0|g' \
	      -e 's|@''GNULIB_ISNAND''@|0|g' \
	      -e 's|@''GNULIB_ISNANL''@|0|g' \
	      -e 's|@''GNULIB_LDEXPL''@|0|g' \
	      -e 's|@''GNULIB_LOGL''@|0|g' \
	      -e 's|@''GNULIB_ROUND''@|0|g' \
	      -e 's|@''GNULIB_ROUNDF''@|0|g' \
	      -e 's|@''GNULIB_ROUNDL''@|0|g' \
	      -e 's|@''GNULIB_SIGNBIT''@|1|g' \
	      -e 's|@''GNULIB_SINL''@|0|g' \
	      -e 's|@''GNULIB_SQRTL''@|0|g' \
	      -e 's|@''GNULIB_TANL''@|0|g' \
	      -e 's|@''GNULIB_TRUNC''@|0|g' \
	      -e 's|@''GNULIB_TRUNCF''@|0|g' \
	      -e 's|@''GNULIB_TRUNCL''@|0|g' \
	      -e 's|@''HAVE_ACOSL''@|1|g' \
	      -e 's|@''HAVE_ASINL''@|1|g' \
	      -e 's|@''HAVE_ATANL''@|1|g' \
	      -e 's|@''HAVE_COSL''@|1|g' \
	      -e 's|@''HAVE_EXPL''@|1|g' \
	      -e 's|@''HAVE_ISNANF''@|1|g' \
	      -e 's|@''HAVE_ISNAND''@|1|g' \
	      -e 's|@''HAVE_ISNANL''@|1|g' \
	      -e 's|@''HAVE_LOGL''@|1|g' \
	      -e 's|@''HAVE_SINL''@|1|g' \
	      -e 's|@''HAVE_SQRTL''@|1|g' \
	      -e 's|@''HAVE_TANL''@|1|g' \
	      -e 's|@''HAVE_DECL_ACOSL''@|1|g' \
	      -e 's|@''HAVE_DECL_ASINL''@|1|g' \
	      -e 's|@''HAVE_DECL_ATANL''@|1|g' \
	      -e 's|@''HAVE_DECL_COSL''@|1|g' \
	      -e 's|@''HAVE_DECL_EXPL''@|1|g' \
	      -e 's|@''HAVE_DECL_FREXPL''@|1|g' \
	      -e 's|@''HAVE_DECL_LDEXPL''@|1|g' \
	      -e 's|@''HAVE_DECL_LOGL''@|1|g' \
	      -e 's|@''HAVE_DECL_SINL''@|1|g' \
	      -e 's|@''HAVE_DECL_SQRTL''@|1|g' \
	      -e 's|@''HAVE_DECL_TANL''@|1|g' \
	      -e 's|@''HAVE_DECL_TRUNC''@|1|g' \
	      -e 's|@''HAVE_DECL_TRUNCF''@|1|g' \
	      -e 's|@''REPLACE_CEILF''@|0|g' \
	      -e 's|@''REPLACE_CEILL''@|0|g' \
	      -e 's|@''REPLACE_FLOORF''@|0|g' \
	      -e 's|@''REPLACE_FLOORL''@|0|g' \
	      -e 's|@''REPLACE_FREXP''@|0|g' \
	      -e 's|@''REPLACE_FREXPL''@|0|g' \
	      -e 's|@''REPLACE_HUGE_VAL''@|0|g' \
	      -e 's|@''REPLACE_ISFINITE''@|0|g' \
	      -e 's|@''REPLACE_ISINF''@|0|g' \
	      -e 's|@''REPLACE_ISNAN''@|0|g' \
	      -e 's|@''REPLACE_LDEXPL''@|0|g' \
	      -e 's|@''REPLACE_NAN''@|0|g' \
	      -e 's|@''REPLACE_ROUND''@|0|g' \
	      -e 's|@''REPLACE_ROUNDF''@|0|g' \
	      -e 's|@''REPLACE_ROUNDL''@|0|g' \
	      -e 's|@''REPLACE_SIGNBIT''@|1|g' \
	      -e 's|@''REPLACE_SIGNBIT_USING_GCC''@|0|g' \
	      -e 's|@''REPLACE_TRUNCL''@|0|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./math.in.h; \
	} > math.h-t && \
	mv math.h-t math.h
rm -f arpa/inet.h-t arpa/inet.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_ARPA_INET_H''@|<arpa/inet.h>|g' \
	      -e 's|@''HAVE_ARPA_INET_H''@|1|g' \
	      -e 's|@''GNULIB_INET_NTOP''@|1|g' \
	      -e 's|@''GNULIB_INET_PTON''@|1|g' \
	      -e 's|@''HAVE_DECL_INET_NTOP''@|1|g' \
	      -e 's|@''HAVE_DECL_INET_PTON''@|1|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./arpa_inet.in.h; \
	} > arpa/inet.h-t && \
	mv arpa/inet.h-t arpa/inet.h
rm -f signal.h-t signal.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
	  sed -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_SIGNAL_H''@|<signal.h>|g' \
	      -e 's|@''GNULIB_SIGNAL_H_SIGPIPE''@|0|g' \
	      -e 's|@''GNULIB_SIGPROCMASK''@|1|g' \
	      -e 's|@''GNULIB_SIGACTION''@|0|g' \
	      -e 's|@''HAVE_POSIX_SIGNALBLOCKING''@|1|g' \
	      -e 's|@''HAVE_SIGSET_T''@|1|g' \
	      -e 's|@''HAVE_SIGINFO_T''@|1|g' \
	      -e 's|@''HAVE_SIGACTION''@|1|g' \
	      -e 's|@''HAVE_STRUCT_SIGACTION_SA_SIGACTION''@|1|g' \
	      -e 's|@''HAVE_TYPE_VOLATILE_SIG_ATOMIC_T''@|1|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./signal.in.h; \
	} > signal.h-t && \
	mv signal.h-t signal.h
rm -f stdio.h-t stdio.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
	  sed -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_STDIO_H''@|<stdio.h>|g' \
	      -e 's|@''GNULIB_DPRINTF''@|0|g' \
	      -e 's|@''GNULIB_FCLOSE''@|1|g' \
	      -e 's|@''GNULIB_FFLUSH''@|0|g' \
	      -e 's|@''GNULIB_FOPEN''@|1|g' \
	      -e 's|@''GNULIB_FPRINTF''@|1|g' \
	      -e 's|@''GNULIB_FPRINTF_POSIX''@|0|g' \
	      -e 's|@''GNULIB_FPURGE''@|0|g' \
	      -e 's|@''GNULIB_FPUTC''@|1|g' \
	      -e 's|@''GNULIB_FPUTS''@|1|g' \
	      -e 's|@''GNULIB_FREOPEN''@|0|g' \
	      -e 's|@''GNULIB_FSEEK''@|0|g' \
	      -e 's|@''GNULIB_FSEEKO''@|1|g' \
	      -e 's|@''GNULIB_FTELL''@|0|g' \
	      -e 's|@''GNULIB_FTELLO''@|0|g' \
	      -e 's|@''GNULIB_FWRITE''@|1|g' \
	      -e 's|@''GNULIB_GETDELIM''@|1|g' \
	      -e 's|@''GNULIB_GETLINE''@|1|g' \
	      -e 's|@''GNULIB_OBSTACK_PRINTF''@|0|g' \
	      -e 's|@''GNULIB_OBSTACK_PRINTF_POSIX''@|0|g' \
	      -e 's|@''GNULIB_PERROR''@|1|g' \
	      -e 's|@''GNULIB_POPEN''@|0|g' \
	      -e 's|@''GNULIB_PRINTF''@|1|g' \
	      -e 's|@''GNULIB_PRINTF_POSIX''@|0|g' \
	      -e 's|@''GNULIB_PUTC''@|1|g' \
	      -e 's|@''GNULIB_PUTCHAR''@|1|g' \
	      -e 's|@''GNULIB_PUTS''@|1|g' \
	      -e 's|@''GNULIB_REMOVE''@|0|g' \
	      -e 's|@''GNULIB_RENAME''@|0|g' \
	      -e 's|@''GNULIB_RENAMEAT''@|0|g' \
	      -e 's|@''GNULIB_SNPRINTF''@|1|g' \
	      -e 's|@''GNULIB_SPRINTF_POSIX''@|0|g' \
	      -e 's|@''GNULIB_STDIO_H_SIGPIPE''@|0|g' \
	      -e 's|@''GNULIB_VASPRINTF''@|0|g' \
	      -e 's|@''GNULIB_VDPRINTF''@|0|g' \
	      -e 's|@''GNULIB_VFPRINTF''@|1|g' \
	      -e 's|@''GNULIB_VFPRINTF_POSIX''@|0|g' \
	      -e 's|@''GNULIB_VPRINTF''@|1|g' \
	      -e 's|@''GNULIB_VPRINTF_POSIX''@|0|g' \
	      -e 's|@''GNULIB_VSNPRINTF''@|1|g' \
	      -e 's|@''GNULIB_VSPRINTF_POSIX''@|0|g' \
	      < ./stdio.in.h | \
	  sed -e 's|@''HAVE_DECL_FPURGE''@|1|g' \
	      -e 's|@''HAVE_DECL_GETDELIM''@|1|g' \
	      -e 's|@''HAVE_DECL_GETLINE''@|1|g' \
	      -e 's|@''HAVE_DECL_OBSTACK_PRINTF''@|1|g' \
	      -e 's|@''HAVE_DECL_SNPRINTF''@|1|g' \
	      -e 's|@''HAVE_DECL_VSNPRINTF''@|1|g' \
	      -e 's|@''HAVE_DPRINTF''@|1|g' \
	      -e 's|@''HAVE_RENAMEAT''@|1|g' \
	      -e 's|@''HAVE_VASPRINTF''@|1|g' \
	      -e 's|@''HAVE_VDPRINTF''@|1|g' \
	      -e 's|@''REPLACE_DPRINTF''@|0|g' \
	      -e 's|@''REPLACE_FCLOSE''@|0|g' \
	      -e 's|@''REPLACE_FFLUSH''@|0|g' \
	      -e 's|@''REPLACE_FOPEN''@|0|g' \
	      -e 's|@''REPLACE_FPRINTF''@|0|g' \
	      -e 's|@''REPLACE_FPURGE''@|0|g' \
	      -e 's|@''REPLACE_FREOPEN''@|0|g' \
	      -e 's|@''REPLACE_FSEEK''@|0|g' \
	      -e 's|@''REPLACE_FSEEKO''@|0|g' \
	      -e 's|@''REPLACE_FTELL''@|0|g' \
	      -e 's|@''REPLACE_FTELLO''@|0|g' \
	      -e 's|@''REPLACE_GETDELIM''@|0|g' \
	      -e 's|@''REPLACE_GETLINE''@|0|g' \
	      -e 's|@''REPLACE_OBSTACK_PRINTF''@|0|g' \
	      -e 's|@''REPLACE_PERROR''@|0|g' \
	      -e 's|@''REPLACE_POPEN''@|0|g' \
	      -e 's|@''REPLACE_PRINTF''@|0|g' \
	      -e 's|@''REPLACE_REMOVE''@|0|g' \
	      -e 's|@''REPLACE_RENAME''@|0|g' \
	      -e 's|@''REPLACE_RENAMEAT''@|0|g' \
	      -e 's|@''REPLACE_SNPRINTF''@|0|g' \
	      -e 's|@''REPLACE_SPRINTF''@|0|g' \
	      -e 's|@''REPLACE_STDIO_WRITE_FUNCS''@|0|g' \
	      -e 's|@''REPLACE_VASPRINTF''@|0|g' \
	      -e 's|@''REPLACE_VDPRINTF''@|0|g' \
	      -e 's|@''REPLACE_VFPRINTF''@|0|g' \
	      -e 's|@''REPLACE_VPRINTF''@|0|g' \
	      -e 's|@''REPLACE_VSNPRINTF''@|0|g' \
	      -e 's|@''REPLACE_VSPRINTF''@|0|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h'; \
	} > stdio.h-t && \
	mv stdio.h-t stdio.h
rm -f stdlib.h-t stdlib.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
	  sed -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_STDLIB_H''@|<stdlib.h>|g' \
	      -e 's|@''GNULIB_ATOLL''@|0|g' \
	      -e 's|@''GNULIB_CALLOC_POSIX''@|0|g' \
	      -e 's|@''GNULIB_CANONICALIZE_FILE_NAME''@|0|g' \
	      -e 's|@''GNULIB_GETLOADAVG''@|0|g' \
	      -e 's|@''GNULIB_GETSUBOPT''@|0|g' \
	      -e 's|@''GNULIB_MALLOC_POSIX''@|1|g' \
	      -e 's|@''GNULIB_MKDTEMP''@|0|g' \
	      -e 's|@''GNULIB_MKOSTEMP''@|0|g' \
	      -e 's|@''GNULIB_MKOSTEMPS''@|0|g' \
	      -e 's|@''GNULIB_MKSTEMP''@|0|g' \
	      -e 's|@''GNULIB_MKSTEMPS''@|0|g' \
	      -e 's|@''GNULIB_PUTENV''@|0|g' \
	      -e 's|@''GNULIB_RANDOM_R''@|0|g' \
	      -e 's|@''GNULIB_REALLOC_POSIX''@|1|g' \
	      -e 's|@''GNULIB_REALPATH''@|0|g' \
	      -e 's|@''GNULIB_RPMATCH''@|0|g' \
	      -e 's|@''GNULIB_SETENV''@|0|g' \
	      -e 's|@''GNULIB_STRTOD''@|0|g' \
	      -e 's|@''GNULIB_STRTOLL''@|0|g' \
	      -e 's|@''GNULIB_STRTOULL''@|0|g' \
	      -e 's|@''GNULIB_UNSETENV''@|0|g' \
	      -e 's|@''HAVE_ATOLL''@|1|g' \
	      -e 's|@''HAVE_CALLOC_POSIX''@|1|g' \
	      -e 's|@''HAVE_CANONICALIZE_FILE_NAME''@|1|g' \
	      -e 's|@''HAVE_DECL_GETLOADAVG''@|1|g' \
	      -e 's|@''HAVE_GETSUBOPT''@|1|g' \
	      -e 's|@''HAVE_MALLOC_POSIX''@|1|g' \
	      -e 's|@''HAVE_MKDTEMP''@|1|g' \
	      -e 's|@''HAVE_MKOSTEMP''@|1|g' \
	      -e 's|@''HAVE_MKOSTEMPS''@|1|g' \
	      -e 's|@''HAVE_MKSTEMPS''@|1|g' \
	      -e 's|@''HAVE_RANDOM_H''@|0|g' \
	      -e 's|@''HAVE_RANDOM_R''@|1|g' \
	      -e 's|@''HAVE_REALLOC_POSIX''@|1|g' \
	      -e 's|@''HAVE_REALPATH''@|1|g' \
	      -e 's|@''HAVE_RPMATCH''@|1|g' \
	      -e 's|@''HAVE_SETENV''@|1|g' \
	      -e 's|@''HAVE_STRTOD''@|1|g' \
	      -e 's|@''HAVE_STRTOLL''@|1|g' \
	      -e 's|@''HAVE_STRTOULL''@|1|g' \
	      -e 's|@''HAVE_STRUCT_RANDOM_DATA''@|1|g' \
	      -e 's|@''HAVE_SYS_LOADAVG_H''@|0|g' \
	      -e 's|@''HAVE_UNSETENV''@|1|g' \
	      -e 's|@''REPLACE_CANONICALIZE_FILE_NAME''@|0|g' \
	      -e 's|@''REPLACE_MKSTEMP''@|0|g' \
	      -e 's|@''REPLACE_PUTENV''@|0|g' \
	      -e 's|@''REPLACE_REALPATH''@|0|g' \
	      -e 's|@''REPLACE_SETENV''@|0|g' \
	      -e 's|@''REPLACE_STRTOD''@|0|g' \
	      -e 's|@''REPLACE_UNSETENV''@|0|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./stdlib.in.h; \
	} > stdlib.h-t && \
	mv stdlib.h-t stdlib.h
rm -f string.h-t string.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
	  sed -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_STRING_H''@|<string.h>|g' \
	      -e 's|@''GNULIB_MBSLEN''@|0|g' \
	      -e 's|@''GNULIB_MBSNLEN''@|0|g' \
	      -e 's|@''GNULIB_MBSCHR''@|0|g' \
	      -e 's|@''GNULIB_MBSRCHR''@|0|g' \
	      -e 's|@''GNULIB_MBSSTR''@|0|g' \
	      -e 's|@''GNULIB_MBSCASECMP''@|0|g' \
	      -e 's|@''GNULIB_MBSNCASECMP''@|0|g' \
	      -e 's|@''GNULIB_MBSPCASECMP''@|0|g' \
	      -e 's|@''GNULIB_MBSCASESTR''@|0|g' \
	      -e 's|@''GNULIB_MBSCSPN''@|0|g' \
	      -e 's|@''GNULIB_MBSPBRK''@|0|g' \
	      -e 's|@''GNULIB_MBSSPN''@|0|g' \
	      -e 's|@''GNULIB_MBSSEP''@|0|g' \
	      -e 's|@''GNULIB_MBSTOK_R''@|0|g' \
	      -e 's|@''GNULIB_MEMCHR''@|1|g' \
	      -e 's|@''GNULIB_MEMMEM''@|1|g' \
	      -e 's|@''GNULIB_MEMPCPY''@|0|g' \
	      -e 's|@''GNULIB_MEMRCHR''@|0|g' \
	      -e 's|@''GNULIB_RAWMEMCHR''@|0|g' \
	      -e 's|@''GNULIB_STPCPY''@|0|g' \
	      -e 's|@''GNULIB_STPNCPY''@|0|g' \
	      -e 's|@''GNULIB_STRCHRNUL''@|0|g' \
	      -e 's|@''GNULIB_STRDUP''@|1|g' \
	      -e 's|@''GNULIB_STRNDUP''@|1|g' \
	      -e 's|@''GNULIB_STRNLEN''@|1|g' \
	      -e 's|@''GNULIB_STRPBRK''@|0|g' \
	      -e 's|@''GNULIB_STRSEP''@|1|g' \
	      -e 's|@''GNULIB_STRSTR''@|0|g' \
	      -e 's|@''GNULIB_STRCASESTR''@|1|g' \
	      -e 's|@''GNULIB_STRTOK_R''@|0|g' \
	      -e 's|@''GNULIB_STRERROR''@|1|g' \
	      -e 's|@''GNULIB_STRSIGNAL''@|0|g' \
	      -e 's|@''GNULIB_STRVERSCMP''@|0|g' \
	      < ./string.in.h | \
	  sed -e 's|@''HAVE_MBSLEN''@|0|g' \
	      -e 's|@''HAVE_DECL_MEMMEM''@|1|g' \
	      -e 's|@''HAVE_MEMPCPY''@|1|g' \
	      -e 's|@''HAVE_DECL_MEMRCHR''@|1|g' \
	      -e 's|@''HAVE_RAWMEMCHR''@|1|g' \
	      -e 's|@''HAVE_STPCPY''@|1|g' \
	      -e 's|@''HAVE_STPNCPY''@|1|g' \
	      -e 's|@''HAVE_STRCHRNUL''@|1|g' \
	      -e 's|@''HAVE_DECL_STRDUP''@|1|g' \
	      -e 's|@''HAVE_DECL_STRNDUP''@|1|g' \
	      -e 's|@''HAVE_DECL_STRNLEN''@|1|g' \
	      -e 's|@''HAVE_STRPBRK''@|1|g' \
	      -e 's|@''HAVE_STRSEP''@|1|g' \
	      -e 's|@''HAVE_STRCASESTR''@|1|g' \
	      -e 's|@''HAVE_DECL_STRTOK_R''@|1|g' \
	      -e 's|@''HAVE_DECL_STRERROR''@|1|g' \
	      -e 's|@''HAVE_DECL_STRSIGNAL''@|1|g' \
	      -e 's|@''HAVE_STRVERSCMP''@|1|g' \
	      -e 's|@''REPLACE_MEMCHR''@|1|g' \
	      -e 's|@''REPLACE_MEMMEM''@|0|g' \
	      -e 's|@''REPLACE_STRCASESTR''@|1|g' \
	      -e 's|@''REPLACE_STRDUP''@|0|g' \
	      -e 's|@''REPLACE_STRSTR''@|0|g' \
	      -e 's|@''REPLACE_STRERROR''@|0|g' \
	      -e 's|@''REPLACE_STRNDUP''@|0|g' \
	      -e 's|@''REPLACE_STRSIGNAL''@|0|g' \
	      -e 's|@''REPLACE_STRTOK_R''@|0|g' \
	      -e 's|@''UNDEFINE_STRTOK_R''@|0|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h'; \
	      < ./string.in.h; \
	} > string.h-t && \
	mv string.h-t string.h
rm -f strings.h-t strings.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
	  sed -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_STRINGS_H''@|<strings.h>|g' \
	      -e 's|@''HAVE_STRCASECMP''@|1|g' \
	      -e 's|@''HAVE_DECL_STRNCASECMP''@|1|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./strings.in.h; \
	} > strings.h-t && \
	mv strings.h-t strings.h
/bin/mkdir -p sys
rm -f sys/ioctl.h-t sys/ioctl.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''HAVE_SYS_IOCTL_H''@|1|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_SYS_IOCTL_H''@|<sys/ioctl.h>|g' \
	      -e 's|@''GNULIB_IOCTL''@|1|g' \
	      -e 's|@''SYS_IOCTL_H_HAVE_WINSOCK2_H''@|0|g' \
	      -e 's|@''SYS_IOCTL_H_HAVE_WINSOCK2_H_AND_USE_SOCKETS''@|0|g' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./sys_ioctl.in.h; \
	} > sys/ioctl.h-t && \
	mv sys/ioctl.h-t sys/ioctl.h
/bin/mkdir -p sys
rm -f sys/select.h-t sys/select.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_SYS_SELECT_H''@|<sys/select.h>|g' \
	      -e 's|@''HAVE_SYS_SELECT_H''@|1|g' \
	      -e 's|@''GNULIB_SELECT''@|1|g' \
	      -e 's|@''HAVE_WINSOCK2_H''@|0|g' \
	      -e 's|@''REPLACE_SELECT''@|0|g' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./sys_select.in.h; \
	} > sys/select.h-t && \
	mv sys/select.h-t sys/select.h
/bin/mkdir -p sys
rm -f sys/socket.h-t sys/socket.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_SYS_SOCKET_H''@|<sys/socket.h>|g' \
	      -e 's|@''HAVE_SYS_SOCKET_H''@|1|g' \
	      -e 's|@''GNULIB_CLOSE''@|1|g' \
	      -e 's|@''GNULIB_SOCKET''@|1|g' \
	      -e 's|@''GNULIB_CONNECT''@|1|g' \
	      -e 's|@''GNULIB_ACCEPT''@|1|g' \
	      -e 's|@''GNULIB_BIND''@|1|g' \
	      -e 's|@''GNULIB_GETPEERNAME''@|0|g' \
	      -e 's|@''GNULIB_GETSOCKNAME''@|1|g' \
	      -e 's|@''GNULIB_GETSOCKOPT''@|0|g' \
	      -e 's|@''GNULIB_LISTEN''@|1|g' \
	      -e 's|@''GNULIB_RECV''@|0|g' \
	      -e 's|@''GNULIB_SEND''@|0|g' \
	      -e 's|@''GNULIB_RECVFROM''@|0|g' \
	      -e 's|@''GNULIB_SENDTO''@|0|g' \
	      -e 's|@''GNULIB_SETSOCKOPT''@|1|g' \
	      -e 's|@''GNULIB_SHUTDOWN''@|0|g' \
	      -e 's|@''GNULIB_ACCEPT4''@|0|g' \
	      -e 's|@''HAVE_WINSOCK2_H''@|0|g' \
	      -e 's|@''HAVE_WS2TCPIP_H''@|0|g' \
	      -e 's|@''HAVE_STRUCT_SOCKADDR_STORAGE''@|1|g' \
	      -e 's|@''HAVE_SA_FAMILY_T''@|1|g' \
	      -e 's|@''HAVE_ACCEPT4''@|1|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./sys_socket.in.h; \
	} > sys/socket.h-t && \
	mv -f sys/socket.h-t sys/socket.h
/bin/mkdir -p sys
/bin/mkdir -p sys
/bin/mkdir -p sys
rm -f sys/stat.h-t sys/stat.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_SYS_STAT_H''@|<sys/stat.h>|g' \
	      -e 's|@''GNULIB_FCHMODAT''@|0|g' \
	      -e 's|@''GNULIB_FSTATAT''@|0|g' \
	      -e 's|@''GNULIB_FUTIMENS''@|0|g' \
	      -e 's|@''GNULIB_LCHMOD''@|0|g' \
	      -e 's|@''GNULIB_LSTAT''@|1|g' \
	      -e 's|@''GNULIB_MKDIRAT''@|0|g' \
	      -e 's|@''GNULIB_MKFIFO''@|0|g' \
	      -e 's|@''GNULIB_MKFIFOAT''@|0|g' \
	      -e 's|@''GNULIB_MKNOD''@|0|g' \
	      -e 's|@''GNULIB_MKNODAT''@|0|g' \
	      -e 's|@''GNULIB_STAT''@|1|g' \
	      -e 's|@''GNULIB_UTIMENSAT''@|0|g' \
	      -e 's|@''HAVE_FCHMODAT''@|1|g' \
	      -e 's|@''HAVE_FSTATAT''@|1|g' \
	      -e 's|@''HAVE_FUTIMENS''@|1|g' \
	      -e 's|@''HAVE_LCHMOD''@|1|g' \
	      -e 's|@''HAVE_LSTAT''@|1|g' \
	      -e 's|@''HAVE_MKDIRAT''@|1|g' \
	      -e 's|@''HAVE_MKFIFO''@|1|g' \
	      -e 's|@''HAVE_MKFIFOAT''@|1|g' \
	      -e 's|@''HAVE_MKNOD''@|1|g' \
	      -e 's|@''HAVE_MKNODAT''@|1|g' \
	      -e 's|@''HAVE_UTIMENSAT''@|1|g' \
	      -e 's|@''REPLACE_FSTAT''@|0|g' \
	      -e 's|@''REPLACE_FSTATAT''@|0|g' \
	      -e 's|@''REPLACE_FUTIMENS''@|0|g' \
	      -e 's|@''REPLACE_LSTAT''@|0|g' \
	      -e 's|@''REPLACE_MKDIR''@|0|g' \
	      -e 's|@''REPLACE_MKFIFO''@|0|g' \
	      -e 's|@''REPLACE_MKNOD''@|0|g' \
	      -e 's|@''REPLACE_STAT''@|1|g' \
	      -e 's|@''REPLACE_UTIMENSAT''@|0|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./sys_stat.in.h; \
	} > sys/stat.h-t && \
	mv sys/stat.h-t sys/stat.h
rm -f sys/time.h-t sys/time.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's/@''HAVE_SYS_TIME_H''@/1/g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_SYS_TIME_H''@|<sys/time.h>|g' \
	      -e 's/@''GNULIB_GETTIMEOFDAY''@/1/g' \
	      -e 's/@''HAVE_STRUCT_TIMEVAL''@/1/g' \
	      -e 's/@''REPLACE_GETTIMEOFDAY''@/1/g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./sys_time.in.h; \
	} > sys/time.h-t && \
	mv sys/time.h-t sys/time.h
rm -f sys/utsname.h-t sys/utsname.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's/@''HAVE_SYS_UTSNAME_H''@/1/g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_SYS_UTSNAME_H''@|<sys/utsname.h>|g' \
	      -e 's|@''GNULIB_UNAME''@|1|g' \
	      -e 's|@''HAVE_STRUCT_UTSNAME''@|1|g' \
	      -e 's|@''HAVE_UNAME''@|1|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./sys_utsname.in.h; \
	} > sys/utsname.h-t && \
	mv sys/utsname.h-t sys/utsname.h
rm -f time.h-t time.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
	  sed -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@NEXT_TIME_H''@|<time.h>|g' \
	      -e 's|@REPLACE_LOCALTIME_R''@|0|g' \
	      -e 's|@REPLACE_MKTIME''@|1|g' \
	      -e 's|@REPLACE_NANOSLEEP''@|GNULIB_PORTCHECK|g' \
	      -e 's|@REPLACE_STRPTIME''@|0|g' \
	      -e 's|@REPLACE_TIMEGM''@|1|g' \
	      -e 's|@SYS_TIME_H_DEFINES_STRUCT_TIMESPEC''@|0|g' \
	      -e 's|@TIME_H_DEFINES_STRUCT_TIMESPEC''@|1|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      < ./time.in.h; \
	} > time.h-t && \
	mv time.h-t time.h
rm -f unistd.h-t unistd.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''HAVE_UNISTD_H''@|1|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_UNISTD_H''@|<unistd.h>|g' \
	      -e 's|@''GNULIB_CHOWN''@|0|g' \
	      -e 's|@''GNULIB_CLOSE''@|1|g' \
	      -e 's|@''GNULIB_DUP2''@|1|g' \
	      -e 's|@''GNULIB_DUP3''@|0|g' \
	      -e 's|@''GNULIB_ENVIRON''@|0|g' \
	      -e 's|@''GNULIB_EUIDACCESS''@|0|g' \
	      -e 's|@''GNULIB_FACCESSAT''@|0|g' \
	      -e 's|@''GNULIB_FCHDIR''@|0|g' \
	      -e 's|@''GNULIB_FCHOWNAT''@|0|g' \
	      -e 's|@''GNULIB_FSYNC''@|0|g' \
	      -e 's|@''GNULIB_FTRUNCATE''@|0|g' \
	      -e 's|@''GNULIB_GETCWD''@|0|g' \
	      -e 's|@''GNULIB_GETDOMAINNAME''@|0|g' \
	      -e 's|@''GNULIB_GETDTABLESIZE''@|0|g' \
	      -e 's|@''GNULIB_GETGROUPS''@|0|g' \
	      -e 's|@''GNULIB_GETHOSTNAME''@|1|g' \
	      -e 's|@''GNULIB_GETLOGIN''@|0|g' \
	      -e 's|@''GNULIB_GETLOGIN_R''@|0|g' \
	      -e 's|@''GNULIB_GETPAGESIZE''@|1|g' \
	      -e 's|@''GNULIB_GETUSERSHELL''@|0|g' \
	      -e 's|@''GNULIB_LCHOWN''@|0|g' \
	      -e 's|@''GNULIB_LINK''@|0|g' \
	      -e 's|@''GNULIB_LINKAT''@|0|g' \
	      -e 's|@''GNULIB_LSEEK''@|1|g' \
	      -e 's|@''GNULIB_PIPE2''@|0|g' \
	      -e 's|@''GNULIB_PREAD''@|0|g' \
	      -e 's|@''GNULIB_READLINK''@|0|g' \
	      -e 's|@''GNULIB_READLINKAT''@|0|g' \
	      -e 's|@''GNULIB_RMDIR''@|0|g' \
	      -e 's|@''GNULIB_SLEEP''@|1|g' \
	      -e 's|@''GNULIB_SYMLINK''@|1|g' \
	      -e 's|@''GNULIB_SYMLINKAT''@|0|g' \
	      -e 's|@''GNULIB_UNISTD_H_GETOPT''@|0|g' \
	      -e 's|@''GNULIB_UNISTD_H_SIGPIPE''@|0|g' \
	      -e 's|@''GNULIB_UNLINK''@|0|g' \
	      -e 's|@''GNULIB_UNLINKAT''@|0|g' \
	      -e 's|@''GNULIB_USLEEP''@|0|g' \
	      -e 's|@''GNULIB_WRITE''@|1|g' \
	      < ./unistd.in.h | \
	  sed -e 's|@''HAVE_CHOWN''@|1|g' \
	      -e 's|@''HAVE_DUP2''@|1|g' \
	      -e 's|@''HAVE_DUP3''@|1|g' \
	      -e 's|@''HAVE_EUIDACCESS''@|1|g' \
	      -e 's|@''HAVE_FACCESSAT''@|1|g' \
	      -e 's|@''HAVE_FCHOWNAT''@|1|g' \
	      -e 's|@''HAVE_FSYNC''@|1|g' \
	      -e 's|@''HAVE_FTRUNCATE''@|1|g' \
	      -e 's|@''HAVE_GETDOMAINNAME''@|1|g' \
	      -e 's|@''HAVE_GETDTABLESIZE''@|1|g' \
	      -e 's|@''HAVE_GETGROUPS''@|1|g' \
	      -e 's|@''HAVE_GETHOSTNAME''@|1|g' \
	      -e 's|@''HAVE_GETLOGIN''@|1|g' \
	      -e 's|@''HAVE_GETPAGESIZE''@|1|g' \
	      -e 's|@''HAVE_GETUSERSHELL''@|1|g' \
	      -e 's|@''HAVE_LCHOWN''@|1|g' \
	      -e 's|@''HAVE_LINK''@|1|g' \
	      -e 's|@''HAVE_LINKAT''@|1|g' \
	      -e 's|@''HAVE_PIPE2''@|1|g' \
	      -e 's|@''HAVE_PREAD''@|1|g' \
	      -e 's|@''HAVE_READLINK''@|1|g' \
	      -e 's|@''HAVE_READLINKAT''@|1|g' \
	      -e 's|@''HAVE_SLEEP''@|1|g' \
	      -e 's|@''HAVE_SYMLINK''@|1|g' \
	      -e 's|@''HAVE_SYMLINKAT''@|1|g' \
	      -e 's|@''HAVE_UNLINKAT''@|1|g' \
	      -e 's|@''HAVE_USLEEP''@|1|g' \
	      -e 's|@''HAVE_DECL_ENVIRON''@|1|g' \
	      -e 's|@''HAVE_DECL_GETLOGIN_R''@|1|g' \
	      -e 's|@''HAVE_OS_H''@|0|g' \
	      -e 's|@''HAVE_SYS_PARAM_H''@|0|g' \
	      -e 's|@''REPLACE_CHOWN''@|0|g' \
	      -e 's|@''REPLACE_CLOSE''@|0|g' \
	      -e 's|@''REPLACE_DUP''@|0|g' \
	      -e 's|@''REPLACE_DUP2''@|1|g' \
	      -e 's|@''REPLACE_FCHDIR''@|0|g' \
	      -e 's|@''REPLACE_FCHOWNAT''@|0|g' \
	      -e 's|@''REPLACE_GETCWD''@|0|g' \
	      -e 's|@''REPLACE_GETGROUPS''@|0|g' \
	      -e 's|@''REPLACE_GETPAGESIZE''@|0|g' \
	      -e 's|@''REPLACE_LCHOWN''@|0|g' \
	      -e 's|@''REPLACE_LINK''@|0|g' \
	      -e 's|@''REPLACE_LINKAT''@|0|g' \
	      -e 's|@''REPLACE_LSEEK''@|0|g' \
	      -e 's|@''REPLACE_PREAD''@|0|g' \
	      -e 's|@''REPLACE_READLINK''@|0|g' \
	      -e 's|@''REPLACE_RMDIR''@|0|g' \
	      -e 's|@''REPLACE_SLEEP''@|1|g' \
	      -e 's|@''REPLACE_SYMLINK''@|1|g' \
	      -e 's|@''REPLACE_UNLINK''@|0|g' \
	      -e 's|@''REPLACE_UNLINKAT''@|0|g' \
	      -e 's|@''REPLACE_USLEEP''@|0|g' \
	      -e 's|@''REPLACE_WRITE''@|0|g' \
	      -e 's|@''UNISTD_H_HAVE_WINSOCK2_H''@|0|g' \
	      -e 's|@''UNISTD_H_HAVE_WINSOCK2_H_AND_USE_SOCKETS''@|0|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h'; \
	} > unistd.h-t && \
	mv unistd.h-t unistd.h
rm -f wchar.h-t wchar.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_WCHAR_H''@|<wchar.h>|g' \
	      -e 's|@''HAVE_WCHAR_H''@|1|g' \
	      -e 's|@''GNULIB_BTOWC''@|1|g' \
	      -e 's|@''GNULIB_WCTOB''@|1|g' \
	      -e 's|@''GNULIB_MBSINIT''@|1|g' \
	      -e 's|@''GNULIB_MBRTOWC''@|1|g' \
	      -e 's|@''GNULIB_MBRLEN''@|0|g' \
	      -e 's|@''GNULIB_MBSRTOWCS''@|0|g' \
	      -e 's|@''GNULIB_MBSNRTOWCS''@|0|g' \
	      -e 's|@''GNULIB_WCRTOMB''@|1|g' \
	      -e 's|@''GNULIB_WCSRTOMBS''@|0|g' \
	      -e 's|@''GNULIB_WCSNRTOMBS''@|0|g' \
	      -e 's|@''GNULIB_WCWIDTH''@|0|g' \
	      -e 's|@''HAVE_WINT_T''@|1|g' \
	      -e 's|@''HAVE_BTOWC''@|1|g' \
	      -e 's|@''HAVE_MBSINIT''@|1|g' \
	      -e 's|@''HAVE_MBRTOWC''@|1|g' \
	      -e 's|@''HAVE_MBRLEN''@|1|g' \
	      -e 's|@''HAVE_MBSRTOWCS''@|1|g' \
	      -e 's|@''HAVE_MBSNRTOWCS''@|1|g' \
	      -e 's|@''HAVE_WCRTOMB''@|1|g' \
	      -e 's|@''HAVE_WCSRTOMBS''@|1|g' \
	      -e 's|@''HAVE_WCSNRTOMBS''@|1|g' \
	      -e 's|@''HAVE_DECL_WCTOB''@|1|g' \
	      -e 's|@''HAVE_DECL_WCWIDTH''@|1|g' \
	      -e 's|@''REPLACE_MBSTATE_T''@|0|g' \
	      -e 's|@''REPLACE_BTOWC''@|0|g' \
	      -e 's|@''REPLACE_WCTOB''@|0|g' \
	      -e 's|@''REPLACE_MBSINIT''@|0|g' \
	      -e 's|@''REPLACE_MBRTOWC''@|0|g' \
	      -e 's|@''REPLACE_MBRLEN''@|0|g' \
	      -e 's|@''REPLACE_MBSRTOWCS''@|0|g' \
	      -e 's|@''REPLACE_MBSNRTOWCS''@|0|g' \
	      -e 's|@''REPLACE_WCRTOMB''@|0|g' \
	      -e 's|@''REPLACE_WCSRTOMBS''@|0|g' \
	      -e 's|@''REPLACE_WCSNRTOMBS''@|0|g' \
	      -e 's|@''REPLACE_WCWIDTH''@|0|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	    < ./wchar.in.h; \
	} > wchar.h-t && \
	mv wchar.h-t wchar.h
make  all-recursive
make[3]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/libmissing'
Making all in tests
make[4]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/libmissing/tests'
rm -f arg-nonnull.h-t arg-nonnull.h && \
	sed -n -e '/GL_ARG_NONNULL/,$p' \
	  < ../.././arg-nonnull.h \
	  > arg-nonnull.h-t && \
	mv arg-nonnull.h-t arg-nonnull.h
rm -f warn-on-use.h-t warn-on-use.h && \
	sed -n -e '/^.ifndef/,$p' \
	  < ../.././warn-on-use.h \
	  > warn-on-use.h-t && \
	mv warn-on-use.h-t warn-on-use.h
rm -f fcntl.h-t fcntl.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''NEXT_FCNTL_H''@|<fcntl.h>|g' \
	      -e 's|@''GNULIB_FCNTL''@|0|g' \
	      -e 's|@''GNULIB_OPEN''@|1|g' \
	      -e 's|@''GNULIB_OPENAT''@|0|g' \
	      -e 's|@''HAVE_FCNTL''@|1|g' \
	      -e 's|@''HAVE_OPENAT''@|1|g' \
	      -e 's|@''REPLACE_FCNTL''@|0|g' \
	      -e 's|@''REPLACE_OPEN''@|0|g' \
	      -e 's|@''REPLACE_OPENAT''@|0|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < ./fcntl.in.h; \
	} > fcntl.h-t && \
	mv fcntl.h-t fcntl.h
make  all-recursive
make[5]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/libmissing/tests'
make[6]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/libmissing/tests'
make[6]: Nothing to be done for `all-am'.
make[6]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/libmissing/tests'
make[5]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/libmissing/tests'
make[4]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/libmissing/tests'
make[4]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/libmissing'
depbase=3D`echo c-ctype.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT c-ctype.lo -MD -MP -MF $dep=
base.Tpo -c -o c-ctype.lo c-ctype.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo close-hook.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT close-hook.lo -MD -MP -MF $=
depbase.Tpo -c -o close-hook.lo close-hook.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo localcharset.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT localcharset.lo -MD -MP -MF=
 $depbase.Tpo -c -o localcharset.lo localcharset.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo printf-frexp.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT printf-frexp.lo -MD -MP -MF=
 $depbase.Tpo -c -o printf-frexp.lo printf-frexp.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo printf-frexpl.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT printf-frexpl.lo -MD -MP -M=
F $depbase.Tpo -c -o printf-frexpl.lo printf-frexpl.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo sockets.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT sockets.lo -MD -MP -MF $dep=
base.Tpo -c -o sockets.lo sockets.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo asnprintf.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT asnprintf.lo -MD -MP -MF $d=
epbase.Tpo -c -o asnprintf.lo asnprintf.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo dup2.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT dup2.lo -MD -MP -MF $depbas=
e.Tpo -c -o dup2.lo dup2.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo gettimeofday.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT gettimeofday.lo -MD -MP -MF=
 $depbase.Tpo -c -o gettimeofday.lo gettimeofday.c &&\
	mv -f $depbase.Tpo $depbase.Plo
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT c-ctype.lo -MD -MP -MF .deps/c-ctype.Tpo -c c-ctype.c  -fPIC -D=
PIC -o .libs/c-ctype.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT localcharset.lo -MD -MP -MF .deps/localcharset.Tpo -c localchar=
set.c  -fPIC -DPIC -o .libs/localcharset.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT printf-frexp.lo -MD -MP -MF .deps/printf-frexp.Tpo -c printf-fr=
exp.c  -fPIC -DPIC -o .libs/printf-frexp.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT dup2.lo -MD -MP -MF .deps/dup2.Tpo -c dup2.c  -fPIC -DPIC -o .l=
ibs/dup2.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT asnprintf.lo -MD -MP -MF .deps/asnprintf.Tpo -c asnprintf.c  -f=
PIC -DPIC -o .libs/asnprintf.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT sockets.lo -MD -MP -MF .deps/sockets.Tpo -c sockets.c  -fPIC -D=
PIC -o .libs/sockets.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT gettimeofday.lo -MD -MP -MF .deps/gettimeofday.Tpo -c gettimeof=
day.c  -fPIC -DPIC -o .libs/gettimeofday.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT close-hook.lo -MD -MP -MF .deps/close-hook.Tpo -c close-hook.c =
 -fPIC -DPIC -o .libs/close-hook.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT printf-frexpl.lo -MD -MP -MF .deps/printf-frexpl.Tpo -c printf-=
frexpl.c  -fPIC -DPIC -o .libs/printf-frexpl.o
depbase=3D`echo memchr.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT memchr.lo -MD -MP -MF $depb=
ase.Tpo -c -o memchr.lo memchr.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo mktime.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT mktime.lo -MD -MP -MF $depb=
ase.Tpo -c -o mktime.lo mktime.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo printf-args.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT printf-args.lo -MD -MP -MF =
$depbase.Tpo -c -o printf-args.lo printf-args.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo printf-parse.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT printf-parse.lo -MD -MP -MF=
 $depbase.Tpo -c -o printf-parse.lo printf-parse.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo regex.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT regex.lo -MD -MP -MF $depba=
se.Tpo -c -o regex.lo regex.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo signbitd.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT signbitd.lo -MD -MP -MF $de=
pbase.Tpo -c -o signbitd.lo signbitd.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo signbitf.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT signbitf.lo -MD -MP -MF $de=
pbase.Tpo -c -o signbitf.lo signbitf.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo signbitl.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT signbitl.lo -MD -MP -MF $de=
pbase.Tpo -c -o signbitl.lo signbitl.c &&\
	mv -f $depbase.Tpo $depbase.Plo
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT memchr.lo -MD -MP -MF .deps/memchr.Tpo -c memchr.c  -fPIC -DPIC=
 -o .libs/memchr.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT printf-args.lo -MD -MP -MF .deps/printf-args.Tpo -c printf-args=
.c  -fPIC -DPIC -o .libs/printf-args.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT mktime.lo -MD -MP -MF .deps/mktime.Tpo -c mktime.c  -fPIC -DPIC=
 -o .libs/mktime.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT regex.lo -MD -MP -MF .deps/regex.Tpo -c regex.c  -fPIC -DPIC -o=
 .libs/regex.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT signbitd.lo -MD -MP -MF .deps/signbitd.Tpo -c signbitd.c  -fPIC=
 -DPIC -o .libs/signbitd.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT printf-parse.lo -MD -MP -MF .deps/printf-parse.Tpo -c printf-pa=
rse.c  -fPIC -DPIC -o .libs/printf-parse.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT signbitf.lo -MD -MP -MF .deps/signbitf.Tpo -c signbitf.c  -fPIC=
 -DPIC -o .libs/signbitf.o
depbase=3D`echo sleep.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT sleep.lo -MD -MP -MF $depba=
se.Tpo -c -o sleep.lo sleep.c &&\
	mv -f $depbase.Tpo $depbase.Plo
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT signbitl.lo -MD -MP -MF .deps/signbitl.Tpo -c signbitl.c  -fPIC=
 -DPIC -o .libs/signbitl.o
depbase=3D`echo stat.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT stat.lo -MD -MP -MF $depbas=
e.Tpo -c -o stat.lo stat.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo strcasestr.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT strcasestr.lo -MD -MP -MF $=
depbase.Tpo -c -o strcasestr.lo strcasestr.c &&\
	mv -f $depbase.Tpo $depbase.Plo
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT sleep.lo -MD -MP -MF .deps/sleep.Tpo -c sleep.c  -fPIC -DPIC -o=
 .libs/sleep.o
depbase=3D`echo strnlen.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT strnlen.lo -MD -MP -MF $dep=
base.Tpo -c -o strnlen.lo strnlen.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo timegm.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT timegm.lo -MD -MP -MF $depb=
ase.Tpo -c -o timegm.lo timegm.c &&\
	mv -f $depbase.Tpo $depbase.Plo
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT stat.lo -MD -MP -MF .deps/stat.Tpo -c stat.c  -fPIC -DPIC -o .l=
ibs/stat.o
depbase=3D`echo vasnprintf.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT vasnprintf.lo -MD -MP -MF $=
depbase.Tpo -c -o vasnprintf.lo vasnprintf.c &&\
	mv -f $depbase.Tpo $depbase.Plo
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT strcasestr.lo -MD -MP -MF .deps/strcasestr.Tpo -c strcasestr.c =
 -fPIC -DPIC -o .libs/strcasestr.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT strnlen.lo -MD -MP -MF .deps/strnlen.Tpo -c strnlen.c  -fPIC -D=
PIC -o .libs/strnlen.o
rm -f t-charset.alias charset.alias && \
	/bin/sh ./config.charset 'arm-angstrom-linux-gnueabi' > t-charset.alias &&=
 \
	mv t-charset.alias charset.alias
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT timegm.lo -MD -MP -MF .deps/timegm.Tpo -c timegm.c  -fPIC -DPIC=
 -o .libs/timegm.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT vasnprintf.lo -MD -MP -MF .deps/vasnprintf.Tpo -c vasnprintf.c =
 -fPIC -DPIC -o .libs/vasnprintf.o
rm -f t-ref-add.sed ref-add.sed && \
	sed -e '/^#/d' -e 's/@''PACKAGE''@/libprelude/g' ref-add.sin > t-ref-add.s=
ed && \
	mv t-ref-add.sed ref-add.sed
rm -f t-ref-del.sed ref-del.sed && \
	sed -e '/^#/d' -e 's/@''PACKAGE''@/libprelude/g' ref-del.sin > t-ref-del.s=
ed && \
	mv t-ref-del.sed ref-del.sed
depbase=3D`echo glthread/cond.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT glthread/cond.lo -MD -MP -M=
F $depbase.Tpo -c -o glthread/cond.lo glthread/cond.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo glthread/lock.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT glthread/lock.lo -MD -MP -M=
F $depbase.Tpo -c -o glthread/lock.lo glthread/lock.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo glthread/thread.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT glthread/thread.lo -MD -MP =
-MF $depbase.Tpo -c -o glthread/thread.lo glthread/thread.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo glthread/threadlib.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;=
\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT glthread/threadlib.lo -MD -=
MP -MF $depbase.Tpo -c -o glthread/threadlib.lo glthread/threadlib.c &&\
	mv -f $depbase.Tpo $depbase.Plo
depbase=3D`echo glthread/tls.lo | sed 's|[^/]*$|.deps/&|;s|\.lo$||'`;\
	/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompil=
e arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -DNO_XMALLOC -I. -I..     -fexpensive-optimizations -fomit-=
frame-pointer -frename-registers -O2 -ggdb2 -MT glthread/tls.lo -MD -MP -MF=
 $depbase.Tpo -c -o glthread/tls.lo glthread/tls.c &&\
	mv -f $depbase.Tpo $depbase.Plo
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT glthread/lock.lo -MD -MP -MF glthread/.deps/lock.Tpo -c glthrea=
d/lock.c  -fPIC -DPIC -o glthread/.libs/lock.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT glthread/cond.lo -MD -MP -MF glthread/.deps/cond.Tpo -c glthrea=
d/cond.c  -fPIC -DPIC -o glthread/.libs/cond.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT glthread/thread.lo -MD -MP -MF glthread/.deps/thread.Tpo -c glt=
hread/thread.c  -fPIC -DPIC -o glthread/.libs/thread.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT glthread/threadlib.lo -MD -MP -MF glthread/.deps/threadlib.Tpo =
-c glthread/threadlib.c  -fPIC -DPIC -o glthread/.libs/threadlib.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -DNO_XMALLOC -I.=
 -I.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2=
 -ggdb2 -MT glthread/tls.lo -MD -MP -MF glthread/.deps/tls.Tpo -c glthread/=
tls.c  -fPIC -DPIC -o glthread/.libs/tls.o
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dlink ar=
m-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dne=
on -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home/vdub=
hack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99  -fex=
pensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2  -=
Wl,-O1 -Wl,--hash-style=3Dgnu -o libmissing.la  c-ctype.lo close-hook.lo gl=
thread/cond.lo localcharset.lo glthread/lock.lo printf-frexp.lo printf-frex=
pl.lo sockets.lo glthread/thread.lo glthread/threadlib.lo glthread/tls.lo a=
snprintf.lo dup2.lo gettimeofday.lo memchr.lo mktime.lo printf-args.lo prin=
tf-parse.lo regex.lo signbitd.lo signbitf.lo signbitl.lo sleep.lo stat.lo s=
trcasestr.lo strnlen.lo timegm.lo vasnprintf.lo  -ldl=20
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-ar cru=
 .libs/libmissing.a .libs/c-ctype.o .libs/close-hook.o glthread/.libs/cond.=
o .libs/localcharset.o glthread/.libs/lock.o .libs/printf-frexp.o .libs/pri=
ntf-frexpl.o .libs/sockets.o glthread/.libs/thread.o glthread/.libs/threadl=
ib.o glthread/.libs/tls.o .libs/asnprintf.o .libs/dup2.o .libs/gettimeofday=
.o .libs/memchr.o .libs/mktime.o .libs/printf-args.o .libs/printf-parse.o .=
libs/regex.o .libs/signbitd.o .libs/signbitf.o .libs/signbitl.o .libs/sleep=
.o .libs/stat.o .libs/strcasestr.o .libs/strnlen.o .libs/timegm.o .libs/vas=
nprintf.o=20
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-ranlib=
 .libs/libmissing.a
arm-angstrom-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f "libmissing=
.la" && ln -s "../libmissing.la" "libmissing.la" )
make[4]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/libmissing'
make[3]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/libmissing'
make[2]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/libmissing'
Making all in m4
make[2]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/m4'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/m4'
Making all in src
make[2]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/src'
make  all-recursive
make[3]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/src'
Making all in libprelude-error
make[4]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/src/libprelude-error'
LANG=3D"" gawk -f ./mkstrtable.awk -v textidx=3D3 \
		./err-sources.h.in >err-sources.h
LANG=3D"" gawk -f ./mkstrtable.awk -v textidx=3D3 \
	./err-codes.h.in >err-codes.h
LANG=3D"" gawk -f ./mkerrcodes1.awk ./errnos.in >_mkerrcodes.h
LANG=3D"" gawk -f ./mkerrnos.awk ./errnos.in >code-to-errno.h
LANG=3D"" gawk -f ./mkstrtable.awk -v textidx=3D2 -v nogettext=3D1 \
	./err-sources.h.in >err-sources-sym.h
LANG=3D"" gawk -f ./mkstrtable.awk -v textidx=3D2 -v nogettext=3D1 \
		./err-codes.h.in >err-codes-sym.h
LANG=3D"" gawk -f ./mkstrtable.awk -v textidx=3D2 -v nogettext=3D1 \
	-v prefix=3DPRELUDE_ERROR_ -v namespace=3Derrnos_ \
	./errnos.in >errnos-sym.h
LANG=3D"" gawk -f ./mkheader.awk \
		./err-sources.h.in \
		./err-codes.h.in \
		./errnos.in \
		./prelude-error.h.in > prelude-error.h
arm-angstrom-linux-gnueabi-gcc -E --sysroot=3D/home/vdubhack/overo-oe/tmp/s=
ysroots/armv7a-angstrom-linux-gnueabi _mkerrcodes.h | grep PRELUDE_ERROR_ |=
 LANG=3D"" gawk -f ./mkerrcodes.awk >mkerrcodes.h
rm _mkerrcodes.h
cc -I. -I. -o mkerrcodes ./mkerrcodes.c
./mkerrcodes | LANG=3D"" gawk -f ./mkerrcodes2.awk >code-from-errno.h
make  all-am
make[5]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/src/libprelude-error'
/bin/sh ../../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcomp=
ile arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfp=
u=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/hom=
e/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99=
 -DHAVE_CONFIG_H -I. -I../..  -Wall -Wstrict-prototypes -Wmissing-prototype=
s -Wmissing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnes=
ted-externs -Wunused -Wformat -Wformat-security -I../../libmissing -I../../=
src/include -I../../src/include   -fexpensive-optimizations -fomit-frame-po=
inter -frename-registers -O2 -ggdb2 -MT prelude-error.lo -MD -MP -MF .deps/=
prelude-error.Tpo -c -o prelude-error.lo prelude-error.c
/bin/sh ../../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcomp=
ile arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfp=
u=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/hom=
e/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99=
 -DHAVE_CONFIG_H -I. -I../..  -Wall -Wstrict-prototypes -Wmissing-prototype=
s -Wmissing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnes=
ted-externs -Wunused -Wformat -Wformat-security -I../../libmissing -I../../=
src/include -I../../src/include   -fexpensive-optimizations -fomit-frame-po=
inter -frename-registers -O2 -ggdb2 -MT strsource.lo -MD -MP -MF .deps/strs=
ource.Tpo -c -o strsource.lo strsource.c
/bin/sh ../../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcomp=
ile arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfp=
u=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/hom=
e/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99=
 -DHAVE_CONFIG_H -I. -I../..  -Wall -Wstrict-prototypes -Wmissing-prototype=
s -Wmissing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnes=
ted-externs -Wunused -Wformat -Wformat-security -I../../libmissing -I../../=
src/include -I../../src/include   -fexpensive-optimizations -fomit-frame-po=
inter -frename-registers -O2 -ggdb2 -MT strerror.lo -MD -MP -MF .deps/strer=
ror.Tpo -c -o strerror.lo strerror.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I../.. -Wal=
l -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-fun=
ction-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wfo=
rmat-security -I../../libmissing -I../../src/include -I../../src/include -f=
expensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 =
-MT strerror.lo -MD -MP -MF .deps/strerror.Tpo -c strerror.c  -fPIC -DPIC -=
o .libs/strerror.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I../.. -Wal=
l -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-fun=
ction-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wfo=
rmat-security -I../../libmissing -I../../src/include -I../../src/include -f=
expensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 =
-MT strsource.lo -MD -MP -MF .deps/strsource.Tpo -c strsource.c  -fPIC -DPI=
C -o .libs/strsource.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I../.. -Wal=
l -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-fun=
ction-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wfo=
rmat-security -I../../libmissing -I../../src/include -I../../src/include -f=
expensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 =
-MT prelude-error.lo -MD -MP -MF .deps/prelude-error.Tpo -c prelude-error.c=
  -fPIC -DPIC -o .libs/prelude-error.o
mv -f .deps/strsource.Tpo .deps/strsource.Plo
mv -f .deps/strerror.Tpo .deps/strerror.Plo
mv -f .deps/prelude-error.Tpo .deps/prelude-error.Plo
/bin/sh ../../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dlink=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
 -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggd=
b2 -no-undefined -Wl,-O1 -Wl,--hash-style=3Dgnu -o libprelude-error.la  pre=
lude-error.lo strsource.lo strerror.lo  -ldl=20
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-ar cru=
 .libs/libprelude-error.a .libs/prelude-error.o .libs/strsource.o .libs/str=
error.o=20
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-ranlib=
 .libs/libprelude-error.a
arm-angstrom-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f "libprelude=
-error.la" && ln -s "../libprelude-error.la" "libprelude-error.la" )
make[5]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/src/libprelude-error'
make[4]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/src/libprelude-error'
Making all in include
make[4]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/src/include'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/src/include'
make[4]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/src'
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
common.lo -MD -MP -MF .deps/common.Tpo -c -o common.lo common.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
config-engine.lo -MD -MP -MF .deps/config-engine.Tpo -c -o config-engine.lo=
 config-engine.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
daemonize.lo -MD -MP -MF .deps/daemonize.Tpo -c -o daemonize.lo daemonize.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
ntp.lo -MD -MP -MF .deps/ntp.Tpo -c -o ntp.lo ntp.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
tls-auth.lo -MD -MP -MF .deps/tls-auth.Tpo -c -o tls-auth.lo tls-auth.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
tls-util.lo -MD -MP -MF .deps/tls-util.Tpo -c -o tls-util.lo tls-util.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
variable.lo -MD -MP -MF .deps/variable.Tpo -c -o variable.lo variable.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
prelude.lo -MD -MP -MF .deps/prelude.Tpo -c -o prelude.lo prelude.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
prelude-async.lo -MD -MP -MF .deps/prelude-async.Tpo -c -o prelude-async.lo=
 prelude-async.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT config-engine.lo -MD -MP -MF .deps/confi=
g-engine.Tpo -c config-engine.c  -fPIC -DPIC -o .libs/config-engine.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT daemonize.lo -MD -MP -MF .deps/daemonize=
.Tpo -c daemonize.c  -fPIC -DPIC -o .libs/daemonize.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT prelude.lo -MD -MP -MF .deps/prelude.Tpo=
 -c prelude.c  -fPIC -DPIC -o .libs/prelude.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT variable.lo -MD -MP -MF .deps/variable.T=
po -c variable.c  -fPIC -DPIC -o .libs/variable.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT ntp.lo -MD -MP -MF .deps/ntp.Tpo -c ntp.=
c  -fPIC -DPIC -o .libs/ntp.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT prelude-async.lo -MD -MP -MF .deps/prelu=
de-async.Tpo -c prelude-async.c  -fPIC -DPIC -o .libs/prelude-async.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT common.lo -MD -MP -MF .deps/common.Tpo -=
c common.c  -fPIC -DPIC -o .libs/common.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT tls-util.lo -MD -MP -MF .deps/tls-util.T=
po -c tls-util.c  -fPIC -DPIC -o .libs/tls-util.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT tls-auth.lo -MD -MP -MF .deps/tls-auth.T=
po -c tls-auth.c  -fPIC -DPIC -o .libs/tls-auth.o
mv -f .deps/ntp.Tpo .deps/ntp.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
prelude-client.lo -MD -MP -MF .deps/prelude-client.Tpo -c -o prelude-client=
.lo prelude-client.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT prelude-client.lo -MD -MP -MF .deps/prel=
ude-client.Tpo -c prelude-client.c  -fPIC -DPIC -o .libs/prelude-client.o
mv -f .deps/variable.Tpo .deps/variable.Plo
mv -f .deps/daemonize.Tpo .deps/daemonize.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
prelude-client-profile.lo -MD -MP -MF .deps/prelude-client-profile.Tpo -c -=
o prelude-client-profile.lo prelude-client-profile.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
prelude-connection.lo -MD -MP -MF .deps/prelude-connection.Tpo -c -o prelud=
e-connection.lo prelude-connection.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT prelude-client-profile.lo -MD -MP -MF .d=
eps/prelude-client-profile.Tpo -c prelude-client-profile.c  -fPIC -DPIC -o =
.libs/prelude-client-profile.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT prelude-connection.lo -MD -MP -MF .deps/=
prelude-connection.Tpo -c prelude-connection.c  -fPIC -DPIC -o .libs/prelud=
e-connection.o
mv -f .deps/tls-util.Tpo .deps/tls-util.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
prelude-connection-pool.lo -MD -MP -MF .deps/prelude-connection-pool.Tpo -c=
 -o prelude-connection-pool.lo prelude-connection-pool.c
prelude-client.c: In function 'prelude_client_init':
prelude-client.c:1351:9: warning: new qualifiers in middle of multi-level n=
on-const cast are unsafe
mv -f .deps/prelude.Tpo .deps/prelude.Plo
mv -f .deps/prelude-async.Tpo .deps/prelude-async.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
prelude-failover.lo -MD -MP -MF .deps/prelude-failover.Tpo -c -o prelude-fa=
ilover.lo prelude-failover.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
prelude-hash.lo -MD -MP -MF .deps/prelude-hash.Tpo -c -o prelude-hash.lo pr=
elude-hash.c
mv -f .deps/tls-auth.Tpo .deps/tls-auth.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
prelude-ident.lo -MD -MP -MF .deps/prelude-ident.Tpo -c -o prelude-ident.lo=
 prelude-ident.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT prelude-connection-pool.lo -MD -MP -MF .=
deps/prelude-connection-pool.Tpo -c prelude-connection-pool.c  -fPIC -DPIC =
-o .libs/prelude-connection-pool.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT prelude-failover.lo -MD -MP -MF .deps/pr=
elude-failover.Tpo -c prelude-failover.c  -fPIC -DPIC -o .libs/prelude-fail=
over.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT prelude-hash.lo -MD -MP -MF .deps/prelud=
e-hash.Tpo -c prelude-hash.c  -fPIC -DPIC -o .libs/prelude-hash.o
mv -f .deps/common.Tpo .deps/common.Plo
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT prelude-ident.lo -MD -MP -MF .deps/prelu=
de-ident.Tpo -c prelude-ident.c  -fPIC -DPIC -o .libs/prelude-ident.o
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
prelude-io.lo -MD -MP -MF .deps/prelude-io.Tpo -c -o prelude-io.lo prelude-=
io.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT prelude-io.lo -MD -MP -MF .deps/prelude-=
io.Tpo -c prelude-io.c  -fPIC -DPIC -o .libs/prelude-io.o
mv -f .deps/prelude-ident.Tpo .deps/prelude-ident.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
prelude-log.lo -MD -MP -MF .deps/prelude-log.Tpo -c -o prelude-log.lo prelu=
de-log.c
mv -f .deps/config-engine.Tpo .deps/config-engine.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
prelude-msg.lo -MD -MP -MF .deps/prelude-msg.Tpo -c -o prelude-msg.lo prelu=
de-msg.c
mv -f .deps/prelude-hash.Tpo .deps/prelude-hash.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
prelude-msgbuf.lo -MD -MP -MF .deps/prelude-msgbuf.Tpo -c -o prelude-msgbuf=
.lo prelude-msgbuf.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT prelude-log.lo -MD -MP -MF .deps/prelude=
-log.Tpo -c prelude-log.c  -fPIC -DPIC -o .libs/prelude-log.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT prelude-msg.lo -MD -MP -MF .deps/prelude=
-msg.Tpo -c prelude-msg.c  -fPIC -DPIC -o .libs/prelude-msg.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT prelude-msgbuf.lo -MD -MP -MF .deps/prel=
ude-msgbuf.Tpo -c prelude-msgbuf.c  -fPIC -DPIC -o .libs/prelude-msgbuf.o
mv -f .deps/prelude-client-profile.Tpo .deps/prelude-client-profile.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
prelude-option.lo -MD -MP -MF .deps/prelude-option.Tpo -c -o prelude-option=
.lo prelude-option.c
mv -f .deps/prelude-failover.Tpo .deps/prelude-failover.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
prelude-option-wide.lo -MD -MP -MF .deps/prelude-option-wide.Tpo -c -o prel=
ude-option-wide.lo prelude-option-wide.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT prelude-option.lo -MD -MP -MF .deps/prel=
ude-option.Tpo -c prelude-option.c  -fPIC -DPIC -o .libs/prelude-option.o
mv -f .deps/prelude-msgbuf.Tpo .deps/prelude-msgbuf.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
prelude-plugin.lo -MD -MP -MF .deps/prelude-plugin.Tpo -c -o prelude-plugin=
.lo prelude-plugin.c
mv -f .deps/prelude-log.Tpo .deps/prelude-log.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
prelude-string.lo -MD -MP -MF .deps/prelude-string.Tpo -c -o prelude-string=
.lo prelude-string.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT prelude-option-wide.lo -MD -MP -MF .deps=
/prelude-option-wide.Tpo -c prelude-option-wide.c  -fPIC -DPIC -o .libs/pre=
lude-option-wide.o
mv -f .deps/prelude-connection.Tpo .deps/prelude-connection.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
prelude-timer.lo -MD -MP -MF .deps/prelude-timer.Tpo -c -o prelude-timer.lo=
 prelude-timer.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT prelude-string.lo -MD -MP -MF .deps/prel=
ude-string.Tpo -c prelude-string.c  -fPIC -DPIC -o .libs/prelude-string.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT prelude-plugin.lo -MD -MP -MF .deps/prel=
ude-plugin.Tpo -c prelude-plugin.c  -fPIC -DPIC -o .libs/prelude-plugin.o
mv -f .deps/prelude-io.Tpo .deps/prelude-io.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
prelude-thread.lo -MD -MP -MF .deps/prelude-thread.Tpo -c -o prelude-thread=
.lo prelude-thread.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT prelude-timer.lo -MD -MP -MF .deps/prelu=
de-timer.Tpo -c prelude-timer.c  -fPIC -DPIC -o .libs/prelude-timer.o
prelude-option-wide.c: In function 'read_option_request':
prelude-option-wide.c:280:25: warning: new qualifiers in middle of multi-le=
vel non-const cast are unsafe
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT prelude-thread.lo -MD -MP -MF .deps/prel=
ude-thread.Tpo -c prelude-thread.c  -fPIC -DPIC -o .libs/prelude-thread.o
mv -f .deps/prelude-msg.Tpo .deps/prelude-msg.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
idmef-additional-data.lo -MD -MP -MF .deps/idmef-additional-data.Tpo -c -o =
idmef-additional-data.lo idmef-additional-data.c
mv -f .deps/prelude-client.Tpo .deps/prelude-client.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
idmef-class.lo -MD -MP -MF .deps/idmef-class.Tpo -c -o idmef-class.lo idmef=
-class.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT idmef-additional-data.lo -MD -MP -MF .de=
ps/idmef-additional-data.Tpo -c idmef-additional-data.c  -fPIC -DPIC -o .li=
bs/idmef-additional-data.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT idmef-class.lo -MD -MP -MF .deps/idmef-c=
lass.Tpo -c idmef-class.c  -fPIC -DPIC -o .libs/idmef-class.o
mv -f .deps/prelude-connection-pool.Tpo .deps/prelude-connection-pool.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
idmef-criteria.lo -MD -MP -MF .deps/idmef-criteria.Tpo -c -o idmef-criteria=
.lo idmef-criteria.c
prelude-option-wide.c: In function 'prelude_option_process_request':
prelude-option-wide.c:245:15: warning: 'request' may be used uninitialized =
in this function
mv -f .deps/prelude-thread.Tpo .deps/prelude-thread.Plo
make idmef-criteria-string.yac.lo CFLAGS=3D"-fexpensive-optimizations -fomi=
t-frame-pointer -frename-registers -O2 -ggdb2 -include ../config.h" IDMEF_C=
RITERIA_STRING_YAC_LO=3Ddummy-idmef-criteria-string.yac.lo
mv -f .deps/prelude-timer.Tpo .deps/prelude-timer.Plo
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT idmef-criteria.lo -MD -MP -MF .deps/idme=
f-criteria.Tpo -c idmef-criteria.c  -fPIC -DPIC -o .libs/idmef-criteria.o
make idmef-criteria-string.lex.lo CFLAGS=3D"-fexpensive-optimizations -fomi=
t-frame-pointer -frename-registers -O2 -ggdb2 -include ../config.h" IDMEF_C=
RITERIA_STRING_LEX_LO=3Ddummy-idmef-criteria-string.lex.lo
make[5]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/src'
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -inc=
lude ../config.h -MT idmef-criteria-string.yac.lo -MD -MP -MF .deps/idmef-c=
riteria-string.yac.Tpo -c -o idmef-criteria-string.yac.lo idmef-criteria-st=
ring.yac.c
make[5]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/src'
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -inc=
lude ../config.h -MT idmef-criteria-string.lex.lo -MD -MP -MF .deps/idmef-c=
riteria-string.lex.Tpo -c -o idmef-criteria-string.lex.lo idmef-criteria-st=
ring.lex.c
mv -f .deps/prelude-option-wide.Tpo .deps/prelude-option-wide.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
idmef-criterion-value.lo -MD -MP -MF .deps/idmef-criterion-value.Tpo -c -o =
idmef-criterion-value.lo idmef-criterion-value.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -include ../config.h -MT idmef-criteria-stri=
ng.yac.lo -MD -MP -MF .deps/idmef-criteria-string.yac.Tpo -c idmef-criteria=
-string.yac.c  -fPIC -DPIC -o .libs/idmef-criteria-string.yac.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -include ../config.h -MT idmef-criteria-stri=
ng.lex.lo -MD -MP -MF .deps/idmef-criteria-string.lex.Tpo -c idmef-criteria=
-string.lex.c  -fPIC -DPIC -o .libs/idmef-criteria-string.lex.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT idmef-criterion-value.lo -MD -MP -MF .de=
ps/idmef-criterion-value.Tpo -c idmef-criterion-value.c  -fPIC -DPIC -o .li=
bs/idmef-criterion-value.o
mv -f .deps/prelude-plugin.Tpo .deps/prelude-plugin.Plo
idmef-criteria-string.lex.c:1451:17: warning: 'yyunput' defined but not use=
d
idmef-criteria-string.lex.c:1492:16: warning: 'input' defined but not used
idmef-criteria-string.lex.c:1947:16: warning: 'yy_top_state' defined but no=
t used
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
idmef-data.lo -MD -MP -MF .deps/idmef-data.Tpo -c -o idmef-data.lo idmef-da=
ta.c
mv -f .deps/idmef-class.Tpo .deps/idmef-class.Plo
mv -f .deps/prelude-string.Tpo .deps/prelude-string.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
idmef-message-helpers.lo -MD -MP -MF .deps/idmef-message-helpers.Tpo -c -o =
idmef-message-helpers.lo idmef-message-helpers.c
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
idmef-message-print.lo -MD -MP -MF .deps/idmef-message-print.Tpo -c -o idme=
f-message-print.lo idmef-message-print.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT idmef-data.lo -MD -MP -MF .deps/idmef-da=
ta.Tpo -c idmef-data.c  -fPIC -DPIC -o .libs/idmef-data.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT idmef-message-helpers.lo -MD -MP -MF .de=
ps/idmef-message-helpers.Tpo -c idmef-message-helpers.c  -fPIC -DPIC -o .li=
bs/idmef-message-helpers.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT idmef-message-print.lo -MD -MP -MF .deps=
/idmef-message-print.Tpo -c idmef-message-print.c  -fPIC -DPIC -o .libs/idm=
ef-message-print.o
mv -f .deps/idmef-additional-data.Tpo .deps/idmef-additional-data.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
idmef-message-read.lo -MD -MP -MF .deps/idmef-message-read.Tpo -c -o idmef-=
message-read.lo idmef-message-read.c
mv -f .deps/idmef-criteria.Tpo .deps/idmef-criteria.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
idmef-message-write.lo -MD -MP -MF .deps/idmef-message-write.Tpo -c -o idme=
f-message-write.lo idmef-message-write.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT idmef-message-read.lo -MD -MP -MF .deps/=
idmef-message-read.Tpo -c idmef-message-read.c  -fPIC -DPIC -o .libs/idmef-=
message-read.o
mv -f .deps/idmef-message-helpers.Tpo .deps/idmef-message-helpers.Plo
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT idmef-message-write.lo -MD -MP -MF .deps=
/idmef-message-write.Tpo -c idmef-message-write.c  -fPIC -DPIC -o .libs/idm=
ef-message-write.o
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
idmef-path.lo -MD -MP -MF .deps/idmef-path.Tpo -c -o idmef-path.lo idmef-pa=
th.c
mv -f .deps/prelude-option.Tpo .deps/prelude-option.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
idmef-time.lo -MD -MP -MF .deps/idmef-time.Tpo -c -o idmef-time.lo idmef-ti=
me.c
mv -f .deps/idmef-criteria-string.yac.Tpo .deps/idmef-criteria-string.yac.P=
lo
make[5]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/src'
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
idmef-tree-wrap.lo -MD -MP -MF .deps/idmef-tree-wrap.Tpo -c -o idmef-tree-w=
rap.lo idmef-tree-wrap.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT idmef-path.lo -MD -MP -MF .deps/idmef-pa=
th.Tpo -c idmef-path.c  -fPIC -DPIC -o .libs/idmef-path.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT idmef-tree-wrap.lo -MD -MP -MF .deps/idm=
ef-tree-wrap.Tpo -c idmef-tree-wrap.c  -fPIC -DPIC -o .libs/idmef-tree-wrap=
.o
mv -f .deps/idmef-criterion-value.Tpo .deps/idmef-criterion-value.Plo
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT idmef-time.lo -MD -MP -MF .deps/idmef-ti=
me.Tpo -c idmef-time.c  -fPIC -DPIC -o .libs/idmef-time.o
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
idmef-value.lo -MD -MP -MF .deps/idmef-value.Tpo -c -o idmef-value.lo idmef=
-value.c
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT idmef-value.lo -MD -MP -MF .deps/idmef-v=
alue.Tpo -c idmef-value.c  -fPIC -DPIC -o .libs/idmef-value.o
mv -f .deps/idmef-criteria-string.lex.Tpo .deps/idmef-criteria-string.lex.P=
lo
make[5]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/src'
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcompile=
 arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 =
-DHAVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -W=
missing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-=
externs -Wunused -Wformat -Wformat-security -I./include -I.. -I../src/inclu=
de -I./libprelude-error -I../libmissing -I../libmissing     -I/home/vdubhac=
k/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include    -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT =
idmef-value-type.lo -MD -MP -MF .deps/idmef-value-type.Tpo -c -o idmef-valu=
e-type.lo idmef-value-type.c
mv -f .deps/idmef-data.Tpo .deps/idmef-data.Plo
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-gc=
c -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I.. -Wall -=
Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wbad-functi=
on-cast -Wcast-qual -Wcast-align -Wnested-externs -Wunused -Wformat -Wforma=
t-security -I./include -I.. -I../src/include -I./libprelude-error -I../libm=
issing -I../libmissing -I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include -fexpensive-optimizations -fomit-frame-pointer=
 -frename-registers -O2 -ggdb2 -MT idmef-value-type.lo -MD -MP -MF .deps/id=
mef-value-type.Tpo -c idmef-value-type.c  -fPIC -DPIC -o .libs/idmef-value-=
type.o
mv -f .deps/idmef-time.Tpo .deps/idmef-time.Plo
mv -f .deps/idmef-value-type.Tpo .deps/idmef-value-type.Plo
mv -f .deps/idmef-path.Tpo .deps/idmef-path.Plo
mv -f .deps/idmef-message-print.Tpo .deps/idmef-message-print.Plo
mv -f .deps/idmef-message-write.Tpo .deps/idmef-message-write.Plo
mv -f .deps/idmef-message-read.Tpo .deps/idmef-message-read.Plo
mv -f .deps/idmef-value.Tpo .deps/idmef-value.Plo
mv -f .deps/idmef-tree-wrap.Tpo .deps/idmef-tree-wrap.Plo
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dlink ar=
m-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dne=
on -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home/vdub=
hack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99  -fex=
pensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2   =
       -no-undefined -version-info 21:1:19 -export-symbols-regex "^(idmef|_=
?prelude)_" -Wl,-O1 -Wl,--hash-style=3Dgnu -o libprelude.la -rpath /usr/lib=
 common.lo config-engine.lo daemonize.lo ntp.lo tls-auth.lo tls-util.lo var=
iable.lo prelude.lo prelude-async.lo prelude-client.lo prelude-client-profi=
le.lo prelude-connection.lo prelude-connection-pool.lo prelude-failover.lo =
prelude-hash.lo prelude-ident.lo prelude-io.lo prelude-log.lo prelude-msg.l=
o prelude-msgbuf.lo prelude-option.lo prelude-option-wide.lo prelude-plugin=
.lo prelude-string.lo prelude-timer.lo prelude-thread.lo idmef-additional-d=
ata.lo idmef-class.lo idmef-criteria.lo idmef-criteria-string.yac.lo idmef-=
criteria-string.lex.lo idmef-criterion-value.lo idmef-data.lo idmef-message=
-helpers.lo idmef-message-print.lo idmef-message-read.lo idmef-message-writ=
e.lo idmef-path.lo idmef-time.lo idmef-tree-wrap.lo idmef-value.lo idmef-va=
lue-type.lo -lgnutls   -L/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/lib -lgcrypt -lgpg-error -lltdl ../libmissing/libmissi=
ng.la libprelude-error/libprelude-error.la -ldl=20
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libz.la' seems to be mo=
ved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgcrypt.la' seems to =
be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgpg-error.la' seems =
to be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgpg-error.la' seems =
to be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgpg-error.la' seems =
to be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgpg-error.la' seems =
to be moved
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-nm  .l=
ibs/common.o .libs/config-engine.o .libs/daemonize.o .libs/ntp.o .libs/tls-=
auth.o .libs/tls-util.o .libs/variable.o .libs/prelude.o .libs/prelude-asyn=
c.o .libs/prelude-client.o .libs/prelude-client-profile.o .libs/prelude-con=
nection.o .libs/prelude-connection-pool.o .libs/prelude-failover.o .libs/pr=
elude-hash.o .libs/prelude-ident.o .libs/prelude-io.o .libs/prelude-log.o .=
libs/prelude-msg.o .libs/prelude-msgbuf.o .libs/prelude-option.o .libs/prel=
ude-option-wide.o .libs/prelude-plugin.o .libs/prelude-string.o .libs/prelu=
de-timer.o .libs/prelude-thread.o .libs/idmef-additional-data.o .libs/idmef=
-class.o .libs/idmef-criteria.o .libs/idmef-criteria-string.yac.o .libs/idm=
ef-criteria-string.lex.o .libs/idmef-criterion-value.o .libs/idmef-data.o .=
libs/idmef-message-helpers.o .libs/idmef-message-print.o .libs/idmef-messag=
e-read.o .libs/idmef-message-write.o .libs/idmef-path.o .libs/idmef-time.o =
.libs/idmef-tree-wrap.o .libs/idmef-value.o .libs/idmef-value-type.o   ../l=
ibmissing/.libs/libmissing.a libprelude-error/.libs/libprelude-error.a | se=
d -n -e 's/^.*[	 ]\([ABCDGIRSTW][ABCDGIRSTW]*\)[	 ][	 ]*\([_A-Za-z][_A-Za-z=
0-9]*\)$/\1 \2 \2/p' | sed '/ __gnu_lto/d' | /bin/sed 's/.* //' | sort | un=
iq > .libs/libprelude.exp
arm-angstrom-linux-gnueabi-libtool: link: /bin/grep -E -e "^(idmef|_?prelud=
e)_" ".libs/libprelude.exp" > ".libs/libprelude.expT"
arm-angstrom-linux-gnueabi-libtool: link: mv -f ".libs/libprelude.expT" ".l=
ibs/libprelude.exp"
arm-angstrom-linux-gnueabi-libtool: link: echo "{ global:" > .libs/libprelu=
de.ver
arm-angstrom-linux-gnueabi-libtool: link:  cat .libs/libprelude.exp | sed -=
e "s/\(.*\)/\1;/" >> .libs/libprelude.ver
arm-angstrom-linux-gnueabi-libtool: link:  echo "local: *; };" >> .libs/lib=
prelude.ver
arm-angstrom-linux-gnueabi-libtool: link:  arm-angstrom-linux-gnueabi-gcc -=
march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthum=
b-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/arm=
v7a-angstrom-linux-gnueabi -shared  -fPIC -DPIC  .libs/common.o .libs/confi=
g-engine.o .libs/daemonize.o .libs/ntp.o .libs/tls-auth.o .libs/tls-util.o =
.libs/variable.o .libs/prelude.o .libs/prelude-async.o .libs/prelude-client=
.o .libs/prelude-client-profile.o .libs/prelude-connection.o .libs/prelude-=
connection-pool.o .libs/prelude-failover.o .libs/prelude-hash.o .libs/prelu=
de-ident.o .libs/prelude-io.o .libs/prelude-log.o .libs/prelude-msg.o .libs=
/prelude-msgbuf.o .libs/prelude-option.o .libs/prelude-option-wide.o .libs/=
prelude-plugin.o .libs/prelude-string.o .libs/prelude-timer.o .libs/prelude=
-thread.o .libs/idmef-additional-data.o .libs/idmef-class.o .libs/idmef-cri=
teria.o .libs/idmef-criteria-string.yac.o .libs/idmef-criteria-string.lex.o=
 .libs/idmef-criterion-value.o .libs/idmef-data.o .libs/idmef-message-helpe=
rs.o .libs/idmef-message-print.o .libs/idmef-message-read.o .libs/idmef-mes=
sage-write.o .libs/idmef-path.o .libs/idmef-time.o .libs/idmef-tree-wrap.o =
.libs/idmef-value.o .libs/idmef-value-type.o  -Wl,--whole-archive ../libmis=
sing/.libs/libmissing.a libprelude-error/.libs/libprelude-error.a -Wl,--no-=
whole-archive  -Wl,-rpath -Wl,/usr/lib /home/vdubhack/overo-oe/tmp/sysroots=
/armv7a-angstrom-linux-gnueabi/usr/lib/libgnutls.so -L/home/vdubhack/overo-=
oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib -L=3D/usr/lib /home/v=
dubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libz.so=
 /home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib=
/libgcrypt.so /home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gn=
ueabi/usr/lib/libgpg-error.so /home/vdubhack/overo-oe/tmp/sysroots/armv7a-a=
ngstrom-linux-gnueabi/usr/lib/libltdl.so -ldl  -march=3Darmv7-a -mtune=3Dco=
rtex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sy=
sroot=3D/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi =
-O2 -Wl,-O1 -Wl,--hash-style=3Dgnu   -Wl,-soname -Wl,libprelude.so.2 -Wl,-v=
ersion-script -Wl,.libs/libprelude.ver -o .libs/libprelude.so.2.19.1
arm-angstrom-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "libprelude.=
so.2" && ln -s "libprelude.so.2.19.1" "libprelude.so.2")
arm-angstrom-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "libprelude.=
so" && ln -s "libprelude.so.2.19.1" "libprelude.so")
arm-angstrom-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f "libprelude=
.la" && ln -s "../libprelude.la" "libprelude.la" )
make[4]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/src'
make[3]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/src'
make[2]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/src'
Making all in prelude-admin
make[2]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/prelude-admin'
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home/vd=
ubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DH=
AVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmis=
sing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-ext=
erns -Wunused -Wformat -Wformat-security -I../src/include -I../src/include =
-I../libmissing -I../libmissing -I../src/libprelude-error        -fexpensiv=
e-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT prel=
ude-admin.o -MD -MP -MF .deps/prelude-admin.Tpo -c -o prelude-admin.o prelu=
de-admin.c
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home/vd=
ubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DH=
AVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmis=
sing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-ext=
erns -Wunused -Wformat -Wformat-security -I../src/include -I../src/include =
-I../libmissing -I../libmissing -I../src/libprelude-error        -fexpensiv=
e-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT serv=
er.o -MD -MP -MF .deps/server.Tpo -c -o server.o server.c
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home/vd=
ubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99 -DH=
AVE_CONFIG_H -I. -I..  -Wall -Wstrict-prototypes -Wmissing-prototypes -Wmis=
sing-declarations -Wbad-function-cast -Wcast-qual -Wcast-align -Wnested-ext=
erns -Wunused -Wformat -Wformat-security -I../src/include -I../src/include =
-I../libmissing -I../libmissing -I../src/libprelude-error        -fexpensiv=
e-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -MT tls-=
register.o -MD -MP -MF .deps/tls-register.Tpo -c -o tls-register.o tls-regi=
ster.c
server.c: In function 'setup_server':
server.c:312:30: warning: cast increases required alignment of target type
mv -f .deps/server.Tpo .deps/server.Po
mv -f .deps/tls-register.Tpo .deps/tls-register.Po
mv -f .deps/prelude-admin.Tpo .deps/prelude-admin.Po
/bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dlink ar=
m-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dne=
on -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home/vdub=
hack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -std=3Dgnu99  -fex=
pensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2  -=
Wl,-O1 -Wl,--hash-style=3Dgnu -o prelude-admin prelude-admin.o server.o tls=
-register.o ../src/config-engine.lo ../src/variable.lo ../src/libprelude.la=
 ../libmissing/libmissing.la      -ldl=20
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-gcc -m=
arch=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb=
-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/armv=
7a-angstrom-linux-gnueabi -std=3Dgnu99 -fexpensive-optimizations -fomit-fra=
me-pointer -frename-registers -O2 -ggdb2 -Wl,-O1 -Wl,--hash-style=3Dgnu -o =
.libs/prelude-admin prelude-admin.o server.o tls-register.o ../src/.libs/co=
nfig-engine.o ../src/.libs/variable.o  ../src/.libs/libprelude.so -L=3D/usr=
/lib -L/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/u=
sr/lib /home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/u=
sr/lib/libgnutls.so /home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-li=
nux-gnueabi/usr/lib/libz.so /home/vdubhack/overo-oe/tmp/sysroots/armv7a-ang=
strom-linux-gnueabi/usr/lib/libgcrypt.so /home/vdubhack/overo-oe/tmp/sysroo=
ts/armv7a-angstrom-linux-gnueabi/usr/lib/libgpg-error.so /home/vdubhack/ove=
ro-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libltdl.so ../libm=
issing/.libs/libmissing.a -ldl
make[2]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/prelude-admin'
Making all in bindings
make[2]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/bindings'
Making all in c++
make[3]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/c++'
Making all in include
make[4]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/c++/include'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/c++/include'
make[4]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/c++'
/bin/sh ../../arm-angstrom-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dco=
mpile arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -m=
fpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/h=
ome/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CON=
FIG_H -I. -I../..  -I../.. -I../../src/include -I../../src/include -I../../=
src/libprelude-error -I../../bindings/c++/include -I../../bindings/c++/incl=
ude    -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O=
2 -ggdb2 -fpermissive -fvisibility-inlines-hidden -MT libpreludecpp_la-prel=
ude-error.lo -MD -MP -MF .deps/libpreludecpp_la-prelude-error.Tpo -c -o lib=
preludecpp_la-prelude-error.lo `test -f 'prelude-error.cxx' || echo './'`pr=
elude-error.cxx
/bin/sh ../../arm-angstrom-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dco=
mpile arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -m=
fpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/h=
ome/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CON=
FIG_H -I. -I../..  -I../.. -I../../src/include -I../../src/include -I../../=
src/libprelude-error -I../../bindings/c++/include -I../../bindings/c++/incl=
ude    -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O=
2 -ggdb2 -fpermissive -fvisibility-inlines-hidden -MT libpreludecpp_la-idme=
f.lo -MD -MP -MF .deps/libpreludecpp_la-idmef.Tpo -c -o libpreludecpp_la-id=
mef.lo `test -f 'idmef.cxx' || echo './'`idmef.cxx
/bin/sh ../../arm-angstrom-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dco=
mpile arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -m=
fpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/h=
ome/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CON=
FIG_H -I. -I../..  -I../.. -I../../src/include -I../../src/include -I../../=
src/libprelude-error -I../../bindings/c++/include -I../../bindings/c++/incl=
ude    -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O=
2 -ggdb2 -fpermissive -fvisibility-inlines-hidden -MT libpreludecpp_la-idme=
f-criteria.lo -MD -MP -MF .deps/libpreludecpp_la-idmef-criteria.Tpo -c -o l=
ibpreludecpp_la-idmef-criteria.lo `test -f 'idmef-criteria.cxx' || echo './=
'`idmef-criteria.cxx
/bin/sh ../../arm-angstrom-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dco=
mpile arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -m=
fpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/h=
ome/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CON=
FIG_H -I. -I../..  -I../.. -I../../src/include -I../../src/include -I../../=
src/libprelude-error -I../../bindings/c++/include -I../../bindings/c++/incl=
ude    -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O=
2 -ggdb2 -fpermissive -fvisibility-inlines-hidden -MT libpreludecpp_la-idme=
f-path.lo -MD -MP -MF .deps/libpreludecpp_la-idmef-path.Tpo -c -o libprelud=
ecpp_la-idmef-path.lo `test -f 'idmef-path.cxx' || echo './'`idmef-path.cxx
/bin/sh ../../arm-angstrom-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dco=
mpile arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -m=
fpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/h=
ome/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CON=
FIG_H -I. -I../..  -I../.. -I../../src/include -I../../src/include -I../../=
src/libprelude-error -I../../bindings/c++/include -I../../bindings/c++/incl=
ude    -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O=
2 -ggdb2 -fpermissive -fvisibility-inlines-hidden -MT libpreludecpp_la-idme=
f-time.lo -MD -MP -MF .deps/libpreludecpp_la-idmef-time.Tpo -c -o libprelud=
ecpp_la-idmef-time.lo `test -f 'idmef-time.cxx' || echo './'`idmef-time.cxx
/bin/sh ../../arm-angstrom-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dco=
mpile arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -m=
fpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/h=
ome/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CON=
FIG_H -I. -I../..  -I../.. -I../../src/include -I../../src/include -I../../=
src/libprelude-error -I../../bindings/c++/include -I../../bindings/c++/incl=
ude    -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O=
2 -ggdb2 -fpermissive -fvisibility-inlines-hidden -MT libpreludecpp_la-idme=
f-value.lo -MD -MP -MF .deps/libpreludecpp_la-idmef-value.Tpo -c -o libprel=
udecpp_la-idmef-value.lo `test -f 'idmef-value.cxx' || echo './'`idmef-valu=
e.cxx
/bin/sh ../../arm-angstrom-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dco=
mpile arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -m=
fpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/h=
ome/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CON=
FIG_H -I. -I../..  -I../.. -I../../src/include -I../../src/include -I../../=
src/libprelude-error -I../../bindings/c++/include -I../../bindings/c++/incl=
ude    -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O=
2 -ggdb2 -fpermissive -fvisibility-inlines-hidden -MT libpreludecpp_la-prel=
ude.lo -MD -MP -MF .deps/libpreludecpp_la-prelude.Tpo -c -o libpreludecpp_l=
a-prelude.lo `test -f 'prelude.cxx' || echo './'`prelude.cxx
/bin/sh ../../arm-angstrom-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dco=
mpile arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -m=
fpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/h=
ome/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CON=
FIG_H -I. -I../..  -I../.. -I../../src/include -I../../src/include -I../../=
src/libprelude-error -I../../bindings/c++/include -I../../bindings/c++/incl=
ude    -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O=
2 -ggdb2 -fpermissive -fvisibility-inlines-hidden -MT libpreludecpp_la-prel=
ude-client.lo -MD -MP -MF .deps/libpreludecpp_la-prelude-client.Tpo -c -o l=
ibpreludecpp_la-prelude-client.lo `test -f 'prelude-client.cxx' || echo './=
'`prelude-client.cxx
/bin/sh ../../arm-angstrom-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dco=
mpile arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -m=
fpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/h=
ome/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CON=
FIG_H -I. -I../..  -I../.. -I../../src/include -I../../src/include -I../../=
src/libprelude-error -I../../bindings/c++/include -I../../bindings/c++/incl=
ude    -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O=
2 -ggdb2 -fpermissive -fvisibility-inlines-hidden -MT libpreludecpp_la-prel=
ude-client-easy.lo -MD -MP -MF .deps/libpreludecpp_la-prelude-client-easy.T=
po -c -o libpreludecpp_la-prelude-client-easy.lo `test -f 'prelude-client-e=
asy.cxx' || echo './'`prelude-client-easy.cxx
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-g+=
+ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I../.. -I../.. -I../../s=
rc/include -I../../src/include -I../../src/libprelude-error -I../../binding=
s/c++/include -I../../bindings/c++/include -fexpensive-optimizations -fomit=
-frame-pointer -frename-registers -O2 -ggdb2 -fpermissive -fvisibility-inli=
nes-hidden -MT libpreludecpp_la-idmef.lo -MD -MP -MF .deps/libpreludecpp_la=
-idmef.Tpo -c idmef.cxx  -fPIC -DPIC -o .libs/libpreludecpp_la-idmef.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-g+=
+ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I../.. -I../.. -I../../s=
rc/include -I../../src/include -I../../src/libprelude-error -I../../binding=
s/c++/include -I../../bindings/c++/include -fexpensive-optimizations -fomit=
-frame-pointer -frename-registers -O2 -ggdb2 -fpermissive -fvisibility-inli=
nes-hidden -MT libpreludecpp_la-idmef-criteria.lo -MD -MP -MF .deps/libprel=
udecpp_la-idmef-criteria.Tpo -c idmef-criteria.cxx  -fPIC -DPIC -o .libs/li=
bpreludecpp_la-idmef-criteria.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-g+=
+ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I../.. -I../.. -I../../s=
rc/include -I../../src/include -I../../src/libprelude-error -I../../binding=
s/c++/include -I../../bindings/c++/include -fexpensive-optimizations -fomit=
-frame-pointer -frename-registers -O2 -ggdb2 -fpermissive -fvisibility-inli=
nes-hidden -MT libpreludecpp_la-idmef-path.lo -MD -MP -MF .deps/libpreludec=
pp_la-idmef-path.Tpo -c idmef-path.cxx  -fPIC -DPIC -o .libs/libpreludecpp_=
la-idmef-path.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-g+=
+ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I../.. -I../.. -I../../s=
rc/include -I../../src/include -I../../src/libprelude-error -I../../binding=
s/c++/include -I../../bindings/c++/include -fexpensive-optimizations -fomit=
-frame-pointer -frename-registers -O2 -ggdb2 -fpermissive -fvisibility-inli=
nes-hidden -MT libpreludecpp_la-idmef-value.lo -MD -MP -MF .deps/libprelude=
cpp_la-idmef-value.Tpo -c idmef-value.cxx  -fPIC -DPIC -o .libs/libpreludec=
pp_la-idmef-value.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-g+=
+ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I../.. -I../.. -I../../s=
rc/include -I../../src/include -I../../src/libprelude-error -I../../binding=
s/c++/include -I../../bindings/c++/include -fexpensive-optimizations -fomit=
-frame-pointer -frename-registers -O2 -ggdb2 -fpermissive -fvisibility-inli=
nes-hidden -MT libpreludecpp_la-prelude-error.lo -MD -MP -MF .deps/libprelu=
decpp_la-prelude-error.Tpo -c prelude-error.cxx  -fPIC -DPIC -o .libs/libpr=
eludecpp_la-prelude-error.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-g+=
+ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I../.. -I../.. -I../../s=
rc/include -I../../src/include -I../../src/libprelude-error -I../../binding=
s/c++/include -I../../bindings/c++/include -fexpensive-optimizations -fomit=
-frame-pointer -frename-registers -O2 -ggdb2 -fpermissive -fvisibility-inli=
nes-hidden -MT libpreludecpp_la-idmef-time.lo -MD -MP -MF .deps/libpreludec=
pp_la-idmef-time.Tpo -c idmef-time.cxx  -fPIC -DPIC -o .libs/libpreludecpp_=
la-idmef-time.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-g+=
+ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I../.. -I../.. -I../../s=
rc/include -I../../src/include -I../../src/libprelude-error -I../../binding=
s/c++/include -I../../bindings/c++/include -fexpensive-optimizations -fomit=
-frame-pointer -frename-registers -O2 -ggdb2 -fpermissive -fvisibility-inli=
nes-hidden -MT libpreludecpp_la-prelude-client-easy.lo -MD -MP -MF .deps/li=
bpreludecpp_la-prelude-client-easy.Tpo -c prelude-client-easy.cxx  -fPIC -D=
PIC -o .libs/libpreludecpp_la-prelude-client-easy.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-g+=
+ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I../.. -I../.. -I../../s=
rc/include -I../../src/include -I../../src/libprelude-error -I../../binding=
s/c++/include -I../../bindings/c++/include -fexpensive-optimizations -fomit=
-frame-pointer -frename-registers -O2 -ggdb2 -fpermissive -fvisibility-inli=
nes-hidden -MT libpreludecpp_la-prelude-client.lo -MD -MP -MF .deps/libprel=
udecpp_la-prelude-client.Tpo -c prelude-client.cxx  -fPIC -DPIC -o .libs/li=
bpreludecpp_la-prelude-client.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-g+=
+ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I../.. -I../.. -I../../s=
rc/include -I../../src/include -I../../src/libprelude-error -I../../binding=
s/c++/include -I../../bindings/c++/include -fexpensive-optimizations -fomit=
-frame-pointer -frename-registers -O2 -ggdb2 -fpermissive -fvisibility-inli=
nes-hidden -MT libpreludecpp_la-prelude.lo -MD -MP -MF .deps/libpreludecpp_=
la-prelude.Tpo -c prelude.cxx  -fPIC -DPIC -o .libs/libpreludecpp_la-prelud=
e.o
mv -f .deps/libpreludecpp_la-prelude-error.Tpo .deps/libpreludecpp_la-prelu=
de-error.Plo
/bin/sh ../../arm-angstrom-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dco=
mpile arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -m=
fpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/h=
ome/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CON=
FIG_H -I. -I../..  -I../.. -I../../src/include -I../../src/include -I../../=
src/libprelude-error -I../../bindings/c++/include -I../../bindings/c++/incl=
ude    -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O=
2 -ggdb2 -fpermissive -fvisibility-inlines-hidden -MT libpreludecpp_la-prel=
ude-client-profile.lo -MD -MP -MF .deps/libpreludecpp_la-prelude-client-pro=
file.Tpo -c -o libpreludecpp_la-prelude-client-profile.lo `test -f 'prelude=
-client-profile.cxx' || echo './'`prelude-client-profile.cxx
mv -f .deps/libpreludecpp_la-prelude.Tpo .deps/libpreludecpp_la-prelude.Plo
/bin/sh ../../arm-angstrom-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dco=
mpile arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -m=
fpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/h=
ome/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CON=
FIG_H -I. -I../..  -I../.. -I../../src/include -I../../src/include -I../../=
src/libprelude-error -I../../bindings/c++/include -I../../bindings/c++/incl=
ude    -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O=
2 -ggdb2 -fpermissive -fvisibility-inlines-hidden -MT libpreludecpp_la-prel=
ude-connection.lo -MD -MP -MF .deps/libpreludecpp_la-prelude-connection.Tpo=
 -c -o libpreludecpp_la-prelude-connection.lo `test -f 'prelude-connection.=
cxx' || echo './'`prelude-connection.cxx
mv -f .deps/libpreludecpp_la-idmef-time.Tpo .deps/libpreludecpp_la-idmef-ti=
me.Plo
/bin/sh ../../arm-angstrom-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dco=
mpile arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -m=
fpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/h=
ome/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CON=
FIG_H -I. -I../..  -I../.. -I../../src/include -I../../src/include -I../../=
src/libprelude-error -I../../bindings/c++/include -I../../bindings/c++/incl=
ude    -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O=
2 -ggdb2 -fpermissive -fvisibility-inlines-hidden -MT libpreludecpp_la-prel=
ude-connection-pool.lo -MD -MP -MF .deps/libpreludecpp_la-prelude-connectio=
n-pool.Tpo -c -o libpreludecpp_la-prelude-connection-pool.lo `test -f 'prel=
ude-connection-pool.cxx' || echo './'`prelude-connection-pool.cxx
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-g+=
+ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I../.. -I../.. -I../../s=
rc/include -I../../src/include -I../../src/libprelude-error -I../../binding=
s/c++/include -I../../bindings/c++/include -fexpensive-optimizations -fomit=
-frame-pointer -frename-registers -O2 -ggdb2 -fpermissive -fvisibility-inli=
nes-hidden -MT libpreludecpp_la-prelude-client-profile.lo -MD -MP -MF .deps=
/libpreludecpp_la-prelude-client-profile.Tpo -c prelude-client-profile.cxx =
 -fPIC -DPIC -o .libs/libpreludecpp_la-prelude-client-profile.o
mv -f .deps/libpreludecpp_la-prelude-client-easy.Tpo .deps/libpreludecpp_la=
-prelude-client-easy.Plo
/bin/sh ../../arm-angstrom-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dco=
mpile arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -m=
fpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/h=
ome/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CON=
FIG_H -I. -I../..  -I../.. -I../../src/include -I../../src/include -I../../=
src/libprelude-error -I../../bindings/c++/include -I../../bindings/c++/incl=
ude    -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O=
2 -ggdb2 -fpermissive -fvisibility-inlines-hidden -MT libpreludecpp_la-prel=
ude-log.lo -MD -MP -MF .deps/libpreludecpp_la-prelude-log.Tpo -c -o libprel=
udecpp_la-prelude-log.lo `test -f 'prelude-log.cxx' || echo './'`prelude-lo=
g.cxx
mv -f .deps/libpreludecpp_la-idmef-criteria.Tpo .deps/libpreludecpp_la-idme=
f-criteria.Plo
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-g+=
+ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I../.. -I../.. -I../../s=
rc/include -I../../src/include -I../../src/libprelude-error -I../../binding=
s/c++/include -I../../bindings/c++/include -fexpensive-optimizations -fomit=
-frame-pointer -frename-registers -O2 -ggdb2 -fpermissive -fvisibility-inli=
nes-hidden -MT libpreludecpp_la-prelude-connection.lo -MD -MP -MF .deps/lib=
preludecpp_la-prelude-connection.Tpo -c prelude-connection.cxx  -fPIC -DPIC=
 -o .libs/libpreludecpp_la-prelude-connection.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-g+=
+ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I../.. -I../.. -I../../s=
rc/include -I../../src/include -I../../src/libprelude-error -I../../binding=
s/c++/include -I../../bindings/c++/include -fexpensive-optimizations -fomit=
-frame-pointer -frename-registers -O2 -ggdb2 -fpermissive -fvisibility-inli=
nes-hidden -MT libpreludecpp_la-prelude-connection-pool.lo -MD -MP -MF .dep=
s/libpreludecpp_la-prelude-connection-pool.Tpo -c prelude-connection-pool.c=
xx  -fPIC -DPIC -o .libs/libpreludecpp_la-prelude-connection-pool.o
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-g+=
+ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I../.. -I../.. -I../../s=
rc/include -I../../src/include -I../../src/libprelude-error -I../../binding=
s/c++/include -I../../bindings/c++/include -fexpensive-optimizations -fomit=
-frame-pointer -frename-registers -O2 -ggdb2 -fpermissive -fvisibility-inli=
nes-hidden -MT libpreludecpp_la-prelude-log.lo -MD -MP -MF .deps/libprelude=
cpp_la-prelude-log.Tpo -c prelude-log.cxx  -fPIC -DPIC -o .libs/libpreludec=
pp_la-prelude-log.o
mv -f .deps/libpreludecpp_la-prelude-client.Tpo .deps/libpreludecpp_la-prel=
ude-client.Plo
mv -f .deps/libpreludecpp_la-prelude-log.Tpo .deps/libpreludecpp_la-prelude=
-log.Plo
mv -f .deps/libpreludecpp_la-idmef.Tpo .deps/libpreludecpp_la-idmef.Plo
mv -f .deps/libpreludecpp_la-idmef-path.Tpo .deps/libpreludecpp_la-idmef-pa=
th.Plo
mv -f .deps/libpreludecpp_la-prelude-client-profile.Tpo .deps/libpreludecpp=
_la-prelude-client-profile.Plo
mv -f .deps/libpreludecpp_la-prelude-connection.Tpo .deps/libpreludecpp_la-=
prelude-connection.Plo
mv -f .deps/libpreludecpp_la-prelude-connection-pool.Tpo .deps/libpreludecp=
p_la-prelude-connection-pool.Plo
mv -f .deps/libpreludecpp_la-idmef-value.Tpo .deps/libpreludecpp_la-idmef-v=
alue.Plo
/bin/sh ../../arm-angstrom-linux-gnueabi-libtool --tag=3DCXX   --mode=3Dlin=
k arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi  -fexpensive-=
optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -fpermissi=
ve -fvisibility-inlines-hidden -no-undefined -version-info 3:0:3 -Wl,-O1 -W=
l,--hash-style=3Dgnu -o libpreludecpp.la -rpath /usr/lib libpreludecpp_la-p=
relude-error.lo libpreludecpp_la-idmef.lo libpreludecpp_la-idmef-criteria.l=
o libpreludecpp_la-idmef-path.lo libpreludecpp_la-idmef-time.lo libpreludec=
pp_la-idmef-value.lo libpreludecpp_la-prelude.lo libpreludecpp_la-prelude-c=
lient.lo libpreludecpp_la-prelude-client-easy.lo libpreludecpp_la-prelude-c=
lient-profile.lo libpreludecpp_la-prelude-connection.lo libpreludecpp_la-pr=
elude-connection-pool.lo libpreludecpp_la-prelude-log.lo ../../src/.libs/li=
bprelude.la -ldl=20
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgnutls.la' seems to =
be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libz.la' seems to be mo=
ved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgcrypt.la' seems to =
be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libz.la' seems to be mo=
ved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgcrypt.la' seems to =
be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgpg-error.la' seems =
to be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgpg-error.la' seems =
to be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libltdl.la' seems to be=
 moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libz.la' seems to be mo=
ved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgcrypt.la' seems to =
be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgpg-error.la' seems =
to be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgpg-error.la' seems =
to be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgpg-error.la' seems =
to be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgpg-error.la' seems =
to be moved
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-g++ -m=
arch=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb=
-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/armv=
7a-angstrom-linux-gnueabi  -fPIC -DPIC -shared -nostdlib /home/vdubhack/ove=
ro-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/crti.o /home/vdubh=
ack/overo-oe/tmp/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-=
gnueabi/4.5.3/crtbeginS.o  .libs/libpreludecpp_la-prelude-error.o .libs/lib=
preludecpp_la-idmef.o .libs/libpreludecpp_la-idmef-criteria.o .libs/libprel=
udecpp_la-idmef-path.o .libs/libpreludecpp_la-idmef-time.o .libs/libprelude=
cpp_la-idmef-value.o .libs/libpreludecpp_la-prelude.o .libs/libpreludecpp_l=
a-prelude-client.o .libs/libpreludecpp_la-prelude-client-easy.o .libs/libpr=
eludecpp_la-prelude-client-profile.o .libs/libpreludecpp_la-prelude-connect=
ion.o .libs/libpreludecpp_la-prelude-connection-pool.o .libs/libpreludecpp_=
la-prelude-log.o   -Wl,-rpath -Wl,/home/vdubhack/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/src/.libs -Wl,-r=
path -Wl,/usr/lib ../../src/.libs/libprelude.so -L/home/vdubhack/overo-oe/t=
mp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib -L=3D/usr/lib /home/vdubh=
ack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgnutls.s=
o /home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/li=
b/libz.so /home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueab=
i/usr/lib/libgcrypt.so /home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom=
-linux-gnueabi/usr/lib/libgpg-error.so /home/vdubhack/overo-oe/tmp/sysroots=
/armv7a-angstrom-linux-gnueabi/usr/lib/libltdl.so -ldl -L/home/vdubhack/ove=
ro-oe/tmp/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi=
/4.5.3 -L/home/vdubhack/overo-oe/tmp/sysroots/i686-linux/usr/armv7a/lib/gcc=
/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/li=
b -L/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/lib =
/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/=
libstdc++.so -lm -lc -lgcc_s /home/vdubhack/overo-oe/tmp/sysroots/i686-linu=
x/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/crtendS.o /home/vdubh=
ack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/crtn.o  -ma=
rch=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-=
interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/armv7=
a-angstrom-linux-gnueabi -O2 -Wl,-O1 -Wl,--hash-style=3Dgnu   -Wl,-soname -=
Wl,libpreludecpp.so.0 -o .libs/libpreludecpp.so.0.3.0
arm-angstrom-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "libpreludec=
pp.so.0" && ln -s "libpreludecpp.so.0.3.0" "libpreludecpp.so.0")
arm-angstrom-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "libpreludec=
pp.so" && ln -s "libpreludecpp.so.0.3.0" "libpreludecpp.so")
arm-angstrom-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f "libprelude=
cpp.la" && ln -s "../libpreludecpp.la" "libpreludecpp.la" )
make[4]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/c++'
make[3]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/c++'
Making all in low-level
make[3]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/low-level'
Making all in python
make[4]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/low-level/py=
thon'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/low-level/pyt=
hon'
make[4]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/low-level'
cd perl && make LD_RUN_PATH=3D""
make[5]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/low-level/pe=
rl'
arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3D=
neon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home/vd=
ubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -c  -I../../.. -=
I../../../src/include -I../../../src/include -I../../../src/libprelude-erro=
r -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1 -DD=
EBIAN -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -=
pipe -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64 -O2   -DVERSION=3D\"\" -D=
XS_VERSION=3D\"\" -fPIC "-I/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angs=
trom-linux-gnueabi/usr/lib/perl/5.10.1/CORE"   Prelude.c
Running Mkbootstrap for Prelude ()
chmod 644 Prelude.bs
cp Prelude.bs blib/arch/auto/Prelude/Prelude.bs
chmod 644 blib/arch/auto/Prelude/Prelude.bs
cp Prelude.pm blib/lib/Prelude.pm
rm -f blib/arch/auto/Prelude/Prelude.so
LD_RUN_PATH=3D"" arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dc=
ortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --s=
ysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi=
  -L../../../src/.libs -Wl,-O1 -Wl,--hash-style=3Dgnu -shared Prelude.o  -o=
 blib/arch/auto/Prelude/Prelude.so 	\
	   -lprelude  	\
	 =20
chmod 755 blib/arch/auto/Prelude/Prelude.so
make[5]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/low-level/per=
l'
make[4]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/low-level'
make[3]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/low-level'
Making all in lua
make[3]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/lua'
/bin/sh ../../arm-angstrom-linux-gnueabi-libtool --tag=3DCXX   --mode=3Dcom=
pile arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mf=
pu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/ho=
me/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CONF=
IG_H -I. -I../..  -I../.. -I../../src/include -I../../src/include -I../../s=
rc/libprelude-error -I../../bindings/c++/include   -I../../libmissing -I../=
../libmissing   -fexpensive-optimizations -fomit-frame-pointer -frename-reg=
isters -O2 -ggdb2 -fpermissive -fvisibility-inlines-hidden -MT PreludeEasy.=
lo -MD -MP -MF .deps/PreludeEasy.Tpo -c -o PreludeEasy.lo PreludeEasy.cxx
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-g+=
+ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I../.. -I../.. -I../../s=
rc/include -I../../src/include -I../../src/libprelude-error -I../../binding=
s/c++/include -I../../libmissing -I../../libmissing -fexpensive-optimizatio=
ns -fomit-frame-pointer -frename-registers -O2 -ggdb2 -fpermissive -fvisibi=
lity-inlines-hidden -MT PreludeEasy.lo -MD -MP -MF .deps/PreludeEasy.Tpo -c=
 PreludeEasy.cxx  -fPIC -DPIC -o .libs/PreludeEasy.o
mv -f .deps/PreludeEasy.Tpo .deps/PreludeEasy.Plo
/bin/sh ../../arm-angstrom-linux-gnueabi-libtool --tag=3DCXX   --mode=3Dlin=
k arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/home=
/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi  -fexpensive-=
optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -fpermissi=
ve -fvisibility-inlines-hidden -module -avoid-version -llua   -Wl,-O1 -Wl,-=
-hash-style=3Dgnu -o PreludeEasy.la -rpath /usr/lib PreludeEasy.lo ../../bi=
ndings/c++/.libs/libpreludecpp.la -ldl=20
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgnutls.la' seems to =
be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libz.la' seems to be mo=
ved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgcrypt.la' seems to =
be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libz.la' seems to be mo=
ved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgcrypt.la' seems to =
be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgpg-error.la' seems =
to be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgpg-error.la' seems =
to be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libltdl.la' seems to be=
 moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libstdc++.la' seems to =
be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgnutls.la' seems to =
be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libz.la' seems to be mo=
ved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgcrypt.la' seems to =
be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libz.la' seems to be mo=
ved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgcrypt.la' seems to =
be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgpg-error.la' seems =
to be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgpg-error.la' seems =
to be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libltdl.la' seems to be=
 moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libz.la' seems to be mo=
ved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgcrypt.la' seems to =
be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgpg-error.la' seems =
to be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgpg-error.la' seems =
to be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgpg-error.la' seems =
to be moved
arm-angstrom-linux-gnueabi-libtool: link: warning: `/home/vdubhack/overo-oe=
/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgpg-error.la' seems =
to be moved
arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux-gnueabi-g++ -m=
arch=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb=
-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/armv=
7a-angstrom-linux-gnueabi  -fPIC -DPIC -shared -nostdlib /home/vdubhack/ove=
ro-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/crti.o /home/vdubh=
ack/overo-oe/tmp/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-=
gnueabi/4.5.3/crtbeginS.o  .libs/PreludeEasy.o   -Wl,-rpath -Wl,/home/vdubh=
ack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libprelude-1.0.0-r1/lib=
prelude-1.0.0/bindings/c++/.libs -Wl,-rpath -Wl,/home/vdubhack/overo-oe/tmp=
/work/armv7a-angstrom-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/sr=
c/.libs -Wl,-rpath -Wl,/usr/lib -L/home/vdubhack/overo-oe/tmp/work/armv7a-a=
ngstrom-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/src/.libs/.libs =
-llua ../../bindings/c++/.libs/libpreludecpp.so -L=3D/usr/lib -L/home/vdubh=
ack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib /home/vdubh=
ack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libprelude-1.0.0-r1/lib=
prelude-1.0.0/src/.libs/libprelude.so /home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi/usr/lib/libgnutls.so /home/vdubhack/overo-oe/=
tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libz.so /home/vdubhack/o=
vero-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libgcrypt.so /ho=
me/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/lib=
gpg-error.so /home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnu=
eabi/usr/lib/libltdl.so -ldl -L/home/vdubhack/overo-oe/tmp/sysroots/i686-li=
nux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3 -L/home/vdubhack/ov=
ero-oe/tmp/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueab=
i/4.5.3/../../../../arm-angstrom-linux-gnueabi/lib -L/home/vdubhack/overo-o=
e/tmp/sysroots/armv7a-angstrom-linux-gnueabi/lib /home/vdubhack/overo-oe/tm=
p/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libstdc++.so -lm -lc -lgcc=
_s /home/vdubhack/overo-oe/tmp/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-a=
ngstrom-linux-gnueabi/4.5.3/crtendS.o /home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi/usr/lib/crtn.o  -march=3Darmv7-a -mtune=3Dcor=
tex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sys=
root=3D/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -=
O2 -Wl,-O1 -Wl,--hash-style=3Dgnu   -Wl,-soname -Wl,PreludeEasy.so -o .libs=
/PreludeEasy.so
arm-angstrom-linux-gnueabi-libtool: link: ( cd ".libs" && rm -f "PreludeEas=
y.la" && ln -s "../PreludeEasy.la" "PreludeEasy.la" )
make[3]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/lua'
Making all in python
make[3]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/python'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/python'
Making all in ruby
make[3]: Entering directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstr=
om-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/ruby'
/bin/sh ../../arm-angstrom-linux-gnueabi-libtool  --tag=3DCXX   --mode=3Dco=
mpile arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -m=
fpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/h=
ome/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi -DHAVE_CON=
FIG_H -I. -I../..  -I/home/vdubhack/overo-oe/tmp/sysroots/i686-linux/usr/li=
b/ruby/1.8/i686-linux -isystem/home/vdubhack/overo-oe/tmp/sysroots/i686-lin=
ux/usr/include -O2 -g   -I../.. -I../../src/include -I../../src/include -I.=
./../src/libprelude-error -I../../bindings/c++/include -I../../libmissing -=
I../../libmissing   -fexpensive-optimizations -fomit-frame-pointer -frename=
-registers -O2 -ggdb2 -fpermissive -fvisibility-inlines-hidden -MT PreludeE=
asy_la-PreludeEasy.lo -MD -MP -MF .deps/PreludeEasy_la-PreludeEasy.Tpo -c -=
o PreludeEasy_la-PreludeEasy.lo `test -f 'PreludeEasy.cxx' || echo './'`Pre=
ludeEasy.cxx
arm-angstrom-linux-gnueabi-libtool: compile:  arm-angstrom-linux-gnueabi-g+=
+ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mt=
humb-interwork -mno-thumb --sysroot=3D/home/vdubhack/overo-oe/tmp/sysroots/=
armv7a-angstrom-linux-gnueabi -DHAVE_CONFIG_H -I. -I../.. -I/home/vdubhack/=
overo-oe/tmp/sysroots/i686-linux/usr/lib/ruby/1.8/i686-linux -isystem/home/=
vdubhack/overo-oe/tmp/sysroots/i686-linux/usr/include -O2 -g -I../.. -I../.=
./src/include -I../../src/include -I../../src/libprelude-error -I../../bind=
ings/c++/include -I../../libmissing -I../../libmissing -fexpensive-optimiza=
tions -fomit-frame-pointer -frename-registers -O2 -ggdb2 -fpermissive -fvis=
ibility-inlines-hidden -MT PreludeEasy_la-PreludeEasy.lo -MD -MP -MF .deps/=
PreludeEasy_la-PreludeEasy.Tpo -c PreludeEasy.cxx  -fPIC -DPIC -o .libs/Pre=
ludeEasy_la-PreludeEasy.o
In file included from /home/vdubhack/overo-oe/tmp/sysroots/i686-linux/usr/l=
ib/ruby/1.8/i686-linux/missing.h:16:0,
                 from /home/vdubhack/overo-oe/tmp/sysroots/i686-linux/usr/l=
ib/ruby/1.8/i686-linux/ruby.h:755,
                 from PreludeEasy.cxx:856:
../../libmissing/sys/time.h:85:58: error: conflicting declaration 'void* re=
strict'
../../libmissing/sys/time.h:85:42: error: 'restrict' has a previous declara=
tion as 'timeval* restrict'
make[3]: *** [PreludeEasy_la-PreludeEasy.lo] Error 1
make[3]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/bindings/ruby'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0/bindings'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/vdubhack/overo-oe/tmp/work/armv7a-angstro=
m-linux-gnueabi/libprelude-1.0.0-r1/libprelude-1.0.0'
make: *** [all] Error 2
+ die 'oe_runmake failed'
+ oefatal 'oe_runmake failed'
+ echo FATAL: 'oe_runmake failed'
FATAL: oe_runmake failed
+ exit 1

--------------010401080604060302010002--
