Received: from [64.233.182.191] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <axel.lin@gmail.com>) id 1GnB8F-00064s-N1
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Nov 2006 10:44:35 +0100
Received: by nf-out-0910.google.com with SMTP id l24so811663nfc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2006 01:41:39 -0800 (PST)
Received: by 10.82.109.19 with SMTP id h19mr1398549buc.1164274898656;
	Thu, 23 Nov 2006 01:41:38 -0800 (PST)
Received: by 10.82.140.13 with HTTP; Thu, 23 Nov 2006 01:41:38 -0800 (PST)
Message-ID: <427d64720611230141v3bdfe6f2i2820f96ddbbe5050@mail.gmail.com>
Date: Thu, 23 Nov 2006 17:41:38 +0800
From: "axel lin" <axel.lin@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: ffmpeg compile error
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
X-List-Received-Date: Thu, 23 Nov 2006 09:44:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

hi list,
I got below error messages when bitbake ffmpeg.

NOTE: build 200611231701: started

OE Build Configuration:
BB_VERSION     = "1.6.3"
OE_REVISION    = "a070a3b126e8ee81976fc029ae92f485cc8c6248"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux-gnueabi"
MACHINE        = "mainstone"
DISTRO         = "angstrom"
DISTRO_VERSION = "test-20061123"
TARGET_FPU     = "soft"

NOTE: preferred version 2.5 of glibc not available
NOTE: package ffmpeg-0.4.9-pre1: started
NOTE: package ffmpeg-0.4.9-pre1-r1: task do_compile: started
NOTE: SITE files /opt/oe/org.openembedded.dev/site/endian-little
/opt/oe/org.openembedded.dev/site/arm-linux
ERROR: function do_compile failed
ERROR: log data follows
(/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/ffmpeg-0.4.9-pre1-r1/temp/log.do_compile.11809)
| NOTE: make
| make -C libavcodec all
| make[1]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/ffmpeg-0.4.9-pre1-r1/ffmpeg-0.4.9-pre1/libavcodec'
| ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale
-O3 -Wall -isystem/opt/oe/build/tmp/staging/arm-angstrom-linux-gnueabi/include
-O -g -DHAVE_AV_CONFIG_H -I.. -D_FILE_OFFSET_BITS=64
-D_LARGEFILE_SOURCE -D_GNU_SOURCE -fPIC -DPIC -c -o common.o common.c
| In file included from avcodec.h:14,
|                  from common.c:28:
| common.h:69: error: array type has incomplete element type
| common.h:71: error: array type has incomplete element type
| make[1]: *** [common.o] Error 1
| make[1]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/ffmpeg-0.4.9-pre1-r1/ffmpeg-0.4.9-pre1/libavcodec'
| make: *** [lib] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/ffmpeg-0.4.9-pre1-r1/temp/log.do_compile.11809
NOTE: package ffmpeg-0.4.9-pre1-r1: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package ffmpeg-0.4.9-pre1: failed
ERROR: Build of ffmpeg failed
axel@kdc:/opt/oe/build$

I use below steps to fix it.
1. apply the gcc4-fix patch from
http://svn.cross-lfs.org/svn/repos/patches/ffmpeg/ffmpeg-0.4.9-pre1-gcc4-1.patch

2. comment out below code in dsputil.h
--- dsputil.h.ori       2006-11-23 17:30:37.000000000 +0800
+++ dsputil.h   2006-11-23 17:31:21.000000000 +0800
@@ -554,24 +554,4 @@
     return score;\
 }

-#ifndef HAVE_LRINTF
-/* XXX: add ISOC specific test to avoid specific BSD testing. */
-/* better than nothing implementation. */
-/* btw, rintf() is existing on fbsd too -- alex */
-static inline long int lrintf(float x)
-{
-#ifdef CONFIG_WIN32
-    /* XXX: incorrect, but make it compile */
-    return (int)(x);
-#else
-    return (int)(rint(x));
-#endif
-}
-#else
-#ifndef _ISOC9X_SOURCE
-#define _ISOC9X_SOURCE
-#endif
-#include <math.h>
-#endif
-
 #end

3. comment out EXTRALIBS += -lpostproc in
build/tmp/work/armv5te-angstrom-linux-gnueabi/ffmpeg-0.4.9-pre1-r1/ffmpeg-0.4.9-pre1/libavcodec/Makefile
--- Makefile.ori        2006-11-23 17:32:20.000000000 +0800
+++ Makefile    2006-11-23 17:32:33.000000000 +0800
@@ -89,7 +89,7 @@

 ifeq ($(CONFIG_PP),yes)
 ifeq ($(SHARED_PP),yes)
-EXTRALIBS += -lpostproc
+#EXTRALIBS += -lpostproc
 else
 # LIBS += libpostproc/libpostproc.a ... should be fixed
 OBJS += libpostproc/postprocess.o

Not sure if this is the correct way to fix ffmpeg compile problem.
Or is any fix already available to fix the compile problem?

Regards,
Axel


