Received: from [66.249.92.175] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <cayco@poczta.cayco.pl>) id 1I938k-0003Qu-Vx
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jul 2007 20:11:51 +0200
Received: by ug-out-1314.google.com with SMTP id i24so411366ugd
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2007 11:05:53 -0700 (PDT)
Received: by 10.82.182.1 with SMTP id e1mr897248buf.1184263552646;
	Thu, 12 Jul 2007 11:05:52 -0700 (PDT)
Received: by 10.82.148.14 with HTTP; Thu, 12 Jul 2007 11:05:52 -0700 (PDT)
Message-ID: <193a0cf50707121105y703147cbr935d6a603d01e6d6@mail.gmail.com>
Date: Thu, 12 Jul 2007 20:05:52 +0200
From: "Krzysztof Kajkowski" <cayco@poczta.cayco.pl>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: ipkg on MacOS X (missing feature.h)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jul 2007 18:11:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello everyone!

I am trying to set up OpenMoko environment on my Macbook - you can see
my efforts on  http://wiki.openmoko.org/wiki/OpenMoko_under_QEMU_on_MacOSX

Now I'm struggling with compiling ipkg. Here's my log:

cayco@cayco-laptop:/Volumes/OE/moko/build$  bitbake -v -d openmoko-devel-image
NOTE: You have disabled Psyco. This decreases performance.
NOTE: Using cache in '/Volumes/OE/moko/build/tmp/cache/fic-gta01'
NOTE: Handling BitBake files: \ (4353/4353) [100 %]
NOTE: Parsing finished. 4169 cached, 0 parsed, 184 skipped, 0 masked.

NOTE: build 200707121802: started

OE Build Configuration:
BB_VERSION     = "1.6.9"
OE_REVISION    = "<unknown>"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux"
MACHINE        = "fic-gta01"
DISTRO         = "openmoko"
DISTRO_VERSION = ".dev-snapshot-20070712"
TARGET_FPU     = "soft"

NOTE: current path: openmoko-devel-image (openmoko-devel-image)
NOTE: dependencies for openmoko-devel-image are: ipkg-native
ipkg-utils-native fakeroot-native file-native fakeroot-native
quilt-native virtual/arm-linux-gcc virtual/libc task-base
task-openmoko makedevs-native genext2fs-native mtd-utils-native
sjf2410-linux-native openocd-native dfu-util-native
NOTE: current path: openmoko-devel-image (openmoko-devel-image) ->
ipkg-native (ipkg-native)
NOTE: dependencies for ipkg-native are: pkgconfig-native
autoconf-native automake-native libtool-native gnu-config-native
quilt-native libtool-native automake-native
NOTE: Selecting already-staged pkgconfig-native (0.15.0-r2) to satisfy
pkgconfig-native
NOTE: current path: openmoko-devel-image (openmoko-devel-image) ->
ipkg-native (ipkg-native) -> pkgconfig-native (pkgconfig-native)
NOTE: dependencies for pkgconfig-native are: autoconf-native
automake-native libtool-native gnu-config-native quilt-native
NOTE: Selecting already-staged autoconf-native (2.59-r5) to satisfy
autoconf-native
NOTE: current path: openmoko-devel-image (openmoko-devel-image) ->
ipkg-native (ipkg-native) -> pkgconfig-native (pkgconfig-native) ->
autoconf-native (autoconf-native)
NOTE: dependencies for autoconf-native are: quilt-native m4-native
gnu-config-native
NOTE: Selecting already-staged quilt-native (0.45-r1) to satisfy quilt-native
NOTE: current path: openmoko-devel-image (openmoko-devel-image) ->
ipkg-native (ipkg-native) -> pkgconfig-native (pkgconfig-native) ->
autoconf-native (autoconf-native) -> quilt-native (quilt-native)
NOTE: dependencies for quilt-native are: patch-native
NOTE: Selecting already-staged m4-native (1.4.4-r0) to satisfy m4-native
NOTE: current path: openmoko-devel-image (openmoko-devel-image) ->
ipkg-native (ipkg-native) -> pkgconfig-native (pkgconfig-native) ->
autoconf-native (autoconf-native) -> m4-native (m4-native)
NOTE: dependencies for m4-native are: quilt-native gnu-config-native
NOTE: Selecting already-staged gnu-config-native (0.1+cvs20050701-r4)
to satisfy gnu-config-native
NOTE: current path: openmoko-devel-image (openmoko-devel-image) ->
ipkg-native (ipkg-native) -> pkgconfig-native (pkgconfig-native) ->
autoconf-native (autoconf-native) -> m4-native (m4-native) ->
gnu-config-native (gnu-config-native)
NOTE: dependencies for gnu-config-native are: quilt-native
NOTE: Selecting already-staged automake-native (1.9.3-r5) to satisfy
automake-native
NOTE: current path: openmoko-devel-image (openmoko-devel-image) ->
ipkg-native (ipkg-native) -> pkgconfig-native (pkgconfig-native) ->
automake-native (automake-native)
NOTE: dependencies for automake-native are: quilt-native autoconf-native
NOTE: Selecting already-staged libtool-native (1.5.10-r4) to satisfy
libtool-native
NOTE: current path: openmoko-devel-image (openmoko-devel-image) ->
ipkg-native (ipkg-native) -> pkgconfig-native (pkgconfig-native) ->
libtool-native (libtool-native)
NOTE: dependencies for libtool-native are: autoconf-native
automake-native gnu-config-native quilt-native
NOTE: package ipkg-native-0.99.163: started
NOTE: package ipkg-native-0.99.163-r1: task do_compile: started
ERROR: Information not available for target 'i386-darwin'
NOTE: exceptions.TypeError:iterable argument required while evaluating:
${@siteinfo_get_endianess(d)}
ERROR: Information not available for target 'i386-darwin'
NOTE: exceptions.AttributeError:'NoneType' object has no attribute
'append' while evaluating:
${@siteinfo_get_files(d)}
ERROR: Information not available for target 'i386-darwin'
NOTE: exceptions.TypeError:iterable argument required while evaluating:
${@siteinfo_get_bits(d)}
ERROR: function do_compile failed
ERROR: log data follows
(/Volumes/OE/moko/build/tmp/work/i386-darwin/ipkg-native-0.99.163-r1/temp/log.do_compile.15225)
| NOTE: make
| make  all-recursive
| Making all in etc
| make[2]: Nothing to be done for `all'.
| Making all in familiar
| make[2]: Nothing to be done for `all'.
| Making all in libbb
| if /bin/sh ../i386-darwin-libtool --tag=CC --mode=compile gcc
-DHAVE_CONFIG_H -I.
-I/Volumes/OE/moko/build/tmp/work/i386-darwin/ipkg-native-0.99.163-r1/ipkg-0.99.163/libbb
-I..   -isystem/Volumes/OE/moko/build/tmp/staging/i386-darwin/include
-g -O -Wall -DHOST_CPU_STR=\"i386\" -DBUILD_CPU=i386
-isystem/Volumes/OE/moko/build/tmp/staging/i386-darwin/include -O2 -MT
libbb_la-gz_open.lo -MD -MP -MF ".deps/libbb_la-gz_open.Tpo" -c -o
libbb_la-gz_open.lo `test -f 'gz_open.c' || echo
'/Volumes/OE/moko/build/tmp/work/i386-darwin/ipkg-native-0.99.163-r1/ipkg-0.99.163/libbb/'`gz_open.c;
\
| then mv -f ".deps/libbb_la-gz_open.Tpo"
".deps/libbb_la-gz_open.Plo"; else rm -f ".deps/libbb_la-gz_open.Tpo";
exit 1; fi
|  gcc -DHAVE_CONFIG_H -I.
-I/Volumes/OE/moko/build/tmp/work/i386-darwin/ipkg-native-0.99.163-r1/ipkg-0.99.163/libbb
-I.. -isystem/Volumes/OE/moko/build/tmp/staging/i386-darwin/include -g
-O -Wall -DHOST_CPU_STR=\"i386\" -DBUILD_CPU=i386
-isystem/Volumes/OE/moko/build/tmp/staging/i386-darwin/include -O2 -MT
libbb_la-gz_open.lo -MD -MP -MF .deps/libbb_la-gz_open.Tpo -c
gz_open.c  -fno-common -DPIC -o .libs/libbb_la-gz_open.o
| In file included from gz_open.c:30:
| libbb.h:53:22: error: features.h: No such file or directory
| make[2]: *** [libbb_la-gz_open.lo] Error 1
| make[1]: *** [all-recursive] Error 1
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/Volumes/OE/moko/build/tmp/work/i386-darwin/ipkg-native-0.99.163-r1/temp/log.do_compile.15225
NOTE: package ipkg-native-0.99.163-r1: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package ipkg-native-0.99.163: failed
ERROR: Build of openmoko-devel-image failed

As you can see it does not find features.h I could not find anything
suitable for Mac about this file. I think that this file is specific
for linux glibc.

Can anyone help me resolving this issue - all OE Mac users would be
very grateful!

cheers

cayco


