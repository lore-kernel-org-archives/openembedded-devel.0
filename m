Received: from bsmtp4.bon.at ([195.3.86.186] helo=bsmtp.bon.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pgsellmann@portner-elektronik.at>)
	id 1QOp7i-00041T-9y for openembedded-devel@lists.openembedded.org;
	Tue, 24 May 2011 12:46:02 +0200
Received: from aspire.localdomain (unknown [88.116.171.82])
	by bsmtp.bon.at (Postfix) with ESMTP id 28A17130063;
	Tue, 24 May 2011 12:43:00 +0200 (CEST)
From: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Organization: PORTNER Elektronik
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 24 May 2011 12:42:58 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.32.26-175.fc12.x86_64; KDE/4.4.5; x86_64; ;
	)
References: <201105231555.38190.pgsellmann@portner-elektronik.at>
	<20110523140549.GF3235@jama.jama.net>
In-Reply-To: <20110523140549.GF3235@jama.jama.net>
MIME-Version: 1.0
Message-Id: <201105241242.59447.pgsellmann@portner-elektronik.at>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Sorry, 4340f07345392b2c4c2017142cce40e407d219af
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
X-List-Received-Date: Tue, 24 May 2011 10:46:02 -0000
X-Groupsio-MsgNum: 32264
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_zu42Nbc31/OM+OI"

--Boundary-00=_zu42Nbc31/OM+OI
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

Am Montag 23 Mai 2011, 16:05:50 schrieb Martin Jansa:
> On Mon, May 23, 2011 at 03:55:37PM +0200, Peter Gsellmann wrote:
> > Hi Martin!
> > 
> > The above commit breaks my daily build.
> > By reverting it, i can build again.
> > Error occurs in recipe gnumail which obviously needs some 64bit javac
> > Log is appended
> 
> In this whole *long* log I found only one line interesting:
sorry for being long, but hesitated to cut it.

> | checking if /home/oe/build/tmp/sysroots/x86_64-linux/usr/bin/javac
> works... configure: error: The Java compiler
> /home/oe/build/tmp/sysroots/x86_64-linux/usr/bin/javac failed (see
> config.log, check the CLASSPATH?)
the config.log from bitbake is a short one :-) inserted here:
the config.log from ./configure is long, attached (jump to line 58)

autoreconf: Entering directory `.'
autoreconf: configure.ac: not using Gettext
autoreconf: running: aclocal -I /home/oe/build/tmp/work/x86_64-linux/gnumail-native-1.1.2-r2/mail-1.1.2/m4/ -I /home/oe/build/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I /home/oe/build/tmp/sysroots/x86_64-linux/usr/share/aclocal -I /home/oe/build/tmp/work/x86_64-linux/gnumail-native-1.1.2-r2/mail-1.1.2/m4/ -I /home/oe/build/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I /home/oe/build/tmp/sysroots/x86_64-linux/usr/share/aclocal --force
autoreconf: configure.ac: tracing
autoreconf: configure.ac: not using Libtool
autoreconf: running: /home/oe/build/tmp/sysroots/x86_64-linux/usr/bin/autoconf --include=/home/oe/build/tmp/work/x86_64-linux/gnumail-native-1.1.2-r2/mail-1.1.2/m4/ --include=/home/oe/build/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11 --include=/home/oe/build/tmp/sysroots/x86_64-linux/usr/share/aclocal --force --warnings=cross
autoreconf: configure.ac: not using Autoheader
autoreconf: running: automake --foreign --add-missing --copy --force-missing --warnings=cross
automake: unknown warning category `cross'
autoreconf: running: gnu-configize
autoreconf: Leaving directory `.'
configure: WARNING: unrecognized options: --with-libtool-sysroot, --enable-largefile, --disable-nls, --enable-ipv6
checking for a BSD-compatible install... /home/oe/openembedded/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking if /home/oe/build/tmp/sysroots/x86_64-linux/usr/bin/javac works... configure: error: The Java compiler /home/oe/build/tmp/sysroots/x86_64-linux/usr/bin/javac failed (see config.log, check the CLASSPATH?)

> but whithout this config.log I have no idea what could go wrong, maybe
> java maintainers will enlighten us, but woglinde confirmed that cacao is
> currently known to be broken and that openjdk is right replacement.
in the working setup there is a symlink 
 ./tmp/sysroots/x86_64-linux/usr/bin/javac -> sun-javac
which is absent in the failing setup.

 
> Try to clean all cacao related recipes and you will probably get the
> same error as I did before 4340f07345392b2c4c2017142cce40e407d219af and
> maybe it will succeed to build gnumail without cacao in sysroot and
> proper build of openjdk... but this is all my crystal ball can show
> without config.log..
Usually my daily(=nightly) build is 'from scratch' with empty './tmp' after 'git pull --rebase'
So if cacao is not requested by some other packages it should not appear.
But in the long long file there are 17 lines showing 'cacao' most of them showing recipe 'cacaoh-openjdk-native'


In my local.conf and machine-file i have (for a very long time):
ASSUME_PROVIDED += "virtual/java-native"
ASSUME_PROVIDED += "virtual/javac-native"
PREFERRED_PROVIDER_classpath = "classpath-minimal"
PREFERRED_PROVIDER_virtual/java-initial = "jamvm-initial"
is any of this now wrong?
should i insert specific PREFERRED_PROVIDERS or ASSUME_PROVIDED statements?
Both java (1.6.0_16) and javac (1.6.0_18) are installed here.



Regards,
Peter

--Boundary-00=_zu42Nbc31/OM+OI
Content-Type: text/x-log;
  charset="UTF-8";
  name="config.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="config.log"

This file contains any messages produced by compilers while
running configure, to aid debugging if configure makes a mistake.

It was created by gnumail configure 1.1.1, which was
generated by GNU Autoconf 2.65.  Invocation command line was

  $ /home/oe/build/tmp/work/x86_64-linux/gnumail-native-1.1.2-r2/mail-1.1.2=
/configure --build=3Dx86_64-linux --host=3Dx86_64-linux --target=3Dx86_64-l=
inux --prefix=3D/home/oe/build/tmp/sysroots/x86_64-linux/usr --exec_prefix=
=3D/home/oe/build/tmp/sysroots/x86_64-linux/usr --bindir=3D/home/oe/build/t=
mp/sysroots/x86_64-linux/usr/bin --sbindir=3D/home/oe/build/tmp/sysroots/x8=
6_64-linux/usr/sbin --libexecdir=3D/home/oe/build/tmp/sysroots/x86_64-linux=
/usr/libexec --datadir=3D/home/oe/build/tmp/sysroots/x86_64-linux/usr/share=
 --sysconfdir=3D/home/oe/build/tmp/sysroots/x86_64-linux/etc --sharedstated=
ir=3D/home/oe/build/tmp/sysroots/x86_64-linux/com --localstatedir=3D/home/o=
e/build/tmp/sysroots/x86_64-linux/var --libdir=3D/home/oe/build/tmp/sysroot=
s/x86_64-linux/usr/lib --includedir=3D/home/oe/build/tmp/sysroots/x86_64-li=
nux/usr/include --oldincludedir=3D/home/oe/build/tmp/sysroots/x86_64-linux/=
usr/include --infodir=3D/home/oe/build/tmp/sysroots/x86_64-linux/usr/share/=
info --mandir=3D/home/oe/build/tmp/sysroots/x86_64-linux/usr/share/man --wi=
th-libtool-sysroot --enable-largefile --disable-nls --enable-ipv6 --with-in=
etlib-jar=3D/home/oe/build/tmp/sysroots/x86_64-linux/usr/share/java --with-=
activation-jar=3D/home/oe/build/tmp/sysroots/x86_64-linux/usr/share/java

## --------- ##
## Platform. ##
## --------- ##

hostname =3D aspire.localdomain
uname -m =3D x86_64
uname -r =3D 2.6.32.26-175.fc12.x86_64
uname -s =3D Linux
uname -v =3D #1 SMP Wed Dec 1 21:39:34 UTC 2010

/usr/bin/uname -p =3D unknown
/bin/uname -X     =3D unknown

/bin/arch              =3D x86_64
/usr/bin/arch -k       =3D unknown
/usr/convex/getsysinfo =3D unknown
/usr/bin/hostinfo      =3D unknown
/bin/machine           =3D unknown
/usr/bin/oslevel       =3D unknown
/bin/universe          =3D unknown

PATH: /home/oe/build/bin
PATH: /home/oe/openembedded/bin
PATH: /home/oe/build/tmp/sysroots/x86_64-linux/usr/bin
PATH: /home/oe/build/tmp/sysroots/x86_64-linux/usr/sbin
PATH: /home/oe/build/tmp/sysroots/x86_64-linux/usr/bin
PATH: /home/oe/build/tmp/sysroots/x86_64-linux/sbin
PATH: /home/oe/build/tmp/sysroots/x86_64-linux//bin
PATH: /home/oe/bitbake/bin
PATH: /usr/bin
PATH: /bin


## ----------- ##
## Core tests. ##
## ----------- ##

configure:1769: checking for a BSD-compatible install
configure:1837: result: /home/oe/openembedded/bin/install -c
configure:1848: checking whether build environment is sane
configure:1898: result: yes
configure:2039: checking for a thread-safe mkdir -p
configure:2078: result: /bin/mkdir -p
configure:2091: checking for gawk
configure:2107: found /usr/bin/gawk
configure:2118: result: gawk
configure:2129: checking whether make sets $(MAKE)
configure:2151: result: yes
configure:2443: checking if /home/oe/build/tmp/sysroots/x86_64-linux/usr/bi=
n/javac works
configure:2457: /home/oe/build/tmp/sysroots/x86_64-linux/usr/bin/javac  -cl=
asspath .: Test.java
/home/oe/build/tmp/work/x86_64-linux/gnumail-native-1.1.2-r2/mail-1.1.2/con=
figure: line 2458: /home/oe/build/tmp/sysroots/x86_64-linux/usr/bin/javac: =
No such file or directory
configure:2460: $? =3D 127
configure:2464: error: The Java compiler /home/oe/build/tmp/sysroots/x86_64=
-linux/usr/bin/javac failed (see config.log, check the CLASSPATH?)

## ---------------- ##
## Cache variables. ##
## ---------------- ##

ac_cv_env_build_alias_set=3Dset
ac_cv_env_build_alias_value=3Dx86_64-linux
ac_cv_env_host_alias_set=3Dset
ac_cv_env_host_alias_value=3Dx86_64-linux
ac_cv_env_target_alias_set=3Dset
ac_cv_env_target_alias_value=3Dx86_64-linux
ac_cv_path_install=3D'/home/oe/openembedded/bin/install -c'
ac_cv_path_mkdir=3D/bin/mkdir
ac_cv_prog_AWK=3Dgawk
ac_cv_prog_make_make_set=3Dyes

## ----------------- ##
## Output variables. ##
## ----------------- ##

ACLOCAL=3D'${SHELL} /home/oe/build/tmp/work/x86_64-linux/gnumail-native-1.1=
.2-r2/mail-1.1.2/missing --run aclocal-1.11'
ACTIVATION_JAR=3D''
AMTAR=3D'${SHELL} /home/oe/build/tmp/work/x86_64-linux/gnumail-native-1.1.2=
-r2/mail-1.1.2/missing --run tar'
AUTOCONF=3D'${SHELL} /home/oe/build/tmp/work/x86_64-linux/gnumail-native-1.=
1.2-r2/mail-1.1.2/missing --run autoconf'
AUTOHEADER=3D'${SHELL} /home/oe/build/tmp/work/x86_64-linux/gnumail-native-=
1.1.2-r2/mail-1.1.2/missing --run autoheader'
AUTOMAKE=3D'${SHELL} /home/oe/build/tmp/work/x86_64-linux/gnumail-native-1.=
1.2-r2/mail-1.1.2/missing --run automake-1.11'
AWK=3D'gawk'
CYGPATH_W=3D'echo'
DEFS=3D''
ECHO_C=3D''
ECHO_N=3D'-n'
ECHO_T=3D''
ENABLE_IMAP_FALSE=3D'#'
ENABLE_IMAP_TRUE=3D''
ENABLE_MAILDIR_FALSE=3D'#'
ENABLE_MAILDIR_TRUE=3D''
ENABLE_MBOX_FALSE=3D'#'
ENABLE_MBOX_TRUE=3D''
ENABLE_NNTP_FALSE=3D'#'
ENABLE_NNTP_TRUE=3D''
ENABLE_POP3_FALSE=3D'#'
ENABLE_POP3_TRUE=3D''
ENABLE_SMTP_FALSE=3D'#'
ENABLE_SMTP_TRUE=3D''
INETLIB_JAR=3D''
INSTALL_DATA=3D'${INSTALL} -m 644'
INSTALL_PROGRAM=3D'${INSTALL}'
INSTALL_SCRIPT=3D'${INSTALL}'
INSTALL_STRIP_PROGRAM=3D'$(install_sh) -c -s'
JAR=3D''
JAVA=3D'/home/oe/build/tmp/sysroots/x86_64-linux/usr/bin/java'
JAVAC=3D'/home/oe/build/tmp/sysroots/x86_64-linux/usr/bin/javac'
JAVACFLAGS=3D''
JAVADOC=3D'true'
JAVADOCFLAGS=3D''
JAVAFLAGS=3D''
JAVAPREFIX=3D''
JSSE_JAR=3D''
LIBOBJS=3D''
LIBS=3D''
LTLIBOBJS=3D''
MAKEINFO=3D'${SHELL} /home/oe/build/tmp/work/x86_64-linux/gnumail-native-1.=
1.2-r2/mail-1.1.2/missing --run makeinfo'
MKDIR_P=3D'/bin/mkdir -p'
PACKAGE=3D'mail'
PACKAGE_BUGREPORT=3D''
PACKAGE_NAME=3D'gnumail'
PACKAGE_STRING=3D'gnumail 1.1.1'
PACKAGE_TARNAME=3D'gnumail'
PACKAGE_URL=3D''
PACKAGE_VERSION=3D'1.1.1'
PATH_SEPARATOR=3D':'
SET_MAKE=3D''
SHELL=3D'/bin/sh'
STRIP=3D'strip'
VERSION=3D'1.1.1'
am__isrc=3D''
am__leading_dot=3D'.'
am__tar=3D'${AMTAR} chof - "$$tardir"'
am__untar=3D'${AMTAR} xf -'
bindir=3D'/home/oe/build/tmp/sysroots/x86_64-linux/usr/bin'
build_alias=3D'x86_64-linux'
datadir=3D'/home/oe/build/tmp/sysroots/x86_64-linux/usr/share'
datarootdir=3D'${prefix}/share'
docdir=3D'${datarootdir}/doc/${PACKAGE_TARNAME}'
dvidir=3D'${docdir}'
exec_prefix=3D'/home/oe/build/tmp/sysroots/x86_64-linux/usr'
host_alias=3D'x86_64-linux'
htmldir=3D'${docdir}'
includedir=3D'/home/oe/build/tmp/sysroots/x86_64-linux/usr/include'
infodir=3D'/home/oe/build/tmp/sysroots/x86_64-linux/usr/share/info'
install_sh=3D'${SHELL} /home/oe/build/tmp/work/x86_64-linux/gnumail-native-=
1.1.2-r2/mail-1.1.2/install-sh'
libdir=3D'/home/oe/build/tmp/sysroots/x86_64-linux/usr/lib'
libexecdir=3D'/home/oe/build/tmp/sysroots/x86_64-linux/usr/libexec'
localedir=3D'${datarootdir}/locale'
localstatedir=3D'/home/oe/build/tmp/sysroots/x86_64-linux/var'
mandir=3D'/home/oe/build/tmp/sysroots/x86_64-linux/usr/share/man'
mkdir_p=3D'/bin/mkdir -p'
oldincludedir=3D'/home/oe/build/tmp/sysroots/x86_64-linux/usr/include'
pdfdir=3D'${docdir}'
prefix=3D'/home/oe/build/tmp/sysroots/x86_64-linux/usr'
program_transform_name=3D's,x,x,'
psdir=3D'${docdir}'
sbindir=3D'/home/oe/build/tmp/sysroots/x86_64-linux/usr/sbin'
sharedstatedir=3D'/home/oe/build/tmp/sysroots/x86_64-linux/com'
sysconfdir=3D'/home/oe/build/tmp/sysroots/x86_64-linux/etc'
target_alias=3D'x86_64-linux'
uudecode=3D''

## ----------- ##
## confdefs.h. ##
## ----------- ##

/* confdefs.h */
#define PACKAGE_NAME "gnumail"
#define PACKAGE_TARNAME "gnumail"
#define PACKAGE_VERSION "1.1.1"
#define PACKAGE_STRING "gnumail 1.1.1"
#define PACKAGE_BUGREPORT ""
#define PACKAGE_URL ""
#define PACKAGE "gnumail"
#define VERSION "1.1.1"

configure: exit 1

--Boundary-00=_zu42Nbc31/OM+OI--
