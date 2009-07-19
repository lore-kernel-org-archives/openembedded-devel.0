Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1MSSMf-0006xN-9I
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Jul 2009 11:07:25 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 7BA3716DE88
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jul 2009 10:57:34 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 9EDFA2A4247
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jul 2009 10:53:36 +0200 (CEST)
Received: from [10.24.0.58] ([10.24.0.58]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Sun, 19 Jul 2009 10:53:00 +0200
Message-ID: <4A62DF07.8000804@dresearch.de>
Date: Sun, 19 Jul 2009 10:53:27 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 19 Jul 2009 08:53:00.0984 (UTC)
	FILETIME=[52026380:01CA084E]
Subject: do_qa_configure apr-util_1.3.4 fails
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
X-List-Received-Date: Sun, 19 Jul 2009 09:07:25 -0000
Content-Type: multipart/mixed; boundary="------------000206050308060100090808"

--------------000206050308060100090808
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In the current dev branch:

NOTE: Running task 1694 of 3083 (ID: 1540, /opt/openembedded/recipes/apr/apr-util_1.3.4.bb, do_qa_configure)
ERROR: This autoconf log indicates errors, it looked at host includes.
Rerun configure task after fixing this. The path was '/home/sledz/work/HydraIP/OpenEmbedded/tmp.3/work/armv5te-angstrom-linux-gnueabi/apr-util-1.3.4-r5/apr-util-1.3.4'
ERROR: Error in executing: /opt/openembedded/recipes/apr/apr-util_1.3.4.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Build of /opt/openembedded/recipes/apr/apr-util_1.3.4.bb do_qa_configure failed
ERROR: Task 1540 (/opt/openembedded/recipes/apr/apr-util_1.3.4.bb, do_qa_configure) failed

I'd a look into the configure log (see attached file) but couldn't find the autoconf problem which causes this error. :(

Steffen
automake (GNU automake) 1.10.2
Copyright (C) 2008 Free Software Foundation, Inc.
License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Tom Tromey <tromey@redhat.com>
       and Alexandre Duret-Lutz <adl@gnu.org>.
AUTOV is 1.10
NOTE: Executing autoreconf --verbose --install --force --exclude=autopoint -I /home/sledz/work/HydraIP/OpenEmbedded/tmp.3/work/armv5te-angstrom-linux-gnueabi/apr-util-1.3.4-r5/apr-util-1.3.4/build/ -I/home/sledz/work/HydraIP/OpenEmbedded/tmp.3/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-1.10 -I /home/sledz/work/HydraIP/OpenEmbedded/tmp.3/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal
autoreconf: Entering directory `.'
autoreconf: configure.in: not using Gettext
autoreconf: running: aclocal -I /home/sledz/work/HydraIP/OpenEmbedded/tmp.3/work/armv5te-angstrom-linux-gnueabi/apr-util-1.3.4-r5/apr-util-1.3.4/build/ -I /home/sledz/work/HydraIP/OpenEmbedded/tmp.3/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-1.10 -I /home/sledz/work/HydraIP/OpenEmbedded/tmp.3/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal --force 
autoreconf: configure.in: tracing
autoreconf: running: libtoolize --copy --force
libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, `build'.
libtoolize: copying file `build/ltmain.sh'
libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.in and
libtoolize: rerunning libtoolize, to keep the correct libtool macros in-tree.
libtoolize: Consider adding `-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
autoreconf: running: /home/sledz/work/HydraIP/OpenEmbedded/tmp.3/staging/i686-linux/usr/bin/autoconf --include=/home/sledz/work/HydraIP/OpenEmbedded/tmp.3/work/armv5te-angstrom-linux-gnueabi/apr-util-1.3.4-r5/apr-util-1.3.4/build/ --include=/home/sledz/work/HydraIP/OpenEmbedded/tmp.3/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-1.10 --include=/home/sledz/work/HydraIP/OpenEmbedded/tmp.3/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal --force --warnings=cross
autoreconf: running: /home/sledz/work/HydraIP/OpenEmbedded/tmp.3/staging/i686-linux/usr/bin/autoheader --include=/home/sledz/work/HydraIP/OpenEmbedded/tmp.3/work/armv5te-angstrom-linux-gnueabi/apr-util-1.3.4-r5/apr-util-1.3.4/build/ --include=/home/sledz/work/HydraIP/OpenEmbedded/tmp.3/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-1.10 --include=/home/sledz/work/HydraIP/OpenEmbedded/tmp.3/staging/armv5te-angstrom-linux-gnueabi/usr/share/aclocal --force --warnings=cross
autoreconf: configure.in: not using Automake
autoreconf: running: gnu-configize
autoreconf: Leaving directory `.'
NOTE: Running /home/sledz/work/HydraIP/OpenEmbedded/tmp.3/work/armv5te-angstrom-linux-gnueabi/apr-util-1.3.4-r5/apr-util-1.3.4/configure 		    --build=i686-linux 		    --host=arm-angstrom-linux-gnueabi 		    --target=arm-angstrom-linux-gnueabi 		    --prefix=/usr 		    --exec_prefix=/usr 		    --bindir=/usr/bin 		    --sbindir=/usr/sbin 		    --libexecdir=/usr/libexec 		    --datadir=/usr/share 		    --sysconfdir=/etc 		    --sharedstatedir=/usr/com 		    --localstatedir=/var 		    --libdir=/usr/lib 		    --includedir=/usr/include 		    --oldincludedir=/usr/include 		    --infodir=/usr/share/info 		    --mandir=/usr/share/man 			--with-apr=/home/sledz/work/HydraIP/OpenEmbedded/tmp.3/staging/i686-linux/usr/bin/armv5te-angstrom-linux-gnueabi/apr-1-config 		--with-dbm=gdbm 		--with-gdbm=/home/sledz/work/HydraIP/OpenEmbedded/tmp.3/staging/armv5te-angstrom-linux-gnueabi/usr 		--without-sqlite2 		--without-sqlite3 		--with-expat=/home/sledz/work/HydraIP/OpenEmbedded/tmp.3/staging/armv5te-angstrom-linux-gnueabi/usr 		    ...
configure: loading site script /opt/openembedded/site/endian-little
configure: loading site script /opt/openembedded/site/common-linux
configure: loading site script /opt/openembedded/site/common-glibc
configure: loading site script /opt/openembedded/site/arm-common
configure: loading site script /opt/openembedded/site/arm-linux
configure: loading site script /opt/openembedded/site/common
configure: loading site script /opt/openembedded/site/common
checking build system type... i686-pc-linux-gnu
checking host system type... arm-angstrom-linux-gnueabi
checking target system type... arm-angstrom-linux-gnueabi
checking for a BSD-compatible install... /home/sledz/work/HydraIP/OpenEmbedded/tmp.3/staging/i686-linux/usr/bin/install -c
checking for working mkdir -p... yes
APR-util Version: 1.3.4
checking for chosen layout... apr-util
checking for arm-angstrom-linux-gnueabi-gcc... arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... yes
checking for suffix of executables... 
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb accepts -g... yes
checking for arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb option to accept ISO C89... none needed
Applying apr-util hints file rules for arm-angstrom-linux-gnueabi
checking for APR... yes
  adding "-DLINUX=2" to CPPFLAGS
  adding "-D_REENTRANT" to CPPFLAGS
  adding "-D_GNU_SOURCE" to CPPFLAGS
checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gcc -E
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
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
checking for ldap support...
checking checking for gdbm in /home/sledz/work/HydraIP/OpenEmbedded/tmp.3/staging/armv5te-angstrom-linux-gnueabi/usr... checking gdbm.h usability... yes
checking gdbm.h presence... yes
checking for gdbm.h... yes
checking for gdbm_open in -lgdbm... yes
  setting APRUTIL_LDFLAGS to "-L/home/sledz/work/HydraIP/OpenEmbedded/tmp.3/staging/armv5te-angstrom-linux-gnueabi/usr/lib"
  setting APRUTIL_INCLUDES to "-I/home/sledz/work/HydraIP/OpenEmbedded/tmp.3/staging/armv5te-angstrom-linux-gnueabi/usr/include"
checking for default DBM... gdbm
  setting APRUTIL_EXPORT_LIBS to "-lgdbm"
  setting APRUTIL_LIBS to "-lgdbm"
checking for pg_config... /usr/bin/pg_config
  adding "-I/usr/include/pgsql" to CPPFLAGS
  adding "-L/usr/lib" to LDFLAGS
checking libpq-fe.h usability... no
checking libpq-fe.h presence... no
checking for libpq-fe.h... no
checking postgresql/libpq-fe.h usability... no
checking postgresql/libpq-fe.h presence... no
checking for postgresql/libpq-fe.h... no
checking sybdb.h usability... no
checking sybdb.h presence... no
checking for sybdb.h... no
checking for odbc_config... /usr/bin/odbc_config
  adding "-I/usr/include" to CPPFLAGS
  adding "-L/usr/lib" to LDFLAGS
  setting LIBS to "-L/usr/lib -lodbc"
checking sql.h usability... no
checking sql.h presence... no
checking for sql.h... no
checking odbc/sql.h usability... no
checking odbc/sql.h presence... no
checking for odbc/sql.h... no
  adding "-I/home/sledz/work/HydraIP/OpenEmbedded/tmp.3/staging/armv5te-angstrom-linux-gnueabi/usr/include" to CPPFLAGS
checking Expat 1.95.x... yes
  adding "-lexpat" to APRUTIL_EXPORT_LIBS
  adding "-lexpat" to APRUTIL_LIBS
checking iconv.h usability... yes
checking iconv.h presence... yes
checking for iconv.h... yes
checking for type of inbuf parameter to iconv... char **
checking for iconv.h... (cached) yes
checking langinfo.h usability... yes
checking langinfo.h presence... yes
checking for langinfo.h... yes
checking for nl_langinfo... yes
checking for CODESET in langinfo.h... yes
checking for library containing crypt... -lcrypt
checking if system crypt() function is threadsafe... no
checking for crypt_r... yes
checking style of crypt_r... struct_crypt_data
  adding "-lapr-1" to APRUTIL_LIBS
  adding "-lrt" to APRUTIL_LIBS
  adding "-lcrypt" to APRUTIL_LIBS
  adding "-ldl" to APRUTIL_LIBS
configure: creating ./config.status
config.status: creating Makefile
config.status: creating export_vars.sh
config.status: creating build/pkg/pkginfo
config.status: creating apr-util.pc
config.status: creating apu-1-config
config.status: creating include/private/apu_select_dbm.h
config.status: creating include/apr_ldap.h
config.status: creating include/apu.h
config.status: creating include/apu_want.h
config.status: creating test/Makefile
config.status: creating include/private/apu_config.h
config.status: executing default commands
checking for a sed that does not truncate output... /usr/bin/sed
checking for fgrep... /usr/bin/grep -F
checking for ld used by arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb... arm-angstrom-linux-gnueabi-ld
checking if the linker (arm-angstrom-linux-gnueabi-ld) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... /home/sledz/work/HydraIP/OpenEmbedded/tmp.3/cross/armv5te/bin/arm-angstrom-linux-gnueabi-nm -B
checking the name lister (/home/sledz/work/HydraIP/OpenEmbedded/tmp.3/cross/armv5te/bin/arm-angstrom-linux-gnueabi-nm -B) interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 1572864
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+="... yes
checking for arm-angstrom-linux-gnueabi-ld option to reload object files... -r
checking how to recognize dependent libraries... pass_all
checking for arm-angstrom-linux-gnueabi-ar... arm-angstrom-linux-gnueabi-ar
checking for arm-angstrom-linux-gnueabi-strip... arm-angstrom-linux-gnueabi-strip
checking for arm-angstrom-linux-gnueabi-ranlib... arm-angstrom-linux-gnueabi-ranlib
checking command to parse /home/sledz/work/HydraIP/OpenEmbedded/tmp.3/cross/armv5te/bin/arm-angstrom-linux-gnueabi-nm -B output from arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb object... ok
checking for dlfcn.h... yes
checking for objdir... .libs
checking if arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb supports -fno-rtti -fno-exceptions... no
checking for arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb option to produce PIC... -fPIC -DPIC
checking if arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb PIC flag -fPIC -DPIC works... yes
checking if arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb static flag -static works... yes
checking if arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb supports -c -o file.o... yes
checking if arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb supports -c -o file.o... (cached) yes
checking whether the arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mno-thumb linker (arm-angstrom-linux-gnueabi-ld) supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes

--------------000206050308060100090808--
