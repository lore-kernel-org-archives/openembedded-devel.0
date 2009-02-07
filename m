Received: from [74.125.44.156] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chrisfriedt@gmail.com>) id 1LVq00-0002TQ-6T
	for Openembedded-devel@lists.openembedded.org;
	Sat, 07 Feb 2009 17:25:45 +0100
Received: by yx-out-1718.google.com with SMTP id 4so539043yxp.42
	for <Openembedded-devel@lists.openembedded.org>;
	Sat, 07 Feb 2009 08:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=yOQti3APjV4R3GetfbLf4GwtJwftVrU5hCY6njB1rMo=;
	b=dDiFnnHGM9oW3pTapuXCYK82Kts7BIIZHkLcHkMvExMXUr31ZJPxMfIOOcPaW5g0I4
	JKz9tG17ZT1zsAF95XfkBLs4180tX6zOk2XBw+zfRsU/lP3TjKeUrqOLNS0mZjaCZb3f
	R14scfeOLvy5oImLOTXjBGpEdjCaOSeM+iI7w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=XG7VA1xocnqkoWn7t9+qJk2tYsemPzeGlYDr1Chpv46XLcXWukOeAsBC5TA7P6QqMX
	NkTq6JbjP85AZVRT5HnBfX5cgbSQQXobj14tLAi3EadV5I2/lZFPdfAAidOfXlo7ynlC
	YpZ1YzNFE3RMpeMJtkqY0OvWSTBfIbo5PlKDw=
MIME-Version: 1.0
Received: by 10.100.153.4 with SMTP id a4mr1831970ane.101.1234023909960; Sat, 
	07 Feb 2009 08:25:09 -0800 (PST)
Date: Sat, 7 Feb 2009 11:25:09 -0500
Message-ID: <3ea34a000902070825j48291819x61976d871da422d@mail.gmail.com>
From: Christopher Friedt <chrisfriedt@gmail.com>
To: Openembedded-devel@lists.openembedded.org
Subject: c compiler cannot create executables (do_configure, gettext-native-0.17-r3)
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
X-List-Received-Date: Sat, 07 Feb 2009 16:25:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi everyone,

I've run into a configure error that I'm not quite sure how to fix -
it could have something to do with ccache, and I've tried clearing out
my cache already, but that hasn't worked. It's for a 'new' machine,
but I've essentially just copied the aximx50.conf and renamed it to
cl9400.conf (also added the relevent parts according to
http://wiki.openembedded.net/index.php/Adding_a_new_Machine).

What's really odd, is that I've gone into the specified build directly
directly after it apparently fails, taken the exact ./configure
command from config.log, and run it without any errors showing up.

I would appreciate if anyone would like to offer some advice - please
see the build log below.

Cheers,

Chris

======================================================================

automake (GNU automake) 1.10
Written by Tom Tromey <tromey@redhat.com>
       and Alexandre Duret-Lutz <adl@gnu.org>.

Copyright 2006 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
AUTOV is 1
NOTE: Executing autoreconf --verbose --install --force
--exclude=autopoint -I
/home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/autoconf-lib-link/m4/
-I /home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/gettext-runtime/m4
-I /home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/gettext-tools/m4
-I/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/share/aclocal-1
-I /home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/share/aclocal
autoreconf: Entering directory `.'
autoreconf: configure.ac: not using Gettext
autoreconf: running: aclocal -I
/home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/autoconf-lib-link/m4/
-I /home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/gettext-runtime/m4
-I /home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/gettext-tools/m4
-I /home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/share/aclocal-1
-I /home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/share/aclocal
--force
autoreconf: configure.ac: tracing
autoreconf: configure.ac: adding subdirectory autoconf-lib-link to autoreconf
autoreconf: Entering directory `autoconf-lib-link'
autoreconf: running: aclocal -I
/home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/autoconf-lib-link/m4/
-I /home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/gettext-runtime/m4
-I /home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/gettext-tools/m4
-I /home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/share/aclocal-1
-I /home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/share/aclocal
--force -I m4 -I ../m4
autoreconf: running: libtoolize --copy --force
libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, `../build-aux'.
libtoolize: copying file `../build-aux/ltmain.sh'
libtoolize: putting macros in `m4'.
libtoolize: copying file `m4/libtool.m4'
libtoolize: copying file `m4/ltoptions.m4'
libtoolize: copying file `m4/ltsugar.m4'
libtoolize: copying file `m4/ltversion.m4'
libtoolize: copying file `m4/lt~obsolete.m4'
libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.ac and
libtoolize: rerunning libtoolize, to keep the correct libtool macros in-tree.
autoreconf: running:
/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/bin/autoconf
--include=/home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/autoconf-lib-link/m4/
--include=/home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/gettext-runtime/m4
--include=/home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/gettext-tools/m4
--include=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/share/aclocal-1
--include=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/share/aclocal
--force --warnings=cross
autoreconf: configure.ac: not using Autoheader
autoreconf: running: automake --foreign --add-missing --copy
--force-missing --warnings=cross
automake: unknown warning category `cross'
configure.ac:31: installing `../build-aux/config.sub'
configure.ac:31: installing `../build-aux/config.guess'
autoreconf: running: gnu-configize
autoreconf: Leaving directory `autoconf-lib-link'
autoreconf: configure.ac: adding subdirectory gettext-runtime to autoreconf
autoreconf: Entering directory `gettext-runtime'
autoreconf: running: aclocal -I
/home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/autoconf-lib-link/m4/
-I /home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/gettext-runtime/m4
-I /home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/gettext-tools/m4
-I /home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/share/aclocal-1
-I /home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/share/aclocal
--force -I m4 -I ../autoconf-lib-link/m4 -I ../m4 -I gnulib-m4
autoreconf: configure.ac: adding subdirectory libasprintf to autoreconf
autoreconf: Entering directory `libasprintf'
autoreconf: running: aclocal -I
/home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/autoconf-lib-link/m4/
-I /home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/gettext-runtime/m4
-I /home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/gettext-tools/m4
-I /home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/share/aclocal-1
-I /home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/share/aclocal
--force -I ../../m4 -I ../m4
libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, `../../build-aux'.
libtoolize: copying file `../../build-aux/ltmain.sh'
libtoolize: putting macros in `../../m4'.
libtoolize: copying file `../../m4/libtool.m4'
libtoolize: copying file `../../m4/ltoptions.m4'
libtoolize: copying file `../../m4/ltsugar.m4'
libtoolize: copying file `../../m4/ltversion.m4'
libtoolize: copying file `../../m4/lt~obsolete.m4'
libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.ac and
libtoolize: rerunning libtoolize, to keep the correct libtool macros in-tree.
autoreconf: running:
/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/bin/autoheader
--include=/home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/autoconf-lib-link/m4/
--include=/home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/gettext-runtime/m4
--include=/home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/gettext-tools/m4
--include=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/share/aclocal-1
--include=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/share/aclocal
--force --warnings=cross
automake: unknown warning category `cross'
configure.ac:32: installing `../../build-aux/config.sub'
configure.ac:32: installing `../../build-aux/config.guess'
autoreconf: Leaving directory `libasprintf'
autoreconf: configure.ac: AM_GNU_GETTEXT is used, but not AM_GNU_GETTEXT_VERSION
libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, `../build-aux'.
libtoolize: copying file `../build-aux/ltmain.sh'
libtoolize: putting macros in `m4'.
libtoolize: copying file `m4/libtool.m4'
libtoolize: copying file `m4/ltoptions.m4'
libtoolize: copying file `m4/ltsugar.m4'
libtoolize: copying file `m4/ltversion.m4'
libtoolize: copying file `m4/lt~obsolete.m4'
libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.ac and
libtoolize: rerunning libtoolize, to keep the correct libtool macros in-tree.
automake: unknown warning category `cross'
configure.ac:55: installing `../build-aux/config.sub'
configure.ac:55: installing `../build-aux/config.guess'
autoreconf: Leaving directory `gettext-runtime'
autoreconf: configure.ac: adding subdirectory gettext-tools to autoreconf
autoreconf: Entering directory `gettext-tools'
autoreconf: running: aclocal -I
/home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/autoconf-lib-link/m4/
-I /home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/gettext-runtime/m4
-I /home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/gettext-tools/m4
-I /home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/share/aclocal-1
-I /home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/share/aclocal
--force -I m4 -I ../gettext-runtime/m4 -I ../autoconf-lib-link/m4 -I
../m4 -I gnulib-m4 -I libgettextpo/gnulib-m4
autoreconf: configure.ac: adding subdirectory examples to autoreconf
autoreconf: Entering directory `examples'
autoreconf: running: aclocal -I
/home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/autoconf-lib-link/m4/
-I /home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/gettext-runtime/m4
-I /home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/gettext-tools/m4
-I /home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/share/aclocal-1
-I /home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/share/aclocal
--force -I ../../gettext-runtime/m4 -I ../../m4
autoreconf: configure.ac: not using Libtool
automake: unknown warning category `cross'
autoreconf: Leaving directory `examples'
libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, `../build-aux'.
libtoolize: copying file `../build-aux/ltmain.sh'
libtoolize: putting macros in `m4'.
libtoolize: copying file `m4/libtool.m4'
libtoolize: copying file `m4/ltoptions.m4'
libtoolize: copying file `m4/ltsugar.m4'
libtoolize: copying file `m4/ltversion.m4'
libtoolize: copying file `m4/lt~obsolete.m4'
libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.ac and
libtoolize: rerunning libtoolize, to keep the correct libtool macros in-tree.
automake: unknown warning category `cross'
configure.ac:78: installing `../build-aux/config.sub'
configure.ac:78: installing `../build-aux/config.guess'
autoreconf: Leaving directory `gettext-tools'
automake: unknown warning category `cross'
autoreconf: Leaving directory `.'
NOTE: Running /home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/configure
		    --build=x86_64-linux 		    --host=x86_64-linux 		
--target=x86_64-linux 		
--prefix=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr 		
   --exec_prefix=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr
		    --bindir=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/bin
		    --sbindir=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/sbin
		    --libexecdir=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/libexec
		    --datadir=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/share
		    --sysconfdir=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/etc
		    --sharedstatedir=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/com
		    --localstatedir=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/var
		    --libdir=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/lib
		    --includedir=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/include
		    --oldincludedir=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/include
		    --infodir=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/share/info
		    --mandir=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/share/man
			 --without-lispdir 		 --disable-csharp 		 --disable-libasprintf 		
--disable-java 		 --disable-native-java 		 --disable-openmp 		
--with-included-glib 		 --without-emacs 	         		    ...
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking build system type... x86_64-pc-linux-gnu
checking host system type... x86_64-pc-linux-gnu
configure: creating ./config.status
config.status: creating Makefile
config.status: creating gnulib-local/Makefile
=== configuring in autoconf-lib-link
(/home/cfriedt/oe/build-cl9400/tmp/work/x86_64-linux/gettext-native-0.17-r3/gettext-0.17/autoconf-lib-link)
configure: running /bin/sh ./configure
'--prefix=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr'
'--build=x86_64-linux' '--host=x86_64-linux' '--target=x86_64-linux'
'--exec_prefix=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr'
'--bindir=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/bin'
'--sbindir=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/sbin'
'--libexecdir=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/libexec'
'--datadir=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/share'
'--sysconfdir=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/etc'
'--sharedstatedir=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/com'
'--localstatedir=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/var'
'--libdir=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/lib'
'--includedir=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/include'
'--oldincludedir=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/include'
'--infodir=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/share/info'
'--mandir=/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/share/man'
'--without-lispdir' '--disable-csharp' '--disable-libasprintf'
'--disable-java' '--disable-native-java' '--disable-openmp'
'--with-included-glib' '--without-emacs' 'build_alias=x86_64-linux'
'host_alias=x86_64-linux' 'target_alias=x86_64-linux' 'CC=ccache gcc'
'CFLAGS=-isystem/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/include
-O2' 'LDFLAGS=-L/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/lib
-Wl,-rpath-link,/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/lib
-Wl,-rpath,/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/lib
-Wl,-O1' 'CPPFLAGS=-isystem/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/include'
'CPP=gcc -E' 'CXX=ccache g++'
'CXXFLAGS=-isystem/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/include
-O2' --cache-file=/dev/null --srcdir=.
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking for x86_64-linux-gcc... ccache gcc
checking for C compiler default output file name...
configure: error: C compiler cannot create executables
See `config.log' for more details.
configure: error: ./configure failed for autoconf-lib-link
FATAL: oe_runconf failed


