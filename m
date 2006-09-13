Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GNWyz-0003E1-OJ for openembedded-devel@lists.openembedded.org;
	Wed, 13 Sep 2006 17:49:02 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 65EC0401B49; Wed, 13 Sep 2006 08:23:20 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060913152320.65EC0401B49@tinman.treke.net>
Date: Wed, 13 Sep 2006 08:23:20 -0700 (PDT)
Subject: [Bug 1326] libpng doesn't build for x86
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
X-List-Received-Date: Wed, 13 Sep 2006 15:49:02 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1326





------- Comment #8 from leoncamel@gmail.com  2006-09-13 08:23 -------
I build "libxine-fb" failed today. I digg into it and find that, the
"libpng-config" report the wrong path. Please look at the following message:
----------------------------------------------------------------------------
 ccache arm-linux-gcc -march=armv5te -mtune=xscale -DHAVE_CONFIG_H -I.
-I/home/leon/oe/test.dev/tmp/work/armv5te-linux/libxine-fb-1.0-r1/xine-lib-1.0/src/libxinevdec
-I../..
-I/home/leon/oe/test.dev/tmp/work/armv5te-linux/libxine-fb-1.0-r1/xine-lib-1.0
-I../../include
-I/home/leon/oe/test.dev/tmp/work/armv5te-linux/libxine-fb-1.0-r1/xine-lib-1.0/include
-I/home/leon/oe/test.dev/tmp/work/armv5te-linux/libxine-fb-1.0-r1/xine-lib-1.0/src
-I../../src/xine-engine
-I/home/leon/oe/test.dev/tmp/work/armv5te-linux/libxine-fb-1.0-r1/xine-lib-1.0/src/xine-engine
-I/home/leon/oe/test.dev/tmp/work/armv5te-linux/libxine-fb-1.0-r1/xine-lib-1.0/src/xine-utils
-I../../src/input
-I/home/leon/oe/test.dev/tmp/work/armv5te-linux/libxine-fb-1.0-r1/xine-lib-1.0/src/input
-I/home/leon/oe/test.dev/tmp/work/armv5te-linux/libxine-fb-1.0-r1/xine-lib-1.0/lib
-isystem/home/leon/oe/test.dev/tmp/staging/arm-linux/include -O2 -fsigned-char
-ffast-math -march=armv4 -mtune=xscale -fomit-frame-pointer -fthread-jumps
-fregmove -Wall -DNDEBUG -D_REENTRANT -D_FILE_OFFSET_BITS=64 -DXINE_COMPILE
-Wpointer-arith -Wnested-externs -Wcast-align -Wchar-subscripts
-Wmissing-declarations -Wmissing-prototypes
-isystem/home/leon/oe/test.dev/tmp/staging/arm-linux/include
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -MT
bitplane.lo -MD -MP -MF .deps/bitplane.Tpo -c bitplane.c  -fPIC -DPIC -o
.libs/bitplane.o
CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/libpng12
cc1: internal compiler error: Aborted
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://gcc.gnu.org/bugs.html> for instructions.
make[3]: *** [xineplug_decode_image_la-image.lo] Error 1
make[3]: *** Waiting for unfinished jobs....
---------------------------------------------------------------------------

And , here is detail information for this bug:

---------------------------------------------------------------------------
leon@build-server:~/oe/test.dev$ vi
tmp/work/armv5te-linux/libxine-fb-1.0-r1/xine-lib-1.0/configure.ac

   1010 dnl ---------------------------------------------
   1011 dnl PNG lib.
   1012 dnl ---------------------------------------------
   1013
   1014 AC_PATH_PROG(LIBPNG_CONFIG, libpng-config, no)
   1015 if test "$LIBPNG_CONFIG" = "no" ; then
   1016   AC_CHECK_LIB(png, png_create_read_struct,
   1017                   have_libpng=yes
   1018                   PNG_LIBS="-lpng",
   1019   AC_MSG_RESULT([*** All libpng dependent parts will be disabled ***]))
   1020 else
   1021   PNG_CFLAGS=`$LIBPNG_CONFIG --cflags`
   1022   PNG_LIBS=`$LIBPNG_CONFIG --libs`
   1023   have_libpng="yes"
   1024   AC_DEFINE(HAVE_LIBPNG,1,[Define this if you have png library])
   1025 fi

leon@build-server:~/oe/test.dev$ ./tmp/staging/i686-linux/bin/libpng-config
--cflags
-I/usr/include/libpng12
leon@build-server:~/oe/test.dev$ ./tmp/staging/i686-linux/bin/libpng-config
--I_opts
-I/usr/include/libpng12


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


