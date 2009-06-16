Received: from [17.148.16.89] (helo=asmtpout014.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MGc2p-00023n-CE
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Jun 2009 19:02:01 +0200
MIME-version: 1.0
Received: from [87.201.169.67] by asmtp014.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLC00LZ4C5SXG30@asmtp014.mac.com> for
	openembedded-devel@lists.openembedded.org; Tue,
	16 Jun 2009 09:51:37 -0700 (PDT)
Message-id: <DDF68D7F-F730-4372-A098-5F25AE7845B6@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
In-reply-to: <025E75AE-8E03-4BC6-B123-208388FC2B9E@mac.com>
Date: Tue, 16 Jun 2009 20:51:16 +0400
References: <9050EA3F-01E5-479A-8AF2-C6553F347FE7@mac.com>
	<D34E12F3-25C1-4B11-BC85-7D45664905DE@mac.com>
	<A2AED021-1D87-4921-A330-FE9AF01C9FCD@mac.com>
	<303CFF24-F38E-46D2-A01D-16756614815F@mac.com>
	<d1b08f940906160324h11f182e2i82f92d2f65575724@mail.gmail.com>
	<8C98050F-2C26-4376-9A32-BAC900B5E832@mac.com>
	<A08B4996-5193-4730-9C12-D669170223C5@mac.com>
	<025E75AE-8E03-4BC6-B123-208388FC2B9E@mac.com>
X-Mailer: Apple Mail (2.935.3)
Subject: Re: classpath_0.98 recipe failure
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
X-List-Received-Date: Tue, 16 Jun 2009 17:02:09 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	Here is the full list of errors that I get. Can someone help me out ?

Here are my local.conf settings:

PREFERRED_PROVIDER_classpath = "classpath"
PREFERRED_VERSION_classpath = "0.98"
PREFERRED_VERSION_classpath-initial = "0.93"

PREFERRED_PROVIDER_virtual/java-initial = "jamvm-initial"
PREFERRED_VERSION_jamvm-initial = "1.5.0"

PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
PREFERRED_VERSION_libecj-bootstrap = "3.4.1"

PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
PREFERRED_VERSION_jamvm-native = "1.5.3"

I have created a new jamvm_1.5.3.bb recipe by duplicating the existing  
jamvm_1.5.2.bb recipe.

Best regards,

Elvis

NOTE: Running task 1691 of 1711 (ID: 237, /tool/overo-oe/ 
user.collection/recipes/ecj/ecj-bootstrap-native.bb, do_package_stage)
ERROR: function do_configure failed
ERROR: log data follows (/tool/overo-oe/tmp/work/armv7a-angstrom-linux- 
gnueabi/classpath-0.98-r0/temp/log.do_configure.27596)
| automake (GNU automake) 1.10.2
| Copyright (C) 2008 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl.html 
 >
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.10
| NOTE: Executing autoreconf --verbose --install --force -- 
exclude=autopoint -I /tool/overo-oe/tmp/work/armv7a-angstrom-linux- 
gnueabi/classpath-0.98-r0/classpath-0.98/m4/ -I/tool/overo-oe/tmp/ 
staging/armv7a-angstrom-linux-gnueabi/usr/share/aclocal-1.10 -I /tool/ 
overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/share/aclocal
| autoreconf: Entering directory `.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal -I /tool/overo-oe/tmp/work/armv7a- 
angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/m4/ -I /tool/ 
overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/share/ 
aclocal-1.10 -I /tool/overo-oe/tmp/staging/armv7a-angstrom-linux- 
gnueabi/usr/share/aclocal --force -I m4 ${LOCAL_AUTORECONF_FLAGS}
| /tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/share/ 
aclocal/libpcap.m4:923: warning: underquoted definition of  
AC_LBL_LINUX_TPACKET_AUXDATA_TP_VLAN_TCI
| /tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/share/ 
aclocal/libpcap.m4:923:   run info '(automake)Extending aclocal'
| /tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/share/ 
aclocal/libpcap.m4:923:   or see http://sources.redhat.com/automake/automake.html#Extending-aclocal
| autoreconf: configure.ac: tracing
| configure.ac:656: warning: cannot check for file existence when  
cross compiling
| ../../lib/autoconf/general.m4:2606: AC_CHECK_FILE is expanded from...
| configure.ac:656: the top level
| configure.ac:654: warning: cannot check for file existence when  
cross compiling
| configure.ac:654: the top level
| configure.ac:914: warning: cannot check for file existence when  
cross compiling
| ../../lib/m4sugar/m4sh.m4:505: AS_IF is expanded from...
| ../../lib/autoconf/general.m4:1443: AC_ARG_WITH is expanded from...
| aclocal.m4:9430: CLASSPATH_WITH_GJDOC is expanded from...
| configure.ac:914: the top level
| configure.ac:919: warning: cannot check for file existence when  
cross compiling
| aclocal.m4:9467: REGEN_WITH_JAY is expanded from...
| configure.ac:919: the top level
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in `.'.
| libtoolize: copying file `./ltmain.sh'
| libtoolize: putting macros in AC_CONFIG_MACRO_DIR, `m4'.
| libtoolize: copying file `m4/libtool.m4'
| libtoolize: copying file `m4/ltoptions.m4'
| libtoolize: copying file `m4/ltsugar.m4'
| libtoolize: copying file `m4/ltversion.m4'
| libtoolize: copying file `m4/lt~obsolete.m4'
| /tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/share/ 
aclocal/libpcap.m4:923: warning: underquoted definition of  
AC_LBL_LINUX_TPACKET_AUXDATA_TP_VLAN_TCI
| /tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/share/ 
aclocal/libpcap.m4:923:   run info '(automake)Extending aclocal'
| /tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/share/ 
aclocal/libpcap.m4:923:   or see http://sources.redhat.com/automake/automake.html#Extending-aclocal
| autoreconf: running: /tool/overo-oe/tmp/staging/i686-linux/usr/bin/ 
autoconf --include=/tool/overo-oe/tmp/work/armv7a-angstrom-linux- 
gnueabi/classpath-0.98-r0/classpath-0.98/m4/ --include=/tool/overo-oe/ 
tmp/staging/armv7a-angstrom-linux-gnueabi/usr/share/aclocal-1.10 -- 
include=/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/ 
share/aclocal --force --warnings=cross
| configure.ac:656: warning: cannot check for file existence when  
cross compiling
| ../../lib/autoconf/general.m4:2606: AC_CHECK_FILE is expanded from...
| configure.ac:656: the top level
| configure.ac:654: warning: cannot check for file existence when  
cross compiling
| configure.ac:654: the top level
| configure.ac:914: warning: cannot check for file existence when  
cross compiling
| ../../lib/m4sugar/m4sh.m4:505: AS_IF is expanded from...
| ../../lib/autoconf/general.m4:1443: AC_ARG_WITH is expanded from...
| aclocal.m4:1531: CLASSPATH_WITH_GJDOC is expanded from...
| configure.ac:914: the top level
| configure.ac:919: warning: cannot check for file existence when  
cross compiling
| aclocal.m4:1568: REGEN_WITH_JAY is expanded from...
| configure.ac:919: the top level
| autoreconf: running: /tool/overo-oe/tmp/staging/i686-linux/usr/bin/ 
autoheader --include=/tool/overo-oe/tmp/work/armv7a-angstrom-linux- 
gnueabi/classpath-0.98-r0/classpath-0.98/m4/ --include=/tool/overo-oe/ 
tmp/staging/armv7a-angstrom-linux-gnueabi/usr/share/aclocal-1.10 -- 
include=/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/ 
share/aclocal --force --warnings=cross
| autoreconf: running: automake --foreign --add-missing --copy --force- 
missing --warnings=cross
| automake: unknown warning category `cross'
| configure.ac:12: installing `./config.guess'
| configure.ac:12: installing `./config.sub'
| autoreconf: running: gnu-configize
| autoreconf: Leaving directory `.'
| NOTE: Running /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/ 
classpath-0.98-r0/classpath-0.98/configure 		    --build=i686-linux  
		    --host=arm-angstrom-linux-gnueabi 		    --target=arm-angstrom- 
linux-gnueabi 	    --prefix=/usr 		    --exec_prefix=/usr 		    -- 
bindir=/usr/bin 		    --sbindir=/usr/sbin 	    --libexecdir=/usr/ 
libexec 		    --datadir=/usr/share 		    --sysconfdir=/etc 		    -- 
sharedstatedir=/usr/com 		    --localstatedir=/var 		    --libdir=/usr/ 
lib 		    --includedir=/usr/include 	    --oldincludedir=/usr/include  
		    --infodir=/usr/share/info 		    --mandir=/usr/share/man 		  -- 
with-glibj   --with-ecj=javac   --with-fastjar=fastjar   --includedir=/ 
usr/include/classpath   --with-vm=java   --disable- 
Werror                    --disable-alsa                 --disable- 
dssi                 --disable-qt4-peer                 --disable- 
plugin                 --enable-gconf-peer                 --enable- 
gtk-peer                 --enable-local-sockets                 --with- 
vm=java                 		    ...
| configure: WARNING: unrecognized options: --with-ecj, --with- 
fastjar, --with-vm, --disable-qt4-peer, --with-vm
| configure: loading site script /tool/overo-oe/org.openembedded.dev/ 
site/endian-little
| configure: loading site script /tool/overo-oe/org.openembedded.dev/ 
site/common-linux
| configure: loading site script /tool/overo-oe/org.openembedded.dev/ 
site/common-glibc
| configure: loading site script /tool/overo-oe/org.openembedded.dev/ 
site/arm-common
| configure: loading site script /tool/overo-oe/org.openembedded.dev/ 
site/arm-linux
| configure: loading site script /tool/overo-oe/org.openembedded.dev/ 
site/common
| configure: loading site script /tool/overo-oe/org.openembedded.dev/ 
site/common
| checking build system type... i686-pc-linux-gnu
| checking host system type... arm-angstrom-linux-gnueabi
| checking target system type... arm-angstrom-linux-gnueabi
| checking for a BSD-compatible install... /tool/overo-oe/tmp/staging/ 
i686-linux/usr/bin/install -c
| checking whether build environment is sane... yes
| checking for a thread-safe mkdir -p... /tool/overo-oe/tmp/staging/ 
i686-linux/usr/bin/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking for arm-angstrom-linux-gnueabi-strip... arm-angstrom-linux- 
gnueabi-strip
| checking how to create a ustar tar archive... gnutar
| checking for style of include used by make... GNU
| checking for arm-angstrom-linux-gnueabi-gcc... ccache arm-angstrom- 
linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat- 
abi=softfp
| checking for C compiler default output file name... a.out
| checking whether the C compiler works... yes
| checking whether we are cross compiling... yes
| checking for suffix of executables...
| checking for suffix of object files... o
| checking whether we are using the GNU C compiler... yes
| checking whether ccache arm-angstrom-linux-gnueabi-gcc -march=armv7- 
a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp accepts -g... yes
| checking for ccache arm-angstrom-linux-gnueabi-gcc -march=armv7-a - 
mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp option to accept ISO  
C89... none needed
| checking dependency style of ccache arm-angstrom-linux-gnueabi-gcc - 
march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp... gcc3
| checking for ld used by GCC... arm-angstrom-linux-gnueabi-ld
| checking if the linker (arm-angstrom-linux-gnueabi-ld) is GNU ld...  
yes
| checking for shared library run path origin... done
| checking for iconv... yes
| checking how to run the C preprocessor... arm-angstrom-linux-gnueabi- 
gcc -E
| checking for grep that handles long lines and -e... /bin/grep
| checking for egrep... /bin/grep -E
| checking for ANSI C header files... yes
| checking for sys/types.h... yes
| checking for sys/stat.h... yes
| checking for stdlib.h... yes
| checking for string.h... yes
| checking for memory.h... yes
| checking for strings.h... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for unistd.h... yes
| checking whether to regenerate the headers... no
| checking whether to regenerate the GJDoc parser... yes
| checking whether ln -s works... yes
| checking for a BSD-compatible install... /tool/overo-oe/tmp/staging/ 
i686-linux/usr/bin/install -c
| checking whether we are using the GNU C++ compiler... yes
| checking whether ccache arm-angstrom-linux-gnueabi-g++ -march=armv7- 
a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp accepts -g... yes
| checking dependency style of ccache arm-angstrom-linux-gnueabi-g++ - 
march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp... gcc3
| checking for a sed that does not truncate output... /bin/sed
| checking for fgrep... /bin/grep -F
| checking for ld used by ccache arm-angstrom-linux-gnueabi-gcc - 
march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp... arm- 
angstrom-linux-gnueabi-ld
| checking if the linker (arm-angstrom-linux-gnueabi-ld) is GNU ld...  
yes
| checking for BSD- or MS-compatible name lister (nm)... /tool/overo- 
oe/tmp/cross/armv7a/bin/arm-angstrom-linux-gnueabi-nm -B
| checking the name lister (/tool/overo-oe/tmp/cross/armv7a/bin/arm- 
angstrom-linux-gnueabi-nm -B) interface... BSD nm
| checking the maximum length of command line arguments... 1966080
| checking whether the shell understands some XSI constructs... yes
| checking whether the shell understands "+="... yes
| checking for arm-angstrom-linux-gnueabi-ld option to reload object  
files... -r
| checking how to recognize dependent libraries... pass_all
| checking for arm-angstrom-linux-gnueabi-ar... arm-angstrom-linux- 
gnueabi-ar
| checking for arm-angstrom-linux-gnueabi-strip... (cached) arm- 
angstrom-linux-gnueabi-strip
| checking for arm-angstrom-linux-gnueabi-ranlib... arm-angstrom-linux- 
gnueabi-ranlib
| checking command to parse /tool/overo-oe/tmp/cross/armv7a/bin/arm- 
angstrom-linux-gnueabi-nm -B output from ccache arm-angstrom-linux- 
gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat- 
abi=softfp object... ok
| checking for dlfcn.h... yes
| checking whether we are using the GNU C++ compiler... (cached) yes
| checking whether ccache arm-angstrom-linux-gnueabi-g++ -march=armv7- 
a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp accepts -g...  
(cached) yes
| checking dependency style of ccache arm-angstrom-linux-gnueabi-g++ - 
march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp...  
(cached) gcc3
| checking how to run the C++ preprocessor... ccache arm-angstrom- 
linux-gnueabi-g++ -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat- 
abi=softfp -E
| checking for objdir... .libs
| checking if ccache arm-angstrom-linux-gnueabi-gcc -march=armv7-a - 
mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp supports -fno-rtti -fno- 
exceptions... no
| checking for ccache arm-angstrom-linux-gnueabi-gcc -march=armv7-a - 
mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp option to produce PIC...  
-fPIC -DPIC
| checking if ccache arm-angstrom-linux-gnueabi-gcc -march=armv7-a - 
mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp PIC flag -fPIC -DPIC  
works... yes
| checking if ccache arm-angstrom-linux-gnueabi-gcc -march=armv7-a - 
mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp static flag -static  
works... yes
| checking if ccache arm-angstrom-linux-gnueabi-gcc -march=armv7-a - 
mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp supports -c -o file.o...  
yes
| checking if ccache arm-angstrom-linux-gnueabi-gcc -march=armv7-a - 
mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp supports -c -o file.o...  
(cached) yes
| checking whether the ccache arm-angstrom-linux-gnueabi-gcc - 
march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp linker  
(arm-angstrom-linux-gnueabi-ld) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking for ld used by ccache arm-angstrom-linux-gnueabi-g++ - 
march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp... arm- 
angstrom-linux-gnueabi-ld
| checking if the linker (arm-angstrom-linux-gnueabi-ld) is GNU ld...  
yes
| checking whether the ccache arm-angstrom-linux-gnueabi-g++ - 
march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp linker  
(arm-angstrom-linux-gnueabi-ld) supports shared libraries... yes
| checking for ccache arm-angstrom-linux-gnueabi-g++ -march=armv7-a - 
mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp option to produce PIC...  
-fPIC -DPIC
| checking if ccache arm-angstrom-linux-gnueabi-g++ -march=armv7-a - 
mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp PIC flag -fPIC -DPIC  
works... yes
| checking if ccache arm-angstrom-linux-gnueabi-g++ -march=armv7-a - 
mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp static flag -static  
works... yes
| checking if ccache arm-angstrom-linux-gnueabi-g++ -march=armv7-a - 
mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp supports -c -o file.o...  
yes
| checking if ccache arm-angstrom-linux-gnueabi-g++ -march=armv7-a - 
mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp supports -c -o file.o...  
(cached) yes
| checking whether the ccache arm-angstrom-linux-gnueabi-g++ - 
march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp linker  
(arm-angstrom-linux-gnueabi-ld) supports shared libraries... yes
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking for gawk... (cached) gawk
| checking for arm-angstrom-linux-gnueabi-gcc... (cached) ccache arm- 
angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon - 
mfloat-abi=softfp
| checking whether we are using the GNU C compiler... (cached) yes
| checking whether ccache arm-angstrom-linux-gnueabi-gcc -march=armv7- 
a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp accepts -g...  
(cached) yes
| checking for ccache arm-angstrom-linux-gnueabi-gcc -march=armv7-a - 
mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp option to accept ISO  
C89... (cached) none needed
| checking dependency style of ccache arm-angstrom-linux-gnueabi-gcc - 
march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp...  
(cached) gcc3
| checking whether ccache arm-angstrom-linux-gnueabi-gcc -march=armv7- 
a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp and cc understand -c  
and -o together... yes
| checking how to run the C preprocessor... arm-angstrom-linux-gnueabi- 
gcc -E
| checking __attribute__((,,))... yes
| checking __attribute__((unused))... yes
| checking for ANSI C header files... (cached) yes
| checking size of void *... (cached) 4
| checking whether byte ordering is bigendian... (cached) no
| checking for unistd.h... (cached) yes
| checking for sys/types.h... (cached) yes
| checking sys/config.h usability... no
| checking sys/config.h presence... no
| checking for sys/config.h... no
| checking sys/ioctl.h usability... yes
| checking sys/ioctl.h presence... yes
| checking for sys/ioctl.h... yes
| checking asm/ioctls.h usability... yes
| checking asm/ioctls.h presence... yes
| checking for asm/ioctls.h... yes
| checking for inttypes.h... (cached) yes
| checking for stdint.h... (cached) yes
| checking utime.h usability... yes
| checking utime.h presence... yes
| checking for utime.h... yes
| checking sys/utime.h usability... no
| checking sys/utime.h presence... no
| checking for sys/utime.h... no
| checking sys/filio.h usability... no
| checking sys/filio.h presence... no
| checking for sys/filio.h... no
| checking sys/time.h usability... yes
| checking sys/time.h presence... yes
| checking for sys/time.h... yes
| checking sys/select.h usability... yes
| checking sys/select.h presence... yes
| checking for sys/select.h... yes
| checking crt_externs.h usability... no
| checking crt_externs.h presence... no
| checking for crt_externs.h... no
| checking fcntl.h usability... yes
| checking fcntl.h presence... yes
| checking for fcntl.h... yes
| checking sys/mman.h usability... yes
| checking sys/mman.h presence... yes
| checking for sys/mman.h... yes
| checking magic.h usability... no
| checking magic.h presence... no
| checking for magic.h... no
| checking sys/event.h usability... no
| checking sys/event.h presence... no
| checking for sys/event.h... no
| checking sys/epoll.h usability... yes
| checking sys/epoll.h presence... yes
| checking for sys/epoll.h... yes
| checking ifaddrs.h usability... yes
| checking ifaddrs.h presence... yes
| checking for ifaddrs.h... yes
| checking netinet/in_systm.h usability... yes
| checking netinet/in_systm.h presence... yes
| checking for netinet/in_systm.h... yes
| checking netinet/ip.h usability... yes
| checking netinet/ip.h presence... yes
| checking for netinet/ip.h... yes
| checking net/if.h usability... yes
| checking net/if.h presence... yes
| checking for net/if.h... yes
| checking sys/loadavg.h usability... no
| checking sys/loadavg.h presence... no
| checking for sys/loadavg.h... no
| checking sys/sockio.h usability... no
| checking sys/sockio.h presence... no
| checking for sys/sockio.h... no
| checking for library containing inet_pton... none required
| checking for gethostname in -lsocket... no
| checking for ftruncate... yes
| checking for fsync... yes
| checking for select... yes
| checking for gethostname... yes
| checking for socket... yes
| checking for strerror... (cached) yes
| checking for fork... yes
| checking for pipe... yes
| checking for execve... yes
| checking for open... yes
| checking for close... yes
| checking for lseek... yes
| checking for fstat... yes
| checking for read... yes
| checking for readv... yes
| checking for write... yes
| checking for writev... yes
| checking for htonl... yes
| checking for memset... yes
| checking for htons... yes
| checking for connect... yes
| checking for getsockname... yes
| checking for getpeername... yes
| checking for bind... yes
| checking for listen... yes
| checking for accept... yes
| checking for recvfrom... yes
| checking for send... yes
| checking for sendto... yes
| checking for setsockopt... yes
| checking for getsockopt... yes
| checking for time... yes
| checking for mktime... yes
| checking for gethostbyname_r... yes
| checking for localtime_r... yes
| checking for strerror_r... yes
| checking for fcntl... yes
| checking for statvfs... yes
| checking for mmap... yes
| checking for munmap... yes
| checking for mincore... yes
| checking for msync... yes
| checking for madvise... yes
| checking for getpagesize... (cached) yes
| checking for sysconf... yes
| checking for lstat... yes
| checking for readlink... yes
| checking for inet_aton... yes
| checking for inet_addr... yes
| checking for inet_pton... yes
| checking for getifaddrs... yes
| checking for kqueue... no
| checking for kevent... no
| checking for epoll_create... yes
| checking for getloadavg... yes
| checking for magic_open in -lmagic... no
| checking whether struct sockaddr_in6 is in netinet/in.h... yes
| checking whether time.h and sys/time.h may both be included... yes
| checking whether struct tm is in sys/time.h or time.h... time.h
| checking for struct tm.tm_zone... yes
| checking for tm_gmtoff in struct tm... yes
| checking for an ANSI C-conforming const... yes
| checking for inline... inline
| checking for __attribute__... yes
| checking how many arguments gethostbyname_r() takes... six
| checking for iconv... (cached) yes
| checking for iconv declaration...
|          extern size_t iconv (iconv_t cd, char * *inbuf, size_t  
*inbytesleft, char * *outbuf, size_t *outbytesleft);
| checking for X... libraries , headers
| checking for gethostbyname... yes
| checking for connect... (cached) yes
| checking for remove... yes
| checking for shmat... yes
| checking for IceConnectionNumber in -lICE... yes
| checking for XTestQueryExtension in -lXtst... yes
| checking for pkg-config... /tool/overo-oe/tmp/staging/i686-linux/usr/ 
bin/pkg-config
| checking for gtk+-2.0 >= 2.8 gthread-2.0 >= 2.2 gdk-pixbuf-2.0... yes
| checking GTK_CFLAGS... -pthread -I/tool/overo-oe/tmp/staging/armv7a- 
angstrom-linux-gnueabi/usr/include/gtk-2.0 -I/tool/overo-oe/tmp/ 
staging/armv7a-angstrom-linux-gnueabi/usr/lib/gtk-2.0/include -I/tool/ 
overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include/atk-1.0  
-I/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include/ 
cairo -I/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/ 
include/pango-1.0 -I/tool/overo-oe/tmp/staging/armv7a-angstrom-linux- 
gnueabi/usr/include/glib-2.0 -I/tool/overo-oe/tmp/staging/armv7a- 
angstrom-linux-gnueabi/usr/lib/glib-2.0/include -I/tool/overo-oe/tmp/ 
staging/armv7a-angstrom-linux-gnueabi/usr/include/pixman-1 -I/tool/ 
overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include/ 
freetype2 -I/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/ 
usr/include/libpng12
| checking GTK_LIBS... -pthread -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 - 
lgio-2.0 -lpangoft2-1.0 -lpangocairo-1.0 -lcairo -lpango-1.0 - 
lfreetype -lfontconfig -lgthread-2.0 -lrt -lgdk_pixbuf-2.0 - 
lgobject-2.0 -lgmodule-2.0 -lglib-2.0
| checking for freetype2... yes
| checking FREETYPE2_CFLAGS... -I/tool/overo-oe/tmp/staging/armv7a- 
angstrom-linux-gnueabi/usr/include/freetype2
| checking FREETYPE2_LIBS... -lfreetype
| checking for pangoft2... yes
| checking PANGOFT2_CFLAGS... -I/tool/overo-oe/tmp/staging/armv7a- 
angstrom-linux-gnueabi/usr/include/pango-1.0 -I/tool/overo-oe/tmp/ 
staging/armv7a-angstrom-linux-gnueabi/usr/include/freetype2 -I/tool/ 
overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include/ 
glib-2.0 -I/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/ 
usr/lib/glib-2.0/include
| checking PANGOFT2_LIBS... -lpangoft2-1.0 -lpango-1.0 -lfreetype - 
lfontconfig -lgobject-2.0 -lgmodule-2.0 -lglib-2.0
| checking for cairo >= 1.1.8... yes
| checking CAIRO_CFLAGS... -I/tool/overo-oe/tmp/staging/armv7a- 
angstrom-linux-gnueabi/usr/include/cairo -I/tool/overo-oe/tmp/staging/ 
armv7a-angstrom-linux-gnueabi/usr/include/pixman-1 -I/tool/overo-oe/ 
tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include/freetype2 -I/ 
tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include/ 
libpng12
| checking CAIRO_LIBS... -lcairo
| checking for XRenderQueryExtension in -lXrender... yes
| checking for XRRQueryExtension in -lXrandr... yes
| checking for gconf-2.0 >= 2.6.0... yes
| checking GCONF_CFLAGS... -I/tool/overo-oe/tmp/staging/armv7a- 
angstrom-linux-gnueabi/usr/include/gconf/2 -I/tool/overo-oe/tmp/ 
staging/armv7a-angstrom-linux-gnueabi/usr/include/dbus-1.0 -I/tool/ 
overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/lib/dbus-1.0/ 
include -I/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/ 
include/glib-2.0 -I/tool/overo-oe/tmp/staging/armv7a-angstrom-linux- 
gnueabi/usr/lib/glib-2.0/include
| checking GCONF_LIBS... -lgconf-2 -ldbus-glib-1 -ldbus-1 - 
lgobject-2.0 -lglib-2.0
| checking for gdk-2.0 >= 2.8... yes
| checking GDK_CFLAGS... -I/tool/overo-oe/tmp/staging/armv7a-angstrom- 
linux-gnueabi/usr/include/gtk-2.0 -I/tool/overo-oe/tmp/staging/armv7a- 
angstrom-linux-gnueabi/usr/lib/gtk-2.0/include -I/tool/overo-oe/tmp/ 
staging/armv7a-angstrom-linux-gnueabi/usr/include/pango-1.0 -I/tool/ 
overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include/ 
glib-2.0 -I/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/ 
usr/lib/glib-2.0/include -I/tool/overo-oe/tmp/staging/armv7a-angstrom- 
linux-gnueabi/usr/include/cairo -I/tool/overo-oe/tmp/staging/armv7a- 
angstrom-linux-gnueabi/usr/include/pixman-1 -I/tool/overo-oe/tmp/ 
staging/armv7a-angstrom-linux-gnueabi/usr/include/freetype2 -I/tool/ 
overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/include/libpng12
| checking GDK_LIBS... -lgdk-x11-2.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0  
-lpango-1.0 -lcairo -lgobject-2.0 -lgmodule-2.0 -lglib-2.0
| checking for MSG_NOSIGNAL... yes
| checking for SO_NOSIGPIPE ... no
| checking for MSG_WAITALL... yes
| checking for __gmpz_mul_si in -lgmp... no
| checking gmp.h usability... no
| checking gmp.h presence... no
| checking for gmp.h... no
| checking jni_md.h support... configure: WARNING: no
| checking whether to enable maintainer-specific portions of  
Makefiles... no
| checking for mkdir... /tool/overo-oe/tmp/staging/i686-linux/usr/bin/ 
mkdir
| checking for cp... /tool/overo-oe/tmp/staging/i686-linux/usr/bin/cp
| checking for date... /tool/overo-oe/tmp/staging/i686-linux/usr/bin/ 
date
| checking for find... /usr/bin/find
| checking for zip... /tool/overo-oe/tmp/staging/i686-linux/usr/bin/zip
| checking for a jar-like tool... trying fastjar, gjar and jar
| checking for fastjar... /tool/overo-oe/tmp/staging/i686-linux/usr/ 
bin/fastjar
| checking whether to regenerate parsers with jay... no
| checking for stdint types... stdint.h (shortcircuit)
| make use of stdint.h in include/config-int.h (assuming C99  
compatible system)
| checking for uudecode... no
| configure: WARNING: I have to compile Test.class from scratch
| checking for ecj... ecj -warn:-deprecation,serial,unusedImport
| checking if ecj -warn:-deprecation,serial,unusedImport is a version  
of gcj... Exception in thread "main" java.lang.NoClassDefFoundError:  
org/eclipse/jdt/internal/compiler/batch/Main
|    <<No stacktrace available>>
| Caused by: java.lang.ClassNotFoundException:  
org.eclipse.jdt.internal.compiler.batch.Main not found in  
java.lang.ClassLoader$1{urls=[], parent=null}
|    at java.net.URLClassLoader.findClass(URLClassLoader.java:529)
|    at java.lang.ClassLoader.loadClass(ClassLoader.java:341)
|    at java.lang.ClassLoader$1.loadClass(ClassLoader.java:1112)
|    at java.lang.ClassLoader.loadClass(ClassLoader.java:293)
|
| checking if ecj -warn:-deprecation,serial,unusedImport works...  
configure: error: The Java compiler ecj -warn:- 
deprecation,serial,unusedImport failed (see config.log, check the  
CLASSPATH?)
| FATAL: oe_runconf failed
NOTE: Task failed: /tool/overo-oe/tmp/work/armv7a-angstrom-linux- 
gnueabi/classpath-0.98-r0/temp/log.do_configure.27596
ERROR: TaskFailed event exception, aborting
ERROR: Build of /tool/overo-oe/user.collection/recipes/classpath/ 
classpath_0.98.bb do_configure failed
ERROR: Task 5 (/tool/overo-oe/user.collection/recipes/classpath/ 
classpath_0.98.bb, do_configure) failed
NOTE: Tasks Summary: Attempted 1690 tasks of which 1619 didn't need to  
be rerun and 1 failed.
ERROR: '/tool/overo-oe/user.collection/recipes/classpath/ 
classpath_0.98.bb' failed
[elvis@zeus ~]$



