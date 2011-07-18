Received: from mail-ey0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QigG2-0001NR-NO
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jul 2011 07:20:42 +0200
Received: by eye4 with SMTP id 4so1171963eye.37
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jul 2011 22:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=z61dWJNnPyzii+Zbw6FS2cUONA80Kjs2VJqZqkNqtbE=;
	b=eY43oOCaD5yWnRZUlWo0G1zABu86b3Nv0yBIeXAaSdMAetJSJPA3+TSGJZYtgJY4eF
	0Ws/uV7XtuktJ0D7xNmrQlw3TRbp76/mXd6FZYjdMe10xM4tazUIiBxLHt58aIw59jP4
	O1AZzDyh3UL/t7qSwBzthdzLXfW3VvzynqJvU=
MIME-Version: 1.0
Received: by 10.213.32.211 with SMTP id e19mr1076944ebd.136.1310966195744;
	Sun, 17 Jul 2011 22:16:35 -0700 (PDT)
Received: by 10.213.105.210 with HTTP; Sun, 17 Jul 2011 22:16:35 -0700 (PDT)
Date: Mon, 18 Jul 2011 00:16:35 -0500
Message-ID: <CAD=GYpbJaYh9iViHjocf24z98LKnsH0Mq7cBy_9p_hULf1gYnQ@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: angstrom-distro-devel@linuxtogo.org
Cc: beagleboard@googlegroups.com, openembedded-devel@lists.openembedded.org,
	"Kridner, Jason" <jdk@ti.com>
Subject: Bitbake build failure of Angstrom
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
X-List-Received-Date: Mon, 18 Jul 2011 05:20:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I am attempting to manually rebuild the BeagleBoard validation image
using bitbake.

For this, I used the revision found in /etc/angstrom-version of an
image I built with Narcissus. The OE revision I used referring to the
above version file is: a1f31c757d2514e946737d60789c6f9f05ce38eb (Which
happens to be my fix for GPIO)

Now, when I run a "bitbake beagleboard-validation-gnome-image -k ",
below is the output showing that there are build failures with
libgbod, libnet-dbus-perl. The build did not complete (some 40 tasks
short).

A question that arises is, if Narcissus could build an image with this
tag without failures, why couldn't bitbake?

Here is a build log:
---
NOTE: Preparing runqueue
NOTE: Executing RunQueue Tasks
NOTE: Running task 4475 of 8704 (ID: 5042,
/home/oebuild/angstrom-oe/setup-scripts-maint/sources/openembedded/recipes/libgpod/libgpod_0.7.92.bb,
do_compile)
NOTE: Running task 5632 of 8704 (ID: 2715,
/home/oebuild/angstrom-oe/setup-scripts-maint/sources/openembedded/recipes/perl/libnet-dbus-perl_0.33.6.bb,
do_compile)
NOTE: package libgpod-0.7.92-r0: task do_compile: Started
NOTE: Running task 5721 of 8704 (ID: 1875,
/home/oebuild/angstrom-oe/setup-scripts-maint/sources/openembedded/recipes/synergy/synergy_1.3.1.bb,
do_compile)
NOTE: package libnet-dbus-perl-0.33.6-r4: task do_compile: Started
ERROR: Logfile of failure stored in:
/home/oebuild/angstrom-oe/setup-scripts-maint/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/libnet-dbus-perl-0.33.6-r4/temp/log.do_compil
e.15567
Log data follows:
| + do_compile
| + cpan_do_compile
| + oe_runmake 'PASTHRU_INC= -fexpensive-optimizations
-frename-registers -fomit-frame-pointer -O2 -ggdb2' 'CCFLAGS=
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
-g
gdb2' 'LD=arm-angstrom-linux-gnueabi-gcc -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb --sysroot=/home/oebuild/angstrom-oe/setup-scripts-maint/b
uild/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi'
| + oenote make -j8 -e MAKEFLAGS= 'PASTHRU_INC=
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
-ggdb2' 'CCFLAGS= -fexpensive-optimizations -frename-registers
-fomit-f
rame-pointer -O2 -ggdb2' 'LD=arm-angstrom-linux-gnueabi-gcc
-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
-mthumb-interwork -mno-thumb --sysroot=/home/oebuild/angstrom-oe/se
tup-scripts-maint/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi'
| + echo NOTE: 'make -j8 -e MAKEFLAGS= PASTHRU_INC=
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
-ggdb2 CCFLAGS= -fexpensive-optimizations -frename-registers -fomit
-frame-pointer -O2 -ggdb2 LD=arm-angstrom-linux-gnueabi-gcc
-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
-mthumb-interwork -mno-thumb --sysroot=/home/oebuild/angstrom-oe/se
tup-scripts-maint/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi'
| NOTE: make -j8 -e MAKEFLAGS= PASTHRU_INC= -fexpensive-optimizations
-frename-registers -fomit-frame-pointer -O2 -ggdb2 CCFLAGS=
-fexpensive-optimizations -frename-registers -fomit-frame-p
ointer -O2 -ggdb2 LD=arm-angstrom-linux-gnueabi-gcc -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb --sysroot=/home/oebuild/angstrom-oe/setup-scri
pts-maint/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi
| + make -j8 -e MAKEFLAGS= 'PASTHRU_INC= -fexpensive-optimizations
-frename-registers -fomit-frame-pointer -O2 -ggdb2' 'CCFLAGS=
-fexpensive-optimizations -frename-registers -fomit-frame-po
inter -O2 -ggdb2' 'LD=arm-angstrom-linux-gnueabi-gcc -march=armv7-a
-mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork
-mno-thumb --sysroot=/home/oebuild/angstrom-oe/setup-scr
ipts-maint/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi'
| arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8
-mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb
--sysroot=/home/oebuild/angstrom-oe/setup-scripts-maint/build/tmp
-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi -c
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
-ggdb2 -Wall -I/home/oebuild/angstrom-oe/setup-scripts-maint
/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/home/oebuild/angstrom-oe/setup-scripts-maint/build/tmp-angstrom_2008_1/sysroots/i686-linux/usr/include/dbus-1.0
-I/home/oeb
uild/angstrom-oe/setup-scripts-maint/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/home/oebuild/angstrom-oe/setup-scripts-maint/build/tmp-angstrom_2008_1/sysroots/i686-li
nux/usr/lib/dbus-1.0/include   -fexpensive-optimizations
-frename-registers -fomit-frame-pointer -O2 -ggdb2 -O2
-DVERSION=\"0.33.6\" -DXS_VERSION=\"0.33.6\" -fPIC
"-I/home/oebuild/angstro
m-oe/setup-scripts-maint/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/perl/5.10.1/CORE"
 -DDBUS_API_SUBJECT_TO_CHANGE -DHAVE_CONN_DISCONNECT=0
-DNET_DBUS_DEBUG=1
 DBus.c
| DBus.xs:24:23: error: dbus/dbus.h: No such file or directory
| DBus.xs:41: error: expected '=', ',', ';', 'asm' or '__attribute__'
before '_dbus_parse_int64'
| DBus.xs:51: error: expected '=', ',', ';', 'asm' or '__attribute__'
before '_dbus_parse_uint64'
| DBus.xs:66: error: expected ')' before 'val'
| DBus.xs:83: error: expected ')' before 'val'
| DBus.xs:100: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'connection_data_slot'
| DBus.xs:101: error: expected '=', ',', ';', 'asm' or '__attribute__'
before 'server_data_slot'

| DBus.c:3925: error: 'iter' undeclared (first use in this function)

                                     [157/1898]
| DBus.c:3928: error: expected expression before ')' token
| DBus.xs: In function 'boot_Net__DBus':
| DBus.xs:476: error: 'DBUS_BUS_SYSTEM' undeclared (first use in this function)
| DBus.xs:477: error: 'DBUS_BUS_SESSION' undeclared (first use in this function)
| DBus.xs:478: error: 'DBUS_BUS_STARTER' undeclared (first use in this function)
| DBus.xs:481: error: 'DBUS_TYPE_ARRAY' undeclared (first use in this function)
| DBus.xs:482: error: 'DBUS_TYPE_BOOLEAN' undeclared (first use in
this function)
| DBus.xs:483: error: 'DBUS_TYPE_BYTE' undeclared (first use in this function)
| DBus.xs:484: error: 'DBUS_TYPE_DOUBLE' undeclared (first use in this function)
| DBus.xs:485: error: 'DBUS_TYPE_INT16' undeclared (first use in this function)
| DBus.xs:486: error: 'DBUS_TYPE_INT32' undeclared (first use in this function)
| DBus.xs:487: error: 'DBUS_TYPE_INT64' undeclared (first use in this function)
| DBus.xs:488: error: 'DBUS_TYPE_INVALID' undeclared (first use in
this function)
| DBus.xs:489: error: 'DBUS_TYPE_STRUCT' undeclared (first use in this function)
| DBus.xs:490: error: 'DBUS_TYPE_SIGNATURE' undeclared (first use in
this function)
| DBus.xs:491: error: 'DBUS_TYPE_OBJECT_PATH' undeclared (first use in
this function)
| DBus.xs:492: error: 'DBUS_TYPE_DICT_ENTRY' undeclared (first use in
this function)
| DBus.xs:493: error: 'DBUS_TYPE_STRING' undeclared (first use in this function)
| DBus.xs:494: error: 'DBUS_TYPE_UINT16' undeclared (first use in this function)
| DBus.xs:495: error: 'DBUS_TYPE_UINT32' undeclared (first use in this function)
| DBus.xs:496: error: 'DBUS_TYPE_UINT64' undeclared (first use in this function)
| DBus.xs:497: error: 'DBUS_TYPE_VARIANT' undeclared (first use in
this function)
| DBus.xs:499: error: 'DBUS_MESSAGE_TYPE_METHOD_CALL' undeclared
(first use in this function)
| DBus.xs:500: error: 'DBUS_MESSAGE_TYPE_METHOD_RETURN' undeclared
(first use in this function)
| DBus.xs:501: error: 'DBUS_MESSAGE_TYPE_ERROR' undeclared (first use
in this function)
| DBus.xs:502: error: 'DBUS_MESSAGE_TYPE_SIGNAL' undeclared (first use
in this function)
| DBus.xs:503: error: 'DBUS_MESSAGE_TYPE_INVALID' undeclared (first
use in this function)
| DBus.xs:506: error: 'DBUS_WATCH_READABLE' undeclared (first use in
this function)
| DBus.xs:507: error: 'DBUS_WATCH_WRITABLE' undeclared (first use in
this function)
| DBus.xs:508: error: 'DBUS_WATCH_ERROR' undeclared (first use in this function)
| DBus.xs:509: error: 'DBUS_WATCH_HANGUP' undeclared (first use in
this function)
| DBus.xs:511: warning: implicit declaration of function
'dbus_connection_allocate_data_slot'
| DBus.xs:511: error: 'connection_data_slot' undeclared (first use in
this function)
| DBus.xs:512: warning: implicit declaration of function
'dbus_server_allocate_data_slot'
| DBus.xs:512: error: 'server_data_slot' undeclared (first use in this function)
| DBus.xs:513: warning: implicit declaration of function
'dbus_pending_call_allocate_data_slot'
| DBus.xs:513: error: 'pending_call_data_slot' undeclared (first use
in this function)
| make: *** [DBus.o] Error 1
| + die 'oe_runmake failed'
| + oefatal 'oe_runmake failed'
| + echo FATAL: 'oe_runmake failed'
| FATAL: oe_runmake failed
| + exit 1
NOTE: package libnet-dbus-perl-0.33.6-r4: task do_compile: Failed
ERROR: Function 'do_compile' failed (see
/home/oebuild/angstrom-oe/setup-scripts-maint/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/libnet-dbus-perl-0.33.6-r4/temp/log.do_co
mpile.15567 for further information)
ERROR: Task 2715
(/home/oebuild/angstrom-oe/setup-scripts-maint/sources/openembedded/recipes/perl/libnet-dbus-perl_0.33.6.bb,
do_compile) failed with exit code '1'
ERROR: Logfile of failure stored in:
/home/oebuild/angstrom-oe/setup-scripts-maint/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/libgpod-0.7.92-r0/temp/log.do_compile.15416
Log data follows:

                                     [108/1898]
| + do_compile
| + base_do_compile
| + '[' -e Makefile -o -e makefile -o -e GNUmakefile ']'
| + oe_runmake
| + oenote make -j8
| + echo NOTE: 'make -j8'
| NOTE: make -j8
| + make -j8
| make  all-recursive
| make[1]: Entering directory
`/home/oebuild/angstrom-oe/setup-scripts-maint/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/libgpod-0.7.92-r0/libgpod-0.7.92'
| Making all in src
| make[2]: Entering directory
`/home/oebuild/angstrom-oe/setup-scripts-maint/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/libgpod-0.7.92-r0/libgpod-0.7.92/src'
|   CC     libgpod_la-db-artwork-writer.lo
|   CC     libgpod_la-itdb_artwork.lo
|   CC     libgpod_la-itdb_iphone.lo
|   CC     libgpod_la-itdb_photoalbum.lo
|   CC     libgpod_la-itdb_itunesdb.lo
|   CC     libgpod_la-itdb_playlist.lo
|   CC     libgpod_la-itdb_plist.lo
|   CC     libgpod_la-itdb_sqlite.lo
| db-artwork-writer.c:32:35: error: gdk-pixbuf/gdk-pixbuf.h: No such
file or directory
| itdb_photoalbum.c:41:35: error: gdk-pixbuf/gdk-pixbuf.h: No such
file or directory
| itdb_artwork.c:40:35: error: gdk-pixbuf/gdk-pixbuf.h: No such file
or directory
| itdb_artwork.c: In function 'itdb_thumb_ipod_item_to_pixbuf':
| itdb_artwork.c:815: error: 'GdkPixbuf' undeclared (first use in this function)
| itdb_artwork.c:815: error: (Each undeclared identifier is reported only once
| itdb_artwork.c:815: error: for each function it appears in.)
| itdb_artwork.c:815: error: 'pixbuf_full' undeclared (first use in
this function)
| itdb_artwork.c:816: error: 'pixbuf_sub' undeclared (first use in
this function)
| itdb_artwork.c:817: error: 'pixbuf' undeclared (first use in this function)
| itdb_artwork.c:840: error: 'GDK_COLORSPACE_RGB' undeclared (first
use in this function)
| itdb_artwork.c:844: error: 'GdkPixbufDestroyNotify' undeclared
(first use in this function)
| itdb_artwork.c:844: error: expected ')' before 'g_free'
| make[2]: *** [libgpod_la-itdb_artwork.lo] Error 1
| make[2]: *** Waiting for unfinished jobs....
| db-artwork-writer.c: In function 'ipod_artwork_mark_new_doubles':
| db-artwork-writer.c:1066: warning: passing argument 2 of
'g_checksum_update' makes pointer from integer without a cast
| make[2]: *** [libgpod_la-itdb_photoalbum.lo] Error 1
| make[2]: *** [libgpod_la-db-artwork-writer.lo] Error 1
| make[2]: Leaving directory
`/home/oebuild/angstrom-oe/setup-scripts-maint/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/libgpod-0.7.92-r0/libgpod-0.7.92/src'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/home/oebuild/angstrom-oe/setup-scripts-maint/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/libgpod-0.7.92-r0/libgpod-0.7.92'
| make: *** [all] Error 2
| + die 'oe_runmake failed'
| + oefatal 'oe_runmake failed'
| + echo FATAL: 'oe_runmake failed'
| FATAL: oe_runmake failed
| + exit 1
| itdb_artwork.c:844: error: expected ')' before 'g_free'

                                      [75/1898]
| make[2]: *** [libgpod_la-itdb_artwork.lo] Error 1
| make[2]: *** Waiting for unfinished jobs....
| db-artwork-writer.c: In function 'ipod_artwork_mark_new_doubles':
| db-artwork-writer.c:1066: warning: passing argument 2 of
'g_checksum_update' makes pointer from integer without a cast
| make[2]: *** [libgpod_la-itdb_photoalbum.lo] Error 1
| make[2]: *** [libgpod_la-db-artwork-writer.lo] Error 1
| make[2]: Leaving directory
`/home/oebuild/angstrom-oe/setup-scripts-maint/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/libgpod-0.7.92-r0/libgpod-0.7.92/src'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/home/oebuild/angstrom-oe/setup-scripts-maint/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/libgpod-0.7.92-r0/libgpod-0.7.92'
| make: *** [all] Error 2
| + die 'oe_runmake failed'
| + oefatal 'oe_runmake failed'
| + echo FATAL: 'oe_runmake failed'
| FATAL: oe_runmake failed
| + exit 1
NOTE: package libgpod-0.7.92-r0: task do_compile: Failed
ERROR: Function 'do_compile' failed (see
/home/oebuild/angstrom-oe/setup-scripts-maint/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/libgpod-0.7.92-r0/temp/log.do_compile.154
16 for further information)
NOTE: package synergy-1.3.1-r0: task do_compile: Started
NOTE: package synergy-1.3.1-r0: task do_compile: Succeeded
ERROR: Task 5042
(/home/oebuild/angstrom-oe/setup-scripts-maint/sources/openembedded/recipes/libgpod/libgpod_0.7.92.bb,
do_compile) failed with exit code '1'
NOTE: Running task 8664 of 8704 (ID: 1866,
/home/oebuild/angstrom-oe/setup-scripts-maint/sources/openembedded/recipes/synergy/synergy_1.3.1.bb,
do_install)
NOTE: package synergy-1.3.1-r0: task do_install: Started
NOTE: package synergy-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 8665 of 8704 (ID: 1876,
/home/oebuild/angstrom-oe/setup-scripts-maint/sources/openembedded/recipes/synergy/synergy_1.3.1.bb,
do_package)
NOTE: Running task 8666 of 8704 (ID: 1867,
/home/oebuild/angstrom-oe/setup-scripts-maint/sources/openembedded/recipes/synergy/synergy_1.3.1.bb,
do_populate_sysroot)
NOTE: package synergy-1.3.1-r0: task do_package: Started
NOTE: package synergy-1.3.1-r0: task do_populate_sysroot: Started
NOTE: package synergy-1.3.1-r0: task do_package: Succeeded
NOTE: package synergy-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 8667 of 8704 (ID: 1877,
/home/oebuild/angstrom-oe/setup-scripts-maint/sources/openembedded/recipes/synergy/synergy_1.3.1.bb,
do_package_write_ipk)
Packaged contents of synergy-dbg into
/home/oebuild/angstrom-oe/setup-scripts-maint/build/tmp-angstrom_2008_1/deploy/glibc/ipk/armv7a/synergy-dbg_1.3.1-r0.6_armv7a.ipk
Packaged contents of synergy into
/home/oebuild/angstrom-oe/setup-scripts-maint/build/tmp-angstrom_2008_1/deploy/glibc/ipk/armv7a/synergy_1.3.1-r0.6_armv7a.ipk
NOTE: Running task 8668 of 8704 (ID: 1868,
/home/oebuild/angstrom-oe/setup-scripts-maint/sources/openembedded/recipes/synergy/synergy_1.3.1.bb,
do_qa_staging)
NOTE: package synergy-1.3.1-r0: task do_package_write_ipk: Started
NOTE: package synergy-1.3.1-r0: task do_qa_staging: Started
Packaged contents of synergy-dev into
/home/oebuild/angstrom-oe/setup-scripts-maint/build/tmp-angstrom_2008_1/deploy/glibc/ipk/armv7a/synergy-dev_1.3.1-r0.6_armv7a.ipk
NOTE: package synergy-1.3.1-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 8669 of 8704 (ID: 1869,
/home/oebuild/angstrom-oe/setup-scripts-maint/sources/openembedded/recipes/synergy/synergy_1.3.1.bb,
do_package_write)
NOTE: package synergy-1.3.1-r0: task do_package_write: Started
NOTE: package synergy-1.3.1-r0: task do_package_write: Succeeded
NOTE: package synergy-1.3.1-r0: task do_qa_staging: Succeeded
NOTE: Running task 8670 of 8704 (ID: 1870,
/home/oebuild/angstrom-oe/setup-scripts-maint/sources/openembedded/recipes/synergy/synergy_1.3.1.bb,
do_package_stage)
NOTE: package synergy-1.3.1-r0: task do_package_stage: Started
NOTE: package synergy-1.3.1-r0: task do_package_stage: Succeeded
ERROR: '/home/oebuild/angstrom-oe/setup-scripts-maint/sources/openembedded/recipes/perl/libnet-dbus-perl_0.33.6.bb'
failed
ERROR: '/home/oebuild/angstrom-oe/setup-scripts-maint/sources/openembedded/recipes/libgpod/libgpod_0.7.92.bb'
failed


Thanks
Joel


