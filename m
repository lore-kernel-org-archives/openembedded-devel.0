Received: from [203.66.140.6] (helo=mtcmail.mitac-mtc.com.tw)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <Axel.Lin@mitac-mtc.com.tw>) id 1GS59b-0007mg-IH
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Sep 2006 07:06:49 +0200
Received: from taipei7.mitac-mtc.com.tw ([10.68.90.7])
	by mtcmail.mitac-mtc.com.tw with ESMTP id k8Q51oYW044240
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2006 13:01:50 +0800 (CST)
	(envelope-from Axel.Lin@mitac-mtc.com.tw)
Received: by taipei7.mitac-mtc.com.tw with Internet Mail Service (5.5.2657.72)
	id <SFFW6AA6>; Tue, 26 Sep 2006 13:02:33 +0800
Message-ID: <4518B426.6070905@mitac-mtc.com.tw>
From: "Axel.Lin" <Axel.Lin@mitac-mtc.com.tw>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Sep 2006 13:01:26 +0800
MIME-Version: 1.0
X-Mailer: Internet Mail Service (5.5.2657.72)
x-originalarrivaltime: 26 Sep 2006 05:01:47.0669 (UTC)
	FILETIME=[DEA14450:01C6E128]
user-agent: Thunderbird 1.5.0.5 (X11/20060728)
X-MAIL: mtcmail.mitac-mtc.com.tw k8Q51oYW044240
X-Mailman-Approved-At: Tue, 26 Sep 2006 10:59:43 +0200
X-Content-Filtered-By: Mailman/MimeDel 2.1.8
Subject: Failed to build gpe-image ( mainstone/generic )
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
X-List-Received-Date: Tue, 26 Sep 2006 05:06:49 -0000
Content-Type: text/plain;
	charset="BIG5"

hi,
I tried to build gpe-image with generic distro and mainstone machine
setting.
I got below error message.
Could you kindly give me some hints to fix this?

axel@kdc:/opt/oe/build$ bitbake gpe-image
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it
to increase performance.
NOTE: Using cache in '/opt/oe/build/tmp/cache'
NOTE: Handling BitBake files: - (3988/3988) [100 %]
NOTE: Parsing finished. 3848 cached, 0 parsed, 140 skipped, 0 masked.

NOTE: build 200609261252: started

OE Build Configuration:
BB_VERSION = "1.6.1"
OE_REVISION = "a88f8d7e6ddabb9351d127ccf3500ed17c6670fa"
TARGET_ARCH = "arm"
TARGET_OS = "linux"
MACHINE = "mainstone"
DISTRO = "generic"
DISTRO_VERSION = ".dev-snapshot-20060926"
TARGET_FPU = "soft"

NOTE: multiple providers are available (glibc, glibc-intermediate);
NOTE: consider defining PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc
NOTE: multiple providers are available (db3-native, db-native);
NOTE: consider defining PREFERRED_PROVIDER_virtual/db-native
NOTE: preferred version 0.109 of libgpewidget not available
NOTE: multiple providers are available (libgpewidget, libgpewidget-hildon);
NOTE: consider defining PREFERRED_PROVIDER_libgpewidget
NOTE: package gconf-dbus-2.10.0+svn20060719: started
NOTE: package gconf-dbus-2.10.0+svn20060719-r0: task do_configure: started
ERROR: function do_configure failed
ERROR: log data follows
(/opt/oe/build/tmp/work/iwmmxt-linux/gconf-dbus-2.10.0+svn20060719-r0/temp/l
og.do_configure.21972)
| automake (GNU automake) 1.9.3
| Written by Tom Tromey <tromey@redhat.com>.
|
| Copyright 2004 Free Software Foundation, Inc.
| This is free software; see the source for copying conditions. There is NO
| warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.
| AUTOV is 1.9
| NOTE: Executing glib-gettextize --force --copy
| Copying file mkinstalldirs
| Copying file po/Makefile.in.in
|
| Please add the files
| codeset.m4 gettext.m4 glibc21.m4 iconv.m4 isc-posix.m4 lcmessage.m4
| progtest.m4
| from the /opt/oe/build/tmp/staging/i686-linux/share/aclocal directory
to your autoconf macro directory
| or directly to your aclocal.m4 file.
| You will also need config.guess and config.sub, which you can get from
| ftp://ftp.gnu.org/pub/gnu/config/.
|
| NOTE: Executing autoreconf --verbose --install --force
--exclude=autopoint -I
/opt/oe/build/tmp/staging/arm-linux/share/aclocal-1.9 -I
/opt/oe/build/tmp/staging/arm-linux/share/aclocal
| autoreconf: Entering directory `.'
| autoreconf: configure.in: not using Gettext
| autoreconf: running: aclocal -I
/opt/oe/build/tmp/staging/arm-linux/share/aclocal-1.9 -I
/opt/oe/build/tmp/staging/arm-linux/share/aclocal --force
| acinclude.m4:16: warning: underquoted definition of AM_GCONF_WITH_NLS
| run info '(automake)Extending aclocal'
| or see http://sources.redhat.com/automake/automake.html#Extending-aclocal
| acinclude.m4:220: warning: underquoted definition of AM_GCONF_GNU_GETTEXT
| configure.in:16: warning: AC_ARG_PROGRAM invoked multiple times
| autoreconf: configure.in: tracing
| configure.in:16: warning: AC_ARG_PROGRAM invoked multiple times
| autoreconf: running: libtoolize --copy --force
| acinclude.m4:16: warning: underquoted definition of AM_GCONF_WITH_NLS
| run info '(automake)Extending aclocal'
| or see http://sources.redhat.com/automake/automake.html#Extending-aclocal
| acinclude.m4:220: warning: underquoted definition of AM_GCONF_GNU_GETTEXT
| configure.in:16: warning: AC_ARG_PROGRAM invoked multiple times
| autoreconf: running: /opt/oe/build/tmp/staging/i686-linux/bin/autoconf
--include=/opt/oe/build/tmp/staging/arm-linux/share/aclocal-1.9
--include=/opt/oe/build/tmp/staging/arm-linux/share/aclocal --force
--warnings=cross
| configure.in:16: warning: AC_ARG_PROGRAM invoked multiple times
| autoreconf: running:
/opt/oe/build/tmp/staging/i686-linux/bin/autoheader
--include=/opt/oe/build/tmp/staging/arm-linux/share/aclocal-1.9
--include=/opt/oe/build/tmp/staging/arm-linux/share/aclocal --force
--warnings=cross
| autoheader: WARNING: Using auxiliary files such as `acconfig.h',
`config.h.bot'
| autoheader: WARNING: and `config.h.top', to define templates for
`config.h.in'
| autoheader: WARNING: is deprecated and discouraged.
| autoheader:
| autoheader: WARNING: Using the third argument of `AC_DEFINE' and
| autoheader: WARNING: `AC_DEFINE_UNQUOTED' allows to define a template
without
| autoheader: WARNING: `acconfig.h':
| autoheader:
| autoheader: WARNING: AC_DEFINE([NEED_FUNC_MAIN], 1,
| autoheader: [Define if a function `main' is needed.])
| autoheader:
| autoheader: WARNING: More sophisticated templates can also be
produced, see the
| autoheader: WARNING: documentation.
| configure.in:16: warning: AC_ARG_PROGRAM invoked multiple times
| autoreconf: running: automake --foreign --add-missing --copy
--force-missing --warnings=cross
| automake: unknown warning category `cross'
| configure.in:16: warning: AC_ARG_PROGRAM invoked multiple times
| autoreconf: running: gnu-configize
| configure.in:16: warning: AC_ARG_PROGRAM invoked multiple times
| autoreconf: Leaving directory `.'
| NOTE: Running
/opt/oe/build/tmp/work/iwmmxt-linux/gconf-dbus-2.10.0+svn20060719-r0/trunk/c
onfigure
--build=i686-linux --host=arm-linux --target=arm-linux --prefix=/usr
--exec_prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin
--libexecdir=/usr/libexec --datadir=/usr/share --sysconfdir=/etc
--sharedstatedir=/usr/com --localstatedir=/var --libdir=/usr/lib
--includedir=/usr/include --oldincludedir=/usr/include
--infodir=/usr/share/info --mandir=/usr/share/man --with-ipc=dbus
--disable-gtk-doc --enable-gtk --host=arm-linux --enable-shared
--disable-static ...
| configure: loading site script /opt/oe/org.openembedded.dev/site/arm-linux
| checking for a BSD-compatible install...
/opt/oe/build/tmp/staging/i686-linux/bin/install -c
| checking whether build environment is sane... yes
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking for arm-linux-strip... arm-linux-strip
| checking whether to enable maintainer-specific portions of Makefiles... no
| checking for arm-linux-gcc... ccache arm-linux-gcc -march=iwmmxt
-mcpu=iwmmxt -mtune=iwmmxt
| checking for C compiler default output file name... a.out
| checking whether the C compiler works... yes
| checking whether we are cross compiling... yes
| checking for suffix of executables...
| checking for suffix of object files... o
| checking whether we are using the GNU C compiler... yes
| checking whether ccache arm-linux-gcc -march=iwmmxt -mcpu=iwmmxt
-mtune=iwmmxt accepts -g... yes
| checking for ccache arm-linux-gcc -march=iwmmxt -mcpu=iwmmxt
-mtune=iwmmxt option to accept ANSI C... none needed
| checking for style of include used by make... GNU
| checking dependency style of ccache arm-linux-gcc -march=iwmmxt
-mcpu=iwmmxt -mtune=iwmmxt... gcc3
| checking for arm-linux-g++... ccache arm-linux-g++ -march=iwmmxt
-mcpu=iwmmxt -mtune=iwmmxt
| checking whether we are using the GNU C++ compiler... yes
| checking whether ccache arm-linux-g++ -march=iwmmxt -mcpu=iwmmxt
-mtune=iwmmxt accepts -g... yes
| checking dependency style of ccache arm-linux-g++ -march=iwmmxt
-mcpu=iwmmxt -mtune=iwmmxt... gcc3
| checking for library containing strerror... none required
| checking for arm-linux-gcc... (cached) ccache arm-linux-gcc
-march=iwmmxt -mcpu=iwmmxt -mtune=iwmmxt
| checking whether we are using the GNU C compiler... (cached) yes
| checking whether ccache arm-linux-gcc -march=iwmmxt -mcpu=iwmmxt
-mtune=iwmmxt accepts -g... (cached) yes
| checking for ccache arm-linux-gcc -march=iwmmxt -mcpu=iwmmxt
-mtune=iwmmxt option to accept ANSI C... (cached) none needed
| checking dependency style of ccache arm-linux-gcc -march=iwmmxt
-mcpu=iwmmxt -mtune=iwmmxt... (cached) gcc3
| checking how to run the C preprocessor... arm-linux-gcc -E
| checking for egrep... grep -E
| checking for ANSI C header files... yes
| checking build system type... i686-pc-linux-gnu
| checking host system type... arm-unknown-linux-gnu
| checking for a sed that does not truncate output... /bin/sed
| checking for ld used by ccache arm-linux-gcc -march=iwmmxt
-mcpu=iwmmxt -mtune=iwmmxt... arm-linux-ld
| checking if the linker (arm-linux-ld) is GNU ld... yes
| checking for arm-linux-ld option to reload object files... -r
| checking for BSD-compatible nm...
/opt/oe/build/tmp/cross/bin/arm-linux-nm -B
| checking whether ln -s works... yes
| checking how to recognise dependent libraries... pass_all
| checking for sys/types.h... yes
| checking for sys/stat.h... yes
| checking for stdlib.h... yes
| checking for string.h... yes
| checking for memory.h... yes
| checking for strings.h... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for unistd.h... yes
| checking dlfcn.h usability... yes
| checking dlfcn.h presence... yes
| checking for dlfcn.h... yes
| checking how to run the C++ preprocessor... ccache arm-linux-g++
-march=iwmmxt -mcpu=iwmmxt -mtune=iwmmxt -E
| checking for arm-linux-g77... ccache arm-linux-g77 -march=iwmmxt
-mcpu=iwmmxt -mtune=iwmmxt
| checking whether we are using the GNU Fortran 77 compiler... yes
| checking whether ccache arm-linux-g77 -march=iwmmxt -mcpu=iwmmxt
-mtune=iwmmxt accepts -g... yes
| checking the maximum length of command line arguments... 32768
| checking command to parse /opt/oe/build/tmp/cross/bin/arm-linux-nm -B
output from ccache arm-linux-gcc -march=iwmmxt -mcpu=iwmmxt
-mtune=iwmmxt object... ok
| checking for objdir... .libs
| checking for arm-linux-ar... arm-linux-ar
| checking for arm-linux-ranlib... arm-linux-ranlib
| checking for arm-linux-strip... (cached) arm-linux-strip
| checking if ccache arm-linux-gcc -march=iwmmxt -mcpu=iwmmxt
-mtune=iwmmxt static flag works... yes
| checking if ccache arm-linux-gcc -march=iwmmxt -mcpu=iwmmxt
-mtune=iwmmxt supports -fno-rtti -fno-exceptions... no
| checking for ccache arm-linux-gcc -march=iwmmxt -mcpu=iwmmxt
-mtune=iwmmxt option to produce PIC... -fPIC
| checking if ccache arm-linux-gcc -march=iwmmxt -mcpu=iwmmxt
-mtune=iwmmxt PIC flag -fPIC works... yes
| checking if ccache arm-linux-gcc -march=iwmmxt -mcpu=iwmmxt
-mtune=iwmmxt supports -c -o file.o... yes
| checking whether the ccache arm-linux-gcc -march=iwmmxt -mcpu=iwmmxt
-mtune=iwmmxt linker (arm-linux-ld) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| configure: creating arm-linux-libtool
| appending configuration tag "CXX" to arm-linux-libtool
| checking for ld used by ccache arm-linux-g++ -march=iwmmxt
-mcpu=iwmmxt -mtune=iwmmxt... arm-linux-ld
| checking if the linker (arm-linux-ld) is GNU ld... yes
| checking whether the ccache arm-linux-g++ -march=iwmmxt -mcpu=iwmmxt
-mtune=iwmmxt linker (arm-linux-ld) supports shared libraries... yes
| checking for ccache arm-linux-g++ -march=iwmmxt -mcpu=iwmmxt
-mtune=iwmmxt option to produce PIC... -fPIC
| checking if ccache arm-linux-g++ -march=iwmmxt -mcpu=iwmmxt
-mtune=iwmmxt PIC flag -fPIC works... yes
| checking if ccache arm-linux-g++ -march=iwmmxt -mcpu=iwmmxt
-mtune=iwmmxt supports -c -o file.o... yes
| checking whether the ccache arm-linux-g++ -march=iwmmxt -mcpu=iwmmxt
-mtune=iwmmxt linker (arm-linux-ld) supports shared libraries... yes
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| appending configuration tag "F77" to arm-linux-libtool
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking for ccache arm-linux-g77 -march=iwmmxt -mcpu=iwmmxt
-mtune=iwmmxt option to produce PIC... -fPIC
| checking if ccache arm-linux-g77 -march=iwmmxt -mcpu=iwmmxt
-mtune=iwmmxt PIC flag -fPIC works... yes
| checking if ccache arm-linux-g77 -march=iwmmxt -mcpu=iwmmxt
-mtune=iwmmxt supports -c -o file.o... yes
| checking whether the ccache arm-linux-g77 -march=iwmmxt -mcpu=iwmmxt
-mtune=iwmmxt linker (arm-linux-ld) supports shared libraries... yes
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| FYI: Using default config source
xml::${sysconfdir}/gconf/gconf.xml.defaults for schema installation
| FYI: Will build with debug checks but no debug spew
| checking for arm-linux-pkg-config... no
| checking for pkg-config...
/opt/oe/build/tmp/staging/i686-linux/bin/pkg-config
| checking pkg-config is at least version 0.9.0... yes
| checking for GCONF_IPC... Requested 'dbus-glib-1 >= 0.60' but version
of dbus-glib is 0.23.4
| configure: error: Package requirements (dbus-glib-1 >= 0.60) were not met:
|
|
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|
| Alternatively, you may set the environment variables GCONF_IPC_CFLAGS
| and GCONF_IPC_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
|
| FATAL: oe_runconf failed
NOTE: Task failed:
/opt/oe/build/tmp/work/iwmmxt-linux/gconf-dbus-2.10.0+svn20060719-r0/temp/lo
g.do_configure.21972
NOTE: package gconf-dbus-2.10.0+svn20060719-r0: task do_configure: failed
ERROR: TaskFailed event exception, aborting
NOTE: package gconf-dbus-2.10.0+svn20060719: failed
ERROR: Build of gpe-image failed

Regards,
Axel

