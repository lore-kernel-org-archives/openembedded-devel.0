Received: from [206.18.177.56] (helo=alnrmhc16.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <golly@stellarwerx.com>) id 1HLXRH-0005S2-Ox
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Feb 2007 05:26:16 +0100
Received: from gatekeeper.stellarwerx.com
	(c-68-57-212-205.hsd1.in.comcast.net[68.57.212.205])
	by comcast.net (alnrmhc16) with ESMTP
	id <20070226042614b1600c6pjje>; Mon, 26 Feb 2007 04:26:14 +0000
Received: by gatekeeper.stellarwerx.com (Postfix, from userid 500)
	id D398022D8; Sun, 25 Feb 2007 23:32:12 -0500 (EST)
From: "Mark Gollahon" <golly@stellarwerx.com>
To: openembedded-devel@lists.openembedded.org
Cc: 
X-Originating-IP: 192.168.253.158
X-Mailer: Usermin 1.230
Message-Id: <1172464331.3060@gatekeeper.stellarwerx.com>
Date: Sun, 25 Feb 2007 23:32:12 -0500 (EST)
MIME-Version: 1.0
Subject: Freetype Fails Config on a Spitz/Angstrom Build
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
X-List-Received-Date: Mon, 26 Feb 2007 04:26:16 -0000
Content-Type: multipart/mixed; boundary="bound1172464332"

--bound1172464332
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

Found it!

Line 43 of builds/unix/configure.ac has:

  AC_CHECK_PROG(CC_BUILD, ${build}-gcc, ${build-gcc})

and I changed it to:

  AC_CHECK_PROG(CC_BUILD, ${build}-gcc, ${build}-gcc)

At least IWFM....

Regards,
-Mark Gollahon


Mark Gollahon wrote ..
> Now freetype is failing during config.  I'm stuck, so can anyone tell me
> why?
> 
> Regards,
> -Mark Gollahon
> 
> 
> $ bitbake freetype
> NOTE: Using cache in '/var/tmp/OpenEmbedded/Spitz/tmp/cache/spitz'
> NOTE: Handling BitBake files: / (4216/4216) [100 %]
> NOTE: Parsing finished. 4042 cached, 0 parsed, 174 skipped, 0 masked.
> 
> NOTE: build 200702231529: started
> 
> OE Build Configuration:
> BB_VERSION     = "1.6.6"
> OE_REVISION    = "7bd9b617a6b57c3119453e5a6b2ae93264ba00a6"
> TARGET_ARCH    = "arm"
> TARGET_OS      = "linux-gnueabi"
> MACHINE        = "spitz"
> DISTRO         = "angstrom"
> DISTRO_VERSION = "test-20070223"
> TARGET_FPU     = "soft"
> 
> NOTE: preferred version 2.5 of glibc not available
> NOTE: package freetype-2.3.0: started
> NOTE: package freetype-2.3.0-r0: task do_configure: started
> ERROR: function do_configure failed
> ERROR: log data follows (/var/tmp/OpenEmbedded/Spitz/tmp/work/armv5te-angstrom-linux-gnueabi/freetype-2.3.0-r0/temp/log.do_configure.25468)
> | configure.ac:125: warning: AC_CANONICAL_TARGET was called before AC_CHECK_TARGET_TOOL
> | autoconf/types.m4:401: AC_CHECK_TARGET_TOOL is expanded from...
> | autoconf/types.m4:407: AC_PROG_SIZE is expanded from...
> | configure.ac:125: AC_PROG_SIZE is required by...
> | autoconf/types.m4:445: AC_CHECK_SIZEOF is expanded from...
> | configure.ac:125: the top level
> | configure.ac:125: warning: AC_CANONICAL_TARGET was called before AC_CHECK_TARGET_TOOL
> | autoconf/types.m4:401: AC_CHECK_TARGET_TOOL is expanded from...
> | autoconf/types.m4:407: AC_PROG_SIZE is expanded from...
> | configure.ac:125: AC_PROG_SIZE is required by...
> | autoconf/types.m4:445: AC_CHECK_SIZEOF is expanded from...
> | configure.ac:125: the top level
> | configure.ac:125: warning: AC_CANONICAL_TARGET was called before AC_CHECK_TARGET_TOOL
> | autoconf/types.m4:401: AC_CHECK_TARGET_TOOL is expanded from...
> | autoconf/types.m4:407: AC_PROG_SIZE is expanded from...
> | configure.ac:125: AC_PROG_SIZE is required by...
> | autoconf/types.m4:445: AC_CHECK_SIZEOF is expanded from...
> | configure.ac:125: the top level
> | NOTE: Running /var/tmp/OpenEmbedded/Spitz/tmp/work/armv5te-angstrom-linux-gnueabi/freetype-2.3.0-r0/freetype-2.3.0/configure
> --build=i686-linux     --host=arm-angstrom-linux-gnueabi              
> --target=arm-angstrom-linux-gnueabi                     --prefix=/usr 
> --exec_prefix=/usr     --bindir=/usr/bin                --sbindir=/usr/sbin
> --libexecdir=/usr/libexec               --datadir=/usr/share          
> --sysconfdir=/etc               --sharedstatedir=/usr/com             
> --localstatedir=/var                    --libdir=/usr/lib             
> --includedir=/usr/include               --oldincludedir=/usr/include  
> --infodir=/usr/share/info               --mandir=/usr/share/man       
> --without-zlib              ...
> |
> | FreeType build system -- automatic system detection
> |
> | The following settings are used:
> |
> |   platform                    unix
> |   compiler                    arm-angstrom-linux-gnueabi-gcc -march=armv5te
> -mtune=xscale
> |   configuration directory     ./builds/unix
> |   configuration rules         ./builds/unix/unix.mk
> |
> | If this does not correspond to your system or settings please remove
> the file
> | `config.mk' from this directory then read the INSTALL file for help.
> |
> | Otherwise, simply type `make' again to build the library,
> | or `make refdoc' to build the API reference (the latter needs python).
> |
> | cd builds/unix; ./configure  "--build=i686-linux" "--host=arm-angstrom-linux-gnueabi"
> "--target=arm-angstrom-linux-gnueabi" "--prefix=/usr" "--exec_prefix=/usr"
> "--bindir=/usr/bin" "--sbindir=/usr/sbin" "--libexecdir=/usr/libexec" "--datadir=/usr/share"
> "--sysconfdir=/etc" "--sharedstatedir=/usr/com" "--localstatedir=/var"
> "--libdir=/usr/lib" "--includedir=/usr/include" "--oldincludedir=/usr/include"
> "--infodir=/usr/share/info" "--mandir=/usr/share/man" "--without-zlib"
> | configure: loading site script /var/tmp/OpenEmbedded/org.openembedded.dev/site/endian-little
> | configure: loading site script /var/tmp/OpenEmbedded/org.openembedded.dev/site/common-glibc
> | configure: loading site script /var/tmp/OpenEmbedded/org.openembedded.dev/site/arm-common
> | configure: loading site script /var/tmp/OpenEmbedded/org.openembedded.dev/site/arm-linux
> | configure: loading site script /var/tmp/OpenEmbedded/org.openembedded.dev/site/common
> | configure: loading site script /var/tmp/OpenEmbedded/org.openembedded.dev/site/common
> | checking build system type... i686-pc-linux-gnu
> | checking host system type... arm-angstrom-linux-gnueabi
> | checking target system type... arm-angstrom-linux-gnueabi
> | checking for arm-angstrom-linux-gnueabi-gcc... arm-angstrom-linux-gnueabi-gcc
> -march=armv5te -mtune=xscale
> | checking for C compiler default output file name... a.out
> | checking whether the C compiler works... yes
> | checking whether we are cross compiling... yes
> | checking for suffix of executables...
> | checking for suffix of object files... o
> | checking whether we are using the GNU C compiler... yes
> | checking whether arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale
> accepts -g... yes
> | checking for arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=xscale
> option to accept ANSI C... none needed
> | checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gcc
> -E
> | checking for i686-pc-linux-gnu-gcc... i686-pc-linux-gnu
> | checking for i686-pc-linux-gnu-gcc... (cached) i686-pc-linux-gnu
> | checking for i686-pc-linux-gnu-gcc... (cached) i686-pc-linux-gnu
> | checking for suffix of native executables... ./configure: line 2943:
> i686-pc-linux-gnu: command not found
> | configure: error: native C compiler is not working
> | make: *** [setup] Error 1
> | FATAL: oe_runconf failed
> NOTE: Task failed: /var/tmp/OpenEmbedded/Spitz/tmp/work/armv5te-angstrom-linux-gnueabi/freetype-2.3.0-r0/temp/log.do_configure.25468
> NOTE: package freetype-2.3.0-r0: task do_configure: failed
> ERROR: TaskFailed event exception, aborting
> NOTE: package freetype-2.3.0: failed
> ERROR: Build of freetype failed

--bound1172464332--
