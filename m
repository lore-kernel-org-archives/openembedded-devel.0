Received: from [85.37.16.15] (helo=smtpout13.attiva.biz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pisa.t@teledata-i.com>) id 1LRn8x-0007rm-9e
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jan 2009 13:34:15 +0100
Received: from FBCMFE02B07.fbc.local ([192.168.30.95]) by smtpout13.attiva.biz
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Tue, 27 Jan 2009 13:26:45 +0100
Received: from [193.100.100.77] ([80.207.73.242]) by FBCMFE02B07.fbc.local
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Tue, 27 Jan 2009 13:26:48 +0100
From: Paolo Cremonese <pisa.t@teledata-i.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jan 2009 13:25:40 +0100
Message-Id: <1233059140.7818.4.camel@ubuntu2>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-OriginalArrivalTime: 27 Jan 2009 12:26:48.0665 (UTC)
	FILETIME=[86706C90:01C9807A]
Subject: Build problems
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
X-List-Received-Date: Tue, 27 Jan 2009 12:34:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi all.
I'm new in Openembedded.
I'm trying to build an image ( bitbake opie-image), and I get errors.
In the following the output of bitbake:

Can anyone help me?

Thanks in advance,
Paolo



NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it
to increase performance.
NOTE: Handling BitBake files: \ (6411/6411) [100 %]
NOTE: Parsing finished. 6140 cached, 0 parsed, 271 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: build 200901271107: started

OE Build Configuration:
BB_VERSION        = "1.8.13"
METADATA_BRANCH   = "org.openembedded.dev"
METADATA_REVISION = "a41bdd6cda499d2629ce2a156348620b7ab7afc4"
TARGET_ARCH       = "i686"
TARGET_OS         = "linux"
MACHINE           = "i686-generic"
DISTRO            = "minimal"
DISTRO_VERSION    = ".dev-snapshot-20090127"
TARGET_FPU        = ""

NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for virtual/i686-linux-binutils
(binutils-cross, external-toolchain);
NOTE: consider defining PREFERRED_PROVIDER_virtual/i686-linux-binutils
NOTE: multiple providers are available for virtual/libqte2
(qte-mt-static, qte, qte-mt);
NOTE: consider defining PREFERRED_PROVIDER_virtual/libqte2
NOTE: multiple providers are available for
virtual/i686-linux-libc-initial (glibc-initial, eglibc-initial);
NOTE: consider defining
PREFERRED_PROVIDER_virtual/i686-linux-libc-initial
NOTE: multiple providers are available for gconf (gconf, gconf-dbus);
NOTE: consider defining PREFERRED_PROVIDER_gconf
NOTE: multiple providers are available for avahi (avahi, avahi-python);
NOTE: consider defining PREFERRED_PROVIDER_avahi
NOTE: multiple providers are available for virtual/db (db3, db);
NOTE: consider defining PREFERRED_PROVIDER_virtual/db
NOTE: multiple providers are available for virtual/db-native
(db3-native, db-native);
NOTE: consider defining PREFERRED_PROVIDER_virtual/db-native
NOTE: multiple providers are available for gtk+ (gtk+, gtk
+-fastscaling);
NOTE: consider defining PREFERRED_PROVIDER_gtk+
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 60 of 2525 (ID:
1007, /home/paolo/oe/stuff/openembedded/packages/pkgconfig/pkgconfig-native_0.22.bb, do_setscene)
NOTE: package pkgconfig-native-0.22: started
NOTE: package pkgconfig-native-0.22-r7: task do_setscene: started
NOTE: package pkgconfig-native-0.22-r7: task do_setscene: completed
NOTE: package pkgconfig-native-0.22: completed
NOTE: Running task 61 of 2525 (ID:
1008, /home/paolo/oe/stuff/openembedded/packages/pkgconfig/pkgconfig-native_0.22.bb, do_fetch)
NOTE: package pkgconfig-native-0.22: started
NOTE: package pkgconfig-native-0.22-r7: task do_fetch: started
NOTE: fetch
http://pkgconfig.freedesktop.org/releases/pkg-config-0.22.tar.gz
--11:09:10--
http://pkgconfig.freedesktop.org/releases/pkg-config-0.22.tar.gz
           => `/home/paolo/sources/pkg-config-0.22.tar.gz'
Resolving pkgconfig.freedesktop.org... 131.252.210.176
Connecting to pkgconfig.freedesktop.org|131.252.210.176|:80...
connected.
HTTP request sent, awaiting response... 200 OK
Length: 1,006,425 (983K) [application/x-gzip]

100%[====================================>] 1,006,425    206.02K/s
ETA 00:00

11:09:16 (181.24 KB/s) - `/home/paolo/sources/pkg-config-0.22.tar.gz'
saved [1006425/1006425]

NOTE: package pkgconfig-native-0.22-r7: task do_fetch: completed
NOTE: package pkgconfig-native-0.22: completed
NOTE: Running task 62 of 2525 (ID:
1009, /home/paolo/oe/stuff/openembedded/packages/pkgconfig/pkgconfig-native_0.22.bb, do_unpack)
NOTE: package pkgconfig-native-0.22: started
NOTE: package pkgconfig-native-0.22-r7: task do_unpack: started
NOTE: Unpacking /home/paolo/sources/pkg-config-0.22.tar.gz
to /home/paolo/oe/stuff/build/tmp/work/i686-linux/pkgconfig-native-0.22-r7/
NOTE:
Unpacking /home/paolo/oe/stuff/openembedded/packages/pkgconfig/pkgconfig-0.22/glibconfig-sysdefs.h to /home/paolo/oe/stuff/build/tmp/work/i686-linux/pkgconfig-native-0.22-r7/
NOTE: package pkgconfig-native-0.22-r7: task do_unpack: completed
NOTE: package pkgconfig-native-0.22: completed
NOTE: Running task 64 of 2525 (ID:
1131, /home/paolo/oe/stuff/openembedded/packages/libtool/libtool-cross_1.5.10.bb, do_configure)
NOTE: package libtool-cross-1.5.10: started
NOTE: package libtool-cross-1.5.10-r10: task do_configure: started
ERROR: function do_configure failed
ERROR: log data follows
(/home/paolo/oe/stuff/build/tmp/work/i686-linux/libtool-cross-1.5.10-r10/temp/log.do_configure.7933)
| automake (GNU automake) 1.9.3
| Written by Tom Tromey <tromey@redhat.com>.
| 
| Copyright 2004 Free Software Foundation, Inc.
| This is free software; see the source for copying conditions.  There
is NO
| warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.
| AUTOV is 1.9
| NOTE: Executing autoreconf --verbose --install --force
--exclude=libtoolize
-I /home/paolo/oe/stuff/build/tmp/work/i686-linux/libtool-cross-1.5.10-r10/libtool-1.5.10/ -I/home/paolo/oe/stuff/build/tmp/staging/i686-linux/usr/share/aclocal-1.9 -I /home/paolo/oe/stuff/build/tmp/staging/i686-linux/usr/share/aclocal
| autoreconf: Entering directory `.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal
-I /home/paolo/oe/stuff/build/tmp/work/i686-linux/libtool-cross-1.5.10-r10/libtool-1.5.10/ -I /home/paolo/oe/stuff/build/tmp/staging/i686-linux/usr/share/aclocal-1.9 -I /home/paolo/oe/stuff/build/tmp/staging/i686-linux/usr/share/aclocal --force
| autoreconf: configure.ac: tracing
| autoreconf: configure.ac: adding subdirectory libltdl to autoreconf
| autoreconf: Entering directory `libltdl'
| autoreconf:
running: /home/paolo/oe/stuff/build/tmp/staging/i686-linux/usr/bin/autoconf --include=/home/paolo/oe/stuff/build/tmp/work/i686-linux/libtool-cross-1.5.10-r10/libtool-1.5.10/ --include=/home/paolo/oe/stuff/build/tmp/staging/i686-linux/usr/share/aclocal-1.9 --include=/home/paolo/oe/stuff/build/tmp/staging/i686-linux/usr/share/aclocal --force --warnings=cross
| autoreconf:
running: /home/paolo/oe/stuff/build/tmp/staging/i686-linux/usr/bin/autoheader --include=/home/paolo/oe/stuff/build/tmp/work/i686-linux/libtool-cross-1.5.10-r10/libtool-1.5.10/ --include=/home/paolo/oe/stuff/build/tmp/staging/i686-linux/usr/share/aclocal-1.9 --include=/home/paolo/oe/stuff/build/tmp/staging/i686-linux/usr/share/aclocal --force --warnings=cross
| autoreconf: running: automake --foreign --add-missing --copy
--force-missing --warnings=cross
| automake: unknown warning category `cross'
| autoreconf: running: gnu-configize
| autoreconf: Leaving directory `libltdl'
| autoreconf: configure.ac: not using Autoheader
| automake: unknown warning category `cross'
| autoreconf: Leaving directory `.'
| NOTE:
Running /home/paolo/oe/stuff/build/tmp/work/i686-linux/libtool-cross-1.5.10-r10/libtool-1.5.10/configure 		    --build=i686-linux 		    --host=i686-linux 		    --target=i686-linux 		    --prefix=/home/paolo/oe/stuff/build/tmp/staging/i686-linux/usr 		    --exec_prefix=/home/paolo/oe/stuff/build/tmp/staging/i686-linux/usr 		    --bindir=/home/paolo/oe/stuff/build/tmp/staging/i686-linux/usr/bin 		    --sbindir=/usr/sbin 		    --libexecdir=/usr/libexec 		    --datadir=/usr/share 		    --sysconfdir=/etc 		    --sharedstatedir=/usr/com 		    --localstatedir=/var 		    --libdir=/usr/lib 		    --includedir=/usr/include 		    --oldincludedir=/usr/include 		    --infodir=/usr/share/info 		    --mandir=/usr/share/man 			 		    ...
| configure: loading site
script /home/paolo/oe/stuff/openembedded/site/endian-little
| configure: loading site
script /home/paolo/oe/stuff/openembedded/site/common-linux
| configure: loading site
script /home/paolo/oe/stuff/openembedded/site/common-glibc
| configure: loading site
script /home/paolo/oe/stuff/openembedded/site/ix86-common
| configure: loading site
script /home/paolo/oe/stuff/openembedded/site/common
| configure: loading site
script /home/paolo/oe/stuff/openembedded/site/common
| checking for a BSD-compatible install... /usr/bin/install -c
| checking whether build environment is sane... yes
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking for i686-linux-gcc... ccache i686-linux-gcc -march=pentiumpro
| checking for C compiler default output file name...
| configure: error: C compiler cannot create executables
| See `config.log' for more details.
| FATAL: oe_runconf failed
NOTE: Task
failed: /home/paolo/oe/stuff/build/tmp/work/i686-linux/libtool-cross-1.5.10-r10/temp/log.do_configure.7933
NOTE: package libtool-cross-1.5.10-r10: task do_configure: failed
ERROR: TaskFailed event exception, aborting
NOTE: package libtool-cross-1.5.10: failed
ERROR: Build
of /home/paolo/oe/stuff/openembedded/packages/libtool/libtool-cross_1.5.10.bb do_configure failed
ERROR: Task 1131
(/home/paolo/oe/stuff/openembedded/packages/libtool/libtool-cross_1.5.10.bb, do_configure) failed
NOTE: Tasks Summary: Attempted 63 tasks of which 60 didn't need to be
rerun and 1 failed.
ERROR:
'/home/paolo/oe/stuff/openembedded/packages/libtool/libtool-cross_1.5.10.bb' failed
NOTE: build 200901271107: completed
paolo@ubuntu2:~/oe/stuff/build$ 





