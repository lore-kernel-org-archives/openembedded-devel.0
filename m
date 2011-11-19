Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mr.dash.four@googlemail.com>) id 1RRsEO-0006G8-EA
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Nov 2011 22:13:48 +0100
Received: by wwp14 with SMTP id 14so6161707wwp.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Nov 2011 13:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=message-id:disposition-notification-to:date:from:user-agent
	:mime-version:to:subject:content-type:content-transfer-encoding;
	bh=sEKxQ1O/XgPFBQDwMwamAodVAyFYCxEawqvpez5FrBg=;
	b=LJ6sdyGWA9gutoLIwihBbxV4ofuUoV/0o02SokG5yOMzXFu1Wi+1se4aT61QxUq7Xk
	IQm/B9Wusy7XF10hpC7iWsR+ARpQ0uHM9Lx4F7HmRaKxumZqOFVZq045H0oWvjbTniKu
	IvmpZxJ3YTUuT/cLmIY1OEMjGZfvgx4Mmrxng=
Received: by 10.180.19.42 with SMTP id b10mr10252574wie.39.1321736840659;
	Sat, 19 Nov 2011 13:07:20 -0800 (PST)
Received: from xp1.wyse.network
	(cpc2-gill1-0-0-cust1894.basl.cable.virginmedia.com. [82.34.63.103])
	by mx.google.com with ESMTPS id h42sm6149191wbn.2.2011.11.19.13.07.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 19 Nov 2011 13:07:19 -0800 (PST)
Message-ID: <4EC81A85.8050704@googlemail.com>
Date: Sat, 19 Nov 2011 21:07:17 +0000
From: Mr Dash Four <mr.dash.four@googlemail.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20110312)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: "cannot find -lppl_c" link error
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
X-List-Received-Date: Sat, 19 Nov 2011 21:13:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I am trying to build my kernel image with "bitbake virtual/kernel" using the following (rather short) local.conf:

DL_DIR = "${HOME}/oe/sources"
BBFILES = "${HOME}/oe/openembedded/recipes/*/*.bb"
MACHINE = "htcdream"
DISTRO = "shr"
BBMASK = "/(nonworking|obsolete|cacao)/"

As a side note - the reason I excluded "cacao" above as well is because there are some errors in the .bb recipe files. Unfortunately, my build fails with the following error:

| gcc   -isystem/home/mr-4/oe/build/tmp/sysroots/x86_64-linux/usr/include -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes -Wmissing-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros -Wno-overlength-strings -Wold-style-definition -Wc++-compat   -DHAVE_CONFIG_H -L/home/mr-4/oe/build/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/home/mr-4/oe/build/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home/mr-4/oe/build/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o cc1-dummy c-lang.o stub-objc.o attribs.o c-errors.o c-lex.o c-pragma.o c-decl.o c-typeck.o c-convert.o c-aux-info.o c-common.o c-opts.o c-format.o c-semantics.o c-ppoutput.o c-cppbuiltin.o c-objc-common.o c-dump.o c-pch.o c-parser.o arm-c.o c-gimplify.o tree-mudflap.o c-pretty-print.o c-omp.o \
| 	  dummy-checksum.o main.o  libbackend.a ../libcpp/libcpp.a ../libdecnumber/libdecnumber.a ../libcpp/libcpp.a   ../libiberty/libiberty.a ../libdecnumber/libdecnumber.a  -lcloog  -Wl,-Bstatic  -lppl_c -lppl -lgmpxx -Wl,-Bdynamic -Wl,-Bstatic -lmpc -lmpfr -lgmp -Wl,-Bdynamic -rdynamic -ldl  -L../zlib -lz -Wl,-Bstatic -lelf -Wl,-Bdynamic
| /usr/bin/ld: cannot find -lppl_c
| collect2: ld returned 1 exit status
| make[2]: *** [cc1-dummy] Error 1
| make[2]: Leaving directory `/home/mr-4/oe/build/tmp/work/armv6-novfp-oe-linux-gnueabi/gcc-cross-initial-4.5-r38.1+svnr170880/gcc-4_5-branch/build.x86_64-linux.arm-oe-linux-gnueabi/gcc'
| make[1]: *** [all-gcc] Error 2
| make[1]: Leaving directory `/home/mr-4/oe/build/tmp/work/armv6-novfp-oe-linux-gnueabi/gcc-cross-initial-4.5-r38.1+svnr170880/gcc-4_5-branch/build.x86_64-linux.arm-oe-linux-gnueabi'
| make: *** [all] Error 2
| + die 'oe_runmake failed'
| + oefatal 'oe_runmake failed'
| + echo FATAL: 'oe_runmake failed'
| FATAL: oe_runmake failed
| + exit 1
NOTE: package gcc-cross-initial-4.5-r38.1+svnr170880: task do_compile: Failed
ERROR: Function 'do_compile' failed (see /home/mr-4/oe/build/tmp/work/armv6-novfp-oe-linux-gnueabi/gcc-cross-initial-4.5-r38.1+svnr170880/temp/log.do_compile.1190 for further information)
ERROR: Task 748 (/home/mr-4/oe/openembedded/recipes/gcc/gcc-cross-initial_4.5.bb, do_compile) failed with exit code '1'
ERROR: '/home/mr-4/oe/openembedded/recipes/gcc/gcc-cross-initial_4.5.bb' failed


It looks as though ld cannot find "ppl_c" (not ppl!). What is ppl_c? The build environment I use is x86_64 (quad core CPU), running heavily upgraded and updated FC13 (most of the components are based on FC14 & FC15). The target device is htcdream (ARMv6).

Any idea what is causing this?

I've followed the installation guide (http://www.openembedded.org/wiki/Getting_started) and the only difference is that I deployed bitbake 1.12.0 instead of 1.10.2. I keep the full logs so I can post them here if there is any interest. Many thanks in advance!


