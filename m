Received: from [80.74.147.171] (helo=metis.kreativmedia.ch)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <michu@neophob.com>) id 1GZ5dm-0007vZ-RF
	for openembedded-devel@openembedded.org; Sun, 15 Oct 2006 15:02:54 +0200
Received: (qmail 22015 invoked from network); 15 Oct 2006 14:56:13 +0200
Received: from localhost (127.0.0.1)
	by localhost with SMTP; 15 Oct 2006 14:56:13 +0200
Received: from 84-73-155-56.dclient.hispeed.ch
	(84-73-155-56.dclient.hispeed.ch [84.73.155.56]) by webmail.neophob.com
	(Horde MIME library) with HTTP; Sun, 15 Oct 2006 14:56:13 +0200
Message-ID: <20061015145613.ovhqbcfhdndc888c@webmail.neophob.com>
Date: Sun, 15 Oct 2006 14:56:13 +0200
From: michu@neophob.com
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.0.3)
X-Mailman-Approved-At: Sun, 15 Oct 2006 15:57:48 +0200
Subject: build cairo
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Oct 2006 13:02:55 -0000
Content-Type: text/plain;
	charset=ISO-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

hello

i try to create gpsdrive with a directfb backend (no x11, just sdl).. this is my
goal, but i have an issue when i want to compile cairo v1.2.4.

i edited the bb file, those are the changed lines:

#DEPENDS = "virtual/libx11 libpng fontconfig libxrender"
DEPENDS = "libpng fontconfig directfb"

EXTRA_OECONF = "--enable-directfb --disable-xlib --disable-win32"

directfb is compiled. so i try to create the cairo package, the configuration
step is fine but the compilation fails:

| NOTE: make
| make  all-recursive
| make[1]: Entering directory `/stuff/tmp/work/cairo-1.2.4-r1/cairo-1.2.4'
| Making all in pixman
| make[2]: Entering directory
`/stuff/tmp/work/cairo-1.2.4-r1/cairo-1.2.4/pixman'
| Making all in src
| make[3]: Entering directory
`/stuff/tmp/work/cairo-1.2.4-r1/cairo-1.2.4/pixman/src'
| make[3]: Nothing to be done for `all'.
| make[3]: Leaving directory
`/stuff/tmp/work/cairo-1.2.4-r1/cairo-1.2.4/pixman/src'
| make[3]: Entering directory
`/stuff/tmp/work/cairo-1.2.4-r1/cairo-1.2.4/pixman'
| make[3]: Nothing to be done for `all-am'.
| make[3]: Leaving directory `/stuff/tmp/work/cairo-1.2.4-r1/cairo-1.2.4/pixman'
| make[2]: Leaving directory `/stuff/tmp/work/cairo-1.2.4-r1/cairo-1.2.4/pixman'
| Making all in src
| make[2]: Entering directory `/stuff/tmp/work/cairo-1.2.4-r1/cairo-1.2.4/src'
| make  all-am
| make[3]: Entering directory `/stuff/tmp/work/cairo-1.2.4-r1/cairo-1.2.4/src'
| if /bin/sh ../arm-linux-libtool --tag=CC --mode=compile arm-linux-gcc
-mcpu=arm9tdmi -mtune=arm9tdmi -DHAVE_CONFIG_H -I.
-I/stuff/tmp/work/cairo-1.2.4-r1/cairo-1.2.4/src -I..
-I/stuff/tmp/work/cairo-1.2.4-r1/cairo-1.2.4/src
-I/stuff/tmp/work/cairo-1.2.4-r1/cairo-1.2.4/pixman/src
-I/stuff/tmp/staging/arm-linux/include/freetype2  
-I/stuff/tmp/staging/arm-linux/include   -D_REENTRANT
-I/stuff/tmp/staging/arm-linux/include/directfb -I/usr/include/directfb  
-I/stuff/tmp/staging/arm-linux/include/libpng12     -Wall -Wsign-compare
-Werror-implicit-function-declaration -Wpointer-arith -Wwrite-strings
-Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations
-Wnested-externs -Wpacked -Wswitch-enum -Wmissing-format-attribute
-Wstrict-aliasing=2 -Winit-self -Wunsafe-loop-optimizations
-Wdeclaration-after-statement -Wold-style-definition -fno-strict-aliasing 
-isystem/stuff/tmp/staging/arm-linux/include 
-isystem/stuff/tmp/staging/arm-linux/include -fexpensive-optimizations
-fomit-frame-pointer -frename-registers -O2 -MT cairo.lo -MD -MP -MF
".deps/cairo.Tpo" -c -o cairo.lo cairo.c; \
| then mv -f ".deps/cairo.Tpo" ".deps/cairo.Plo"; else rm -f ".deps/cairo.Tpo";
exit 1; fi
|  arm-linux-gcc -mcpu=arm9tdmi -mtune=arm9tdmi -DHAVE_CONFIG_H -I.
-I/stuff/tmp/work/cairo-1.2.4-r1/cairo-1.2.4/src -I..
-I/stuff/tmp/work/cairo-1.2.4-r1/cairo-1.2.4/src
-I/stuff/tmp/work/cairo-1.2.4-r1/cairo-1.2.4/pixman/src
-I/stuff/tmp/staging/arm-linux/include/freetype2
-I/stuff/tmp/staging/arm-linux/include -D_REENTRANT
-I/stuff/tmp/staging/arm-linux/include/directfb -I/usr/include/directfb
-I/stuff/tmp/staging/arm-linux/include/libpng12 -Wall -Wsign-compare
-Werror-implicit-function-declaration -Wpointer-arith -Wwrite-strings
-Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations
-Wnested-externs -Wpacked -Wswitch-enum -Wmissing-format-attribute
-Wstrict-aliasing=2 -Winit-self -Wunsafe-loop-optimizations
-Wdeclaration-after-statement -Wold-style-definition -fno-strict-aliasing
-isystem/stuff/tmp/staging/arm-linux/include
-isystem/stuff/tmp/staging/arm-linux/include -fexpensive-optimizations
-fomit-frame-pointer -frename-registers -O2 -MT cairo.lo -MD -MP -MF
.deps/cairo.Tpo -c cairo.c  -fPIC -DPIC -o .libs/cairo.o
| CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/directfb
| cc1: internal compiler error: in add_path, at c-incpath.c:362
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <URL:http://gcc.gnu.org/bugs.html> for instructions.
| make[3]: *** [cairo.lo] Error 1
| make[3]: Leaving directory `/stuff/tmp/work/cairo-1.2.4-r1/cairo-1.2.4/src'
| make[2]: *** [all] Error 2
| make[2]: Leaving directory `/stuff/tmp/work/cairo-1.2.4-r1/cairo-1.2.4/src'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/stuff/tmp/work/cairo-1.2.4-r1/cairo-1.2.4'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed: /stuff/tmp/work/cairo-1.2.4-r1/temp/log.do_compile.10923
NOTE: package cairo-1.2.4-r1: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package cairo-1.2.4: failed
ERROR: Build of cairo failed


any hints?

cheers
michu



