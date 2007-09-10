Received: from [61.57.29.122] (helo=mail.aaeon.com.tw)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <VictorLai@aaeon.com.tw>) id 1IUZYm-0008V9-TW
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2007 05:03:45 +0200
To: openembedded-devel@lists.openembedded.org
X-Mailer: Lotus Notes Release 6.5.4 March 27, 2005
Message-ID: <OFCC2FB5ED.7A58B2FA-ON48257352.00102766-48257352.0010B952@aaeon.com.tw>
From: VictorLai@aaeon.com.tw
Date: Mon, 10 Sep 2007 11:03:11 +0800
X-MIMETrack: Serialize by Router on mail/AAEON(Release 6.5.4|March 27,
	2005) at 2007/09/10 =?Big5?B?pFekyCAxMTowMzoxMw==?=
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: compile error
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
X-List-Received-Date: Mon, 10 Sep 2007 03:03:49 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable



Hi, I am trying to setup openembedded environment. I got the following
error. Please provide some suggestion.

-----------------------------------------------------------------------=
------------------------------------
NOTE: Handling BitBake files: / (4640/4640) [100 %]
NOTE: Parsing finished. 4422 cached, 0 parsed, 218 skipped, 0 masked.
NOTE: build 200709080523: started

OE Build Configuration:
BB_VERSION     =3D "1.8.8"
OE_REVISION    =3D "e672e671c803c6418e7dafffe4c149fa8480620a"
TARGET_ARCH    =3D "arm"
TARGET_OS      =3D "linux-gnueabi"
MACHINE        =3D "akita"
DISTRO         =3D "angstrom"
DISTRO_VERSION =3D "2007.9-test-20070907"
TARGET_FPU     =3D "soft"

NOTE: Resolving missing task queue dependencies
NOTE: preferred version 2.5 of glibc not available (for item
virtual/arm-angstrom-linux-gnueabi-libc-for-gcc)
NOTE: preferred version 0.5.2+svn20070907 of osb-nrcit not available (f=
or
item osb-nrcit)
NOTE: preferred version 0.5.2+svn20070907 of osb-nrcore not available (=
for
item osb-nrcore)
NOTE: preferred version 0.5.2+svn20070907 of osb-jscore not available (=
for
item osb-jscore)
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 2392 of 3655 (ID: 441,
/OE/org.openembedded.dev/packages/angstrom/angstrom-version.bb, do_fetc=
h)
NOTE: Running task 2393 of 3655 (ID: 440,
/OE/org.openembedded.dev/packages/angstrom/angstrom-version.bb, do_unpa=
ck)
NOTE: Running task 2394 of 3655 (ID: 2792,
/OE/org.openembedded.dev/packages/gpe-mini-browser/gpe-mini-browser_0.2=
1.bb,
 do_configure)
NOTE: package gpe-mini-browser-0.21: started
NOTE: package gpe-mini-browser-0.21-r0: task do_configure: started
ERROR: function do_configure failed
ERROR: log data follows
(/OE/org.openembedded.dev/tmp/work/armv5te-angstrom-linux-gnueabi/gpe-m=
ini-browser-0.21-r0/temp/log.do_configure.22942)
| automake (GNU automake) 1.9.3
| Written by Tom Tromey <tromey@redhat.com>.
|
| Copyright 2004 Free Software Foundation, Inc.
| This is free software; see the source for copying conditions.  There =
is
NO
| warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.
| AUTOV is 1.9
| NOTE: Executing glib-gettextize --force --copy
| Copying file mkinstalldirs
| Copying file po/Makefile.in.in
|
| Please add the files
|   codeset.m4 gettext.m4 glibc21.m4 iconv.m4 isc-posix.m4 lcmessage.m4=

|   progtest.m4
| from the /OE/org.openembedded.dev/tmp/staging/i686-linux/share/acloca=
l
directory to your autoconf macro directory
| or directly to your aclocal.m4 file.
| You will also need config.guess and config.sub, which you can get fro=
m
| ftp://ftp.gnu.org/pub/gnu/config/.
|
| NOTE: Executing intltoolize --copy --force --automake
| NOTE: Executing autoreconf --verbose --install --force
--exclude=3Dautopoint -I
/OE/org.openembedded.dev/tmp/staging/arm-angstrom-linux-gnueabi/share/a=
clocal-1.9
 -I
/OE/org.openembedded.dev/tmp/staging/arm-angstrom-linux-gnueabi/share/a=
clocal
| autoreconf: Entering directory `.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal -I
/OE/org.openembedded.dev/tmp/staging/arm-angstrom-linux-gnueabi/share/a=
clocal-1.9
 -I
/OE/org.openembedded.dev/tmp/staging/arm-angstrom-linux-gnueabi/share/a=
clocal
 --force
|
/OE/org.openembedded.dev/tmp/staging/arm-angstrom-linux-gnueabi/share/a=
clocal/libpcap.m4:45:
 warning: underquoted definition of AC_LBL_C_INIT
|   run info '(automake)Extending aclocal'
|   or see
http://sources.redhat.com/automake/automake.html#Extending-aclocal
|
/OE/org.openembedded.dev/tmp/staging/arm-angstrom-linux-gnueabi/share/a=
clocal/libpcap.m4:172:
 warning: underquoted definition of AC_LBL_C_INLINE
|
/OE/org.openembedded.dev/tmp/staging/arm-angstrom-linux-gnueabi/share/a=
clocal/libpcap.m4:228:
 warning: underquoted definition of AC_LBL_LIBPCAP
|
/OE/org.openembedded.dev/tmp/staging/arm-angstrom-linux-gnueabi/share/a=
clocal/libpcap.m4:296:
 warning: underquoted definition of AC_LBL_TYPE_SIGNAL
|
/OE/org.openembedded.dev/tmp/staging/arm-angstrom-linux-gnueabi/share/a=
clocal/libpcap.m4:326:
 warning: underquoted definition of AC_LBL_FIXINCLUDES
|
/OE/org.openembedded.dev/tmp/staging/arm-angstrom-linux-gnueabi/share/a=
clocal/libpcap.m4:372:
 warning: underquoted definition of AC_LBL_LEX_AND_YACC
|
/OE/org.openembedded.dev/tmp/staging/arm-angstrom-linux-gnueabi/share/a=
clocal/libpcap.m4:425:
 warning: underquoted definition of AC_LBL_UNION_WAIT
|
/OE/org.openembedded.dev/tmp/staging/arm-angstrom-linux-gnueabi/share/a=
clocal/libpcap.m4:454:
 warning: underquoted definition of AC_LBL_SOCKADDR_SA_LEN
|
/OE/org.openembedded.dev/tmp/staging/arm-angstrom-linux-gnueabi/share/a=
clocal/libpcap.m4:479:
 warning: underquoted definition of AC_LBL_SOCKADDR_STORAGE
|
/OE/org.openembedded.dev/tmp/staging/arm-angstrom-linux-gnueabi/share/a=
clocal/libpcap.m4:512:
 warning: underquoted definition of AC_LBL_HP_PPA_INFO_T_DL_MODULE_ID_1=

|
/OE/org.openembedded.dev/tmp/staging/arm-angstrom-linux-gnueabi/share/a=
clocal/libpcap.m4:538:
 warning: underquoted definition of AC_LBL_HAVE_RUN_PATH
|
/OE/org.openembedded.dev/tmp/staging/arm-angstrom-linux-gnueabi/share/a=
clocal/libpcap.m4:564:
 warning: underquoted definition of AC_LBL_CHECK_TYPE
|
/OE/org.openembedded.dev/tmp/staging/arm-angstrom-linux-gnueabi/share/a=
clocal/libpcap.m4:593:
 warning: underquoted definition of AC_LBL_UNALIGNED_ACCESS
|
/OE/org.openembedded.dev/tmp/staging/arm-angstrom-linux-gnueabi/share/a=
clocal/libpcap.m4:698:
 warning: underquoted definition of AC_LBL_DEVEL
|
/OE/org.openembedded.dev/tmp/staging/arm-angstrom-linux-gnueabi/share/a=
clocal/libpcap.m4:828:
 warning: underquoted definition of AC_LBL_LIBRARY_NET
|
/OE/org.openembedded.dev/tmp/staging/arm-angstrom-linux-gnueabi/share/a=
clocal/libpcap.m4:851:
 warning: underquoted definition of AC_C___ATTRIBUTE__
|
/OE/org.openembedded.dev/tmp/staging/arm-angstrom-linux-gnueabi/share/a=
clocal/libpcap.m4:889:
 warning: underquoted definition of AC_LBL_TPACKET_STATS
|
/OE/org.openembedded.dev/tmp/staging/arm-angstrom-linux-gnueabi/share/a=
clocal/audiofile.m4:12:
 warning: underquoted definition of AM_PATH_AUDIOFILE
| autoreconf: configure.ac: tracing
| autoreconf: configure.ac: not using Libtool
| autoreconf: running:
/OE/org.openembedded.dev/tmp/staging/i686-linux/bin/autoconf
--include=3D/OE/org.openembedded.dev/tmp/staging/arm-angstrom-linux-gnu=
eabi/share/aclocal-1.9

--include=3D/OE/org.openembedded.dev/tmp/staging/arm-angstrom-linux-gnu=
eabi/share/aclocal
 --force --warnings=3Dcross
| autoreconf: configure.ac: not using Autoheader
| autoreconf: running: automake --foreign --add-missing --copy
--force-missing --warnings=3Dcross
| automake: unknown warning category `cross'
| autoreconf: running: gnu-configize
| autoreconf: Leaving directory `.'
| NOTE: Running
/OE/org.openembedded.dev/tmp/work/armv5te-angstrom-linux-gnueabi/gpe-mi=
ni-browser-0.21-r0/gpe-mini-browser-0.21
/configure                   --build=3Di686-linux
--host=3Darm-angstrom-linux-gnueabi
--target=3Darm-angstrom-linux-gnueabi                     --prefix=3D/u=
sr
--exec_prefix=3D/usr               --bindir=3D/usr/bin
--sbindir=3D/usr/sbin                     --libexecdir=3D/usr/libexec
--datadir=3D/usr/share                    --sysconfdir=3D/etc
--sharedstatedir=3D/usr/com               --localstatedir=3D/var
--libdir=3D/usr/lib      --includedir=3D/usr/include
--oldincludedir=3D/usr/include           --infodir=3D/usr/share/info
--mandir=3D/usr/share/man                 ...
| configure: loading site script
/OE/org.openembedded.dev/site/endian-little
| configure: loading site script /OE/org.openembedded.dev/site/common-g=
libc
| configure: loading site script /OE/org.openembedded.dev/site/arm-comm=
on
| configure: loading site script /OE/org.openembedded.dev/site/arm-linu=
x
| configure: loading site script /OE/org.openembedded.dev/site/common
| configure: loading site script /OE/org.openembedded.dev/site/common
| checking for a BSD-compatible install...
/OE/org.openembedded.dev/tmp/staging/i686-linux/bin/install -c
| checking whether build environment is sane... yes
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking for arm-angstrom-linux-gnueabi-strip...
arm-angstrom-linux-gnueabi-strip
| checking for arm-angstrom-linux-gnueabi-gcc...
arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Dxscale
| checking for C compiler default output file name... a.out
| checking whether the C compiler works... yes
| checking whether we are cross compiling... yes
| checking for suffix of executables...
| checking for suffix of object files... o
| checking whether we are using the GNU C compiler... yes
| checking whether arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te
-mtune=3Dxscale accepts -g... yes
| checking for arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3D=
xscale
option to accept ISO C89... none needed
| checking for style of include used by make... GNU
| checking dependency style of arm-angstrom-linux-gnueabi-gcc
-march=3Darmv5te -mtune=3Dxscale... gcc3
| checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-=
gcc
-E
| checking for grep that handles long lines and -e...
/OE/org.openembedded.dev/tmp/staging/i686-linux/bin/grep
| checking for egrep...
/OE/org.openembedded.dev/tmp/staging/i686-linux/bin/grep -E
| checking for ANSI C header files... yes
| checking for a BSD-compatible install...
/OE/org.openembedded.dev/tmp/staging/i686-linux/bin/install -c
| checking for sys/types.h... yes
| checking for sys/stat.h... yes
| checking for stdlib.h... yes
| checking for string.h... yes
| checking for memory.h... yes
| checking for strings.h... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for unistd.h... yes
| checking build system type... i686-pc-linux-gnu
| checking host system type... arm-angstrom-linux-gnueabi
| checking locale.h usability... yes
| checking locale.h presence... yes
| checking for locale.h... yes
| checking for LC_MESSAGES... yes
| checking libintl.h usability... yes
| checking libintl.h presence... yes
| checking for libintl.h... yes
| checking for ngettext in libc... yes
| checking for dgettext in libc... yes
| checking for bind_textdomain_codeset... yes
| checking for msgfmt...
/OE/org.openembedded.dev/tmp/staging/i686-linux/bin/msgfmt
| checking for dcgettext... yes
| checking if msgfmt accepts -c... yes
| checking for gmsgfmt...
/OE/org.openembedded.dev/tmp/staging/i686-linux/bin/msgfmt
| checking for xgettext...
/OE/org.openembedded.dev/tmp/staging/i686-linux/bin/xgettext
| checking for catalogs to be installed...  C fr nl
| checking for intltool >=3D 0.23... 0.35.0 found
| checking for perl...
/OE/org.openembedded.dev/tmp/staging/i686-linux/bin/perl
| checking for XML::Parser... ok
| checking for iconv... /usr/bin/iconv
| checking for msgfmt...
/OE/org.openembedded.dev/tmp/staging/i686-linux/bin/msgfmt
| checking for msgmerge...
/OE/org.openembedded.dev/tmp/staging/i686-linux/bin/msgmerge
| checking for xgettext...
/OE/org.openembedded.dev/tmp/staging/i686-linux/bin/xgettext
| checking for arm-angstrom-linux-gnueabi-pkg-config... no
| checking for pkg-config...
/OE/org.openembedded.dev/tmp/staging/i686-linux/bin/pkg-config
| configure: WARNING: In the future, Autoconf will not detect cross-too=
ls
| whose name does not start with the host triplet.  If you think this
| configuration is useful to you, please write to autoconf@gnu.org.
| checking pkg-config is at least version 0.9.0... yes
| checking for MINIBROWSER... configure: error: Package requirements
(gtk+-2.0 libgpewidget gtk-webcore-nrcit  sqlite) were not met:
|
| No package 'gtk-webcore-nrcit' found
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|
| Alternatively, you may set the environment variables MINIBROWSER_CFLA=
GS
| and MINIBROWSER_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
|
| FATAL: oe_runconf failed
NOTE: Task failed:
/OE/org.openembedded.dev/tmp/work/armv5te-angstrom-linux-gnueabi/gpe-mi=
ni-browser-0.21-r0/temp/log.do_configure.22942
NOTE: package gpe-mini-browser-0.21-r0: task do_configure: failed
ERROR: TaskFailed event exception, aborting
NOTE: package gpe-mini-browser-0.21: failed
ERROR: Build of
/OE/org.openembedded.dev/packages/gpe-mini-browser/gpe-mini-browser_0.2=
1.bb
do_configure failed
ERROR: Task 2792
(/OE/org.openembedded.dev/packages/gpe-mini-browser/gpe-mini-browser_0.=
21.bb,
 do_configure) failed
NOTE: Tasks Summary: Attempted 2393 tasks of which 2391 didn't need to =
be
rerun and 1 failed.
ERROR:
'/OE/org.openembedded.dev/packages/gpe-mini-browser/gpe-mini-browser_0.=
21.bb'
 failed

Best Regards,

Victor=

