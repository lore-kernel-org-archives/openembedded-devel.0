Received: from [66.249.92.168] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <shawn.t.rutledge@gmail.com>) id 1IQrfS-0001tq-Fu
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Aug 2007 23:35:10 +0200
Received: by ug-out-1314.google.com with SMTP id m3so265189ugc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Aug 2007 14:33:16 -0700 (PDT)
Received: by 10.78.149.15 with SMTP id w15mr735729hud.1188509595743;
	Thu, 30 Aug 2007 14:33:15 -0700 (PDT)
Received: by 10.78.58.11 with HTTP; Thu, 30 Aug 2007 14:33:15 -0700 (PDT)
Message-ID: <d9a6586e0708301433p211017d4udde2bd8d06cded6b@mail.gmail.com>
Date: Thu, 30 Aug 2007 14:33:15 -0700
From: "Shawn Rutledge" <shawn.t.rutledge@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d9a6586e0708292025lae9d9bav35b518fe284b73@mail.gmail.com>
MIME-Version: 1.0
References: <d9a6586e0708292025lae9d9bav35b518fe284b73@mail.gmail.com>
Subject: cross compile badness
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
X-List-Received-Date: Thu, 30 Aug 2007 21:35:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Sorry for cross-posting...

---------- Forwarded message ----------
From: Shawn Rutledge <shawn.t.rutledge@gmail.com>
Date: Aug 29, 2007 8:25 PM
Subject: cross compile badness
To: openmoko-devel@lists.openmoko.org


While doing this with the MokoMakefile on my Gentoo box:

make setup update openmoko-devel-image

| /home/rutledge/moko/build/tmp/work/armv4t-angstrom-linux-gnueabi/gcc-cross-initial-4.1.2-r4/gcc-4.1.2/build.i686-linux.arm-angstrom-linux-gnueabi/./gcc/xgcc
-B/home/rutledge/moko/build/tmp/work/armv4t-angstrom-linux-gnueabi/gcc-cross-initial-4.1.2-r4/gcc-4.1.2/build.i686-linux.arm-angstrom-linux-gnueabi/./gcc/
-isystem/home/rutledge/moko/build/tmp/staging/i686-linux/include
-B/home/rutledge/moko/build/tmp/cross/arm-angstrom-linux-gnueabi/bin/
-B/home/rutledge/moko/build/tmp/cross/arm-angstrom-linux-gnueabi/lib/
-isystem /home/rutledge/moko/build/tmp/cross/arm-angstrom-linux-gnueabi/include
-isystem /home/rutledge/moko/build/tmp/cross/arm-angstrom-linux-gnueabi/sys-include
-O2 -g -Os -DIN_GCC -DCROSS_COMPILE   -W -Wall -Wwrite-strings
-Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition
-isystem ./include  -I. -I.
-I/home/rutledge/moko/build/tmp/work/armv4t-angstrom-linux-gnueabi/gcc-cross-initial-4.1.2-r4/gcc-4.1.2/gcc
-I/home/rutledge/moko/build/tmp/work/armv4t-angstrom-linux-gnueabi/gcc-cross-initial-4.1.2-r4/gcc-4.1.2/gcc/.
-I/home/rutledge/moko/build/tmp/work/armv4t-angstrom-linux-gnueabi/gcc-cross-initial-4.1.2-r4/gcc-4.1.2/gcc/../include
-I/home/rutledge/moko/build/tmp/work/armv4t-angstrom-linux-gnueabi/gcc-cross-initial-4.1.2-r4/gcc-4.1.2/gcc/../libcpp/include
  -g0 -finhibit-size-directive -fno-inline-functions -fno-exceptions
-fno-zero-initialized-in-bss -fno-unit-at-a-time -Dinhibit_libc  \
|         -c /home/rutledge/moko/build/tmp/work/armv4t-angstrom-linux-gnueabi/gcc-cross-initial-4.1.2-r4/gcc-4.1.2/gcc/crtstuff.c
-DCRT_BEGIN \
|         -o crtbegin.o
| CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/libffi
| cc1: internal compiler error: in add_path, at c-incpath.c:362
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <URL:http://gcc.gnu.org/bugs.html> for instructions.
| make[3]: *** [crtbegin.o] Error 1
| make[3]: Leaving directory
`/home/rutledge/moko/build/tmp/work/armv4t-angstrom-linux-gnueabi/gcc-cross-initial-4.1.2-r4/gcc-4.1.2/build.i686-linux.arm-angstrom-linux-gnueabi/gcc'
| make[2]: *** [all-gcc] Error 2
| make[2]: Leaving directory
`/home/rutledge/moko/build/tmp/work/armv4t-angstrom-linux-gnueabi/gcc-cross-initial-4.1.2-r4/gcc-4.1.2/build.i686-linux.arm-angstrom-linux-gnueabi'
| make[1]: *** [all] Error 2
| make[1]: Leaving directory
`/home/rutledge/moko/build/tmp/work/armv4t-angstrom-linux-gnueabi/gcc-cross-initial-4.1.2-r4/gcc-4.1.2/build.i686-linux.arm-angstrom-linux-gnueabi'
| FATAL: oe_runmake failed
NOTE: Task failed:
/home/rutledge/moko/build/tmp/work/armv4t-angstrom-linux-gnueabi/gcc-cross-initial-4.1.2-r4/temp/log.do_compile.23326
NOTE: package gcc-cross-initial-4.1.2-r4: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package gcc-cross-initial-4.1.2: failed
ERROR: Build of
/home/rutledge/moko/openembedded/packages/gcc/gcc-cross-initial_4.1.2.bb
do_compile failed
ERROR: Task 2527
(/home/rutledge/moko/openembedded/packages/gcc/gcc-cross-initial_4.1.2.bb,
do_compile) failed
NOTE: Tasks Summary: Attempted 209 tasks of which 209 didn't need to
be rerun and 1 failed.
ERROR: '/home/rutledge/moko/openembedded/packages/gcc/gcc-cross-initial_4.1.2.bb'
failed
make: *** [openmoko-devel-image] Error 1

(It's not the first time this has happened to me, but I never figured
it out last time)


