Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raseelbhagat@gmail.com>) id 1OQcUL-000082-Na
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 10:36:19 +0200
Received: by pxi3 with SMTP id 3so1349206pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jun 2010 01:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=6zwq2Qnh4htVCxncV6rzG5sjpDlPnCbpVpjIdH3iXPo=;
	b=dB5vbN04INYbbLvF36hMtgPk9QT8ZZbdOS4kboKA1380ZPigmpvL2CZyQOZzrxwsFv
	jyUsu+qaHV3GnTdPQGndjuNny8nqDEd5L3oX+BqXFznUYbQLBu5Wmlz+Is5BcyLX1wpm
	hXRn6+8aCvaVFMnKnljJXSQmWU4QCVJdjOzTY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=QsToAGIScrgpiZUw2TwEyNhP6tKBzho0a3+6WZ7xVqWPShxi3jhA7n8uQel1WXQLfC
	x0dDl+YXYjuztjkCZW/7DSEbJFNB/7ougWGS01bfsnu3zKY8QwpcwlSQN/AQousIFkwb
	arvZv0J4MS1igkw9TuzNJbi6nrpl9VlTOnUOQ=
MIME-Version: 1.0
Received: by 10.142.120.4 with SMTP id s4mr3051474wfc.108.1277109102256; Mon, 
	21 Jun 2010 01:31:42 -0700 (PDT)
Received: by 10.142.76.16 with HTTP; Mon, 21 Jun 2010 01:31:42 -0700 (PDT)
Date: Mon, 21 Jun 2010 14:01:42 +0530
Message-ID: <AANLkTim_ffQAhrfedIEtmDYIZxzt0Vm8SN9qPGGB1zFw@mail.gmail.com>
From: Raseel Bhagat <raseelbhagat@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raseelbhagat@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Error in cross compiling autoconf packages
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
X-List-Received-Date: Mon, 21 Jun 2010 08:36:19 -0000
Content-Type: text/plain; charset=UTF-8

Hi all,
I need help in cross-compiling a package.

I have setup a OE environment and have managed to successfully bitbake
console-image and x11-image.
Now, I want to cross-compile a simple autotools based package called
sofsip-cli, which is a simple cli SIP UA application, to test sofia-aip
library.

I have set the PATH correct , because the "./configure" for this package
correctly shows the arm-angstrom-linux-gnueabi toolchain components.

However, when I "make", I get the following error :
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


mm4@mm4-desktop:~/raseel/sofsip-cli$ ./configure
--host=arm-angstrom-linux-gnueabi
configure: WARNING: If you wanted to set the --build type, don't use --host.
    If a cross compiler is detected then cross compile mode will be used.
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for arm-angstrom-linux-gnueabi-strip...
arm-angstrom-linux-gnueabi-strip
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether to enable maintainer-specific portions of Makefiles... no
checking for arm-angstrom-linux-gnueabi-gcc...
arm-angstrom-linux-gnueabi-gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables...
checking whether we are cross compiling... yes
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether arm-angstrom-linux-gnueabi-gcc accepts -g... yes
checking for arm-angstrom-linux-gnueabi-gcc option to accept ISO C89... none
needed
checking for style of include used by make... GNU
checking dependency style of arm-angstrom-linux-gnueabi-gcc... gcc3
checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gcc -E
checking for etags... echo
checking for arm-angstrom-linux-gnueabi-ar... arm-angstrom-linux-gnueabi-ar
checking for arm-angstrom-linux-gnueabi-ld... arm-angstrom-linux-gnueabi-ld
checking build system type... i686-pc-linux-gnu
checking host system type... arm-angstrom-linux-gnueabi
checking for a sed that does not truncate output... /bin/sed
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking for fgrep... /bin/grep -F
checking for ld used by arm-angstrom-linux-gnueabi-gcc...
arm-angstrom-linux-gnueabi-ld
checking if the linker (arm-angstrom-linux-gnueabi-ld) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)...
/media/workspace/OE/build/tmp/cross/armv7a//bin/arm-angstrom-linux-gnueabi-nm
-B
checking the name lister
(/media/workspace/OE/build/tmp/cross/armv7a//bin/arm-angstrom-linux-gnueabi-nm
-B) interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 1572864
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+="... yes
checking for arm-angstrom-linux-gnueabi-ld option to reload object files...
-r
checking for arm-angstrom-linux-gnueabi-objdump...
arm-angstrom-linux-gnueabi-objdump
checking how to recognize dependent libraries... pass_all
checking for arm-angstrom-linux-gnueabi-ar... (cached)
arm-angstrom-linux-gnueabi-ar
checking for arm-angstrom-linux-gnueabi-strip... (cached)
arm-angstrom-linux-gnueabi-strip
checking for arm-angstrom-linux-gnueabi-ranlib...
arm-angstrom-linux-gnueabi-ranlib
checking command to parse
/media/workspace/OE/build/tmp/cross/armv7a//bin/arm-angstrom-linux-gnueabi-nm
-B output from arm-angstrom-linux-gnueabi-gcc object... ok
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking for dlfcn.h... yes
checking for objdir... .libs
checking if arm-angstrom-linux-gnueabi-gcc supports -fno-rtti
-fno-exceptions... no
checking for arm-angstrom-linux-gnueabi-gcc option to produce PIC... -fPIC
-DPIC
checking if arm-angstrom-linux-gnueabi-gcc PIC flag -fPIC -DPIC works... yes
checking if arm-angstrom-linux-gnueabi-gcc static flag -static works... yes
checking if arm-angstrom-linux-gnueabi-gcc supports -c -o file.o... yes
checking if arm-angstrom-linux-gnueabi-gcc supports -c -o file.o... (cached)
yes
checking whether the arm-angstrom-linux-gnueabi-gcc linker
(arm-angstrom-linux-gnueabi-ld) supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
checking for pthread_create in -lpthread... yes
checking netinet/in.h usability... yes
checking netinet/in.h presence... yes
checking for netinet/in.h... yes
checking winsock2.h usability... no
checking winsock2.h presence... no
checking for winsock2.h... no
checking ws2tcpip.h usability... no
checking ws2tcpip.h presence... no
checking for ws2tcpip.h... no
checking for arm-angstrom-linux-gnueabi-pkg-config... no
checking for pkg-config... /usr/bin/pkg-config
configure: WARNING: using cross tools not prefixed with host triplet
checking pkg-config is at least version 0.9.0... yes
checking for GLIB... yes
checking for GLIB... yes
checking for GOBJECT2... yes
checking for GST... yes
checking for SOFIA_SIP_UA_GLIB... yes
checking for SOFIA_SIP_UA... yes
checking for NICE... no
checking readline/readline.h usability... yes
checking readline/readline.h presence... yes
checking for readline/readline.h... yes
checking readline/history.h usability... yes
checking readline/history.h presence... yes
checking for readline/history.h... yes
checking for tgetnum in -lncurses... yes
checking for readline in -lreadline... yes
Using libreadline for console input.
checking for ANSI C header files... (cached) yes
checking pthread.h usability... yes
checking pthread.h presence... yes
checking for pthread.h... yes
checking for stdint.h... (cached) yes
checking for inttypes.h... (cached) yes
checking for unistd.h... (cached) yes
checking sched.h usability... yes
checking sched.h presence... yes
checking for sched.h... yes
checking for sys/types.h... (cached) yes
checking sys/socket.h usability... yes
checking sys/socket.h presence... yes
checking for sys/socket.h... yes
checking arpa/inet.h usability... yes
checking arpa/inet.h presence... yes
checking for arpa/inet.h... yes
checking for netinet/in.h... (cached) yes
checking for an ANSI C-conforming const... yes
checking whether byte ordering is bigendian... no
configure: creating ./config.status
config.status: creating Makefile
config.status: creating doc/Makefile
config.status: creating src/Makefile
config.status: creating packages/Makefile
config.status: creating packages/sofsip-cli.spec
config.status: creating config.h
config.status: executing depfiles commands
config.status: executing libtool commands
---------------------------------------------------------------
Configure results:
The following media implementations were enabled at build time:
    - primary implementations...:  dummy gst
    - test/experimental impl....: <none>
Following build time options were set:
    - libreadline support.......: 1
---------------------------------------------------------------
mm4@mm4-desktop:~/raseel/sofsip-cli$ make
make  all-recursive
make[1]: Entering directory `/home/mm4/raseel/sofsip-cli'
Making all in doc
make[2]: Entering directory `/home/mm4/raseel/sofsip-cli/doc'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/mm4/raseel/sofsip-cli/doc'
Making all in src
make[2]: Entering directory `/home/mm4/raseel/sofsip-cli/src'
/bin/sh ../libtool --tag=CC   --mode=compile arm-angstrom-linux-gnueabi-gcc
-DHAVE_CONFIG_H -I. -I.. -I/usr/include/sofia-sip-1.12
-I/usr/include/sofia-sip-1.12 -I/usr/include/glib-2.0
-I/usr/lib/glib-2.0/include   -pthread -I/usr/local/include/gstreamer-0.10
-I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/libxml2
-I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include        -g -O2 -MT
ssc_oper.lo -MD -MP -MF .deps/ssc_oper.Tpo -c -o ssc_oper.lo ssc_oper.c
libtool: compile:  arm-angstrom-linux-gnueabi-gcc -DHAVE_CONFIG_H -I. -I..
-I/usr/include/sofia-sip-1.12 -I/usr/include/sofia-sip-1.12
-I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -pthread
-I/usr/local/include/gstreamer-0.10 -I/usr/include/glib-2.0
-I/usr/lib/glib-2.0/include -I/usr/include/libxml2 -I/usr/include/glib-2.0
-I/usr/lib/glib-2.0/include -g -O2 -MT ssc_oper.lo -MD -MP -MF
.deps/ssc_oper.Tpo -c ssc_oper.c  -fPIC -DPIC -o .libs/ssc_oper.o
CROSS COMPILE Badness: /usr/include in INCLUDEPATH:
/usr/include/sofia-sip-1.12
cc1: internal compiler error: in add_path, at c-incpath.c:425
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.
make[2]: *** [ssc_oper.lo] Error 1
make[2]: Leaving directory `/home/mm4/raseel/sofsip-cli/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/mm4/raseel/sofsip-cli'
make: *** [all] Error 2

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Any pointers to where I might be going wrong ?

My guess is that it's taking the wrong includedirs, i.e., instead of
/usr/include , it should be looking at OE's include directrories at
.../OE/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/
Am I missing any CPP or CXX FLAGs ?

--
Raseel

