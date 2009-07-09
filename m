Received: from [62.250.3.53] (helo=relay.versatel.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <linux@hf-electronics.com>) id 1MOtfV-0004eo-0F
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Jul 2009 15:28:25 +0200
Received: from [62.58.160.127] (helo=hf-electronics.com)
	by relay.versatel.net with smtp (Exim 4.69)
	(envelope-from <linux@hf-electronics.com>) id 1MOtT7-00024H-Hl
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Jul 2009 15:15:23 +0200
Received: from <linux@hf-electronics.com> with PostMaster 4.3.2 (MPS);
	Thu, 09 Jul 2009 15:03:11 +200
From: "Henk Geraads" <linux@hf-electronics.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Jul 2009 15:14:50 +0200
Message-ID: <NGBBLNEOGLJIIJKLFLPFIEOODPAA.linux@hf-electronics.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.6604 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579
Importance: Normal
Subject: Problems building classpath in stable/2009
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
X-List-Received-Date: Thu, 09 Jul 2009 13:29:05 -0000
X-Groupsio-MsgNum: 11834
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_002E_01CA00A8.013F1EA0"

------=_NextPart_000_002E_01CA00A8.013F1EA0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I have a build a system on the CM-270 with the OE stable/2009  branch.=
 Now a am trying to build the cacao jvm (0.99.3) along with the classp=
ath (ver. 0.98). During the compilation task of the "classpath" i have=
 got the message:

	 java -classpath  antlr.Tool -o ../tools/generated/gnu/classpath/tool=
s/gjdoc/expr/ \
		./gnu/classpath/tools/gjdoc/expr/java-expression.g
	 Unrecognised command line option: -o

	 where options include:
	   -client	   compatibility (ignored)
	   -server	   compatibility (ignored)
	=20
	   -cp		   <jar/zip files and directories separated by :>
	   -classpath	   <jar/zip files and directories separated by :>
	 		   locations where to find application classes
	   -D<name>=3D<value> set a system property
	   -verbose[:class|gc|jni]
	 		   :class print out information about class loading, etc.
	 		   :gc print out results of garbage collection
	 		   :jni print out native method dynamic resolution
	   -version	   print out version number and copyright information
	   -showversion     show version number and copyright and continue
	   -fullversion     show jpackage-compatible version number and exit
	   -? -help	   print out this message
	   -X		   show help on non-standard options

The complete error listing is attached to this email, it seems to me i=
t uses cacao or jamvm to compile?
I tried also with setting the PREFERRED_PROVIDER_virtual/java-native t=
o jamvm-native

In the configuration I already set:

	PREFERRED_PROVIDER_virtual/java-initial   =3D "cacao-initial"
	PREFERRED_PROVIDER_classpath              =3D "classpath"
	PREFERRED_PROVIDER_swt3.4-gtk             =3D "swt3.4-gtk-hildon"

	PREFERRED_VERSION_cacao-initial      =3D "0.98"
	PREFERRED_VERSION_classpath-initial  =3D "0.93"

	PREFERRED_PROVIDER_virtual/javac-native =3D "ecj-bootstrap-native"
	PREFERDED_VERSION_libecj-bootstrap =3D "3.3"

	PREFERRED_PROVIDER_virtual/java-native =3D "cacao-native"
	PREFERRED_VERSION_cacao-native =3D "0.99.3"
	PREFERRED_VERSION_classpath-native =3D "0.97.2"

	PREFERRED_VERSION_cacao     =3D "0.99.3"
	PREFERRED_VERSION_classpath =3D "0.98"


Anyone a idea what's wrong?


Henk Geraads

linux@hf-electronics.com < mailto:linux@hf-electronics.com>=20


------=_NextPart_000_002E_01CA00A8.013F1EA0
Content-Type: application/octet-stream;
	name="local.conf"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="local.conf"

#
# OpenEmbedded local configuration file (sample)
#
# Please visit the Wiki at http://openembedded.org/ for more info.
#
#
# Be SURE to read this file in its entirety and the GettingStarted page on =
the
# wiki before proceeding.
#
# Once you have done that, remove the line at the end of this
# file and build away.
#=20
# WARNING: lines starting with a space (' ') will result in parse failures.
# Remove '# ' from commented lines to activate them.
#
# NOTE: Do NOT use $HOME in your paths, BitBake does NOT expand ~ for you. =
 If you
# must have paths relative to your homedir use ${HOME} (note the {}'s there
# you MUST have them for the variable expansion to be done by BitBake).  Yo=
ur
# paths should all be absolute paths (They should all start with a / after
# expansion.  Stuff like starting with ${HOME} or ${TOPDIR} is ok).

# Use this to specify where BitBake should place the downloaded sources int=
o
DL_DIR =3D "/home/armcore/oe/downloads"

# Delete the line below. Then specify which .bb files to consider for
# your build. Typically this will be something like BBFILES =3D "/path/to/o=
penembedded/packages/*/*.bb"
BBFILES :=3D "/home/armcore/oe/openembedded/recipes/*/*.bb"

# Use the BBMASK below to instruct BitBake to _NOT_ consider some .bb files
# This is a regulary expression, so be sure to get your parenthesis balance=
d.
BBMASK =3D ""

# Uncomment this if you want to use a prebuilt toolchain. You will need to
# provide packages for toolchain and additional libraries yourself. You als=
o
# have to set PATH in your environment to make sure BitBake finds additiona=
l binaries.
# ASSUME_PROVIDED +=3D "virtual/${TARGET_PREFIX}gcc virtual/libc"

# Uncomment this if you're building for an arch that uses emulated locale=
=20
# generation under qemu (mainly arm glibc) and have an external gcc 3.x com=
piler
# that OE recognises. This will mean the gcc-native build is skipped, speed=
ing=20
# builds up.
# ASSUME_PROVIDED +=3D "gcc3-native"

# Uncomment this if you are building Linux 2.4 Embedix kernels.
# i.e. openzaurus-sa-2.4.18 and openzaurus-pxa-2.4.18 - and don't forget
# to rename the binaries as instructed in the Wiki.
# Most users do not need this anymore thankfully!
# ASSUME_PROVIDED +=3D "virtual/arm-linux-gcc-2.95"

# Select between multiple alternative providers, if more than one is eligib=
le.
PREFERRED_PROVIDERS =3D "virtual/qte:qte virtual/libqpe:libqpe-opie"
PREFERRED_PROVIDERS +=3D " virtual/libsdl:libsdl-x11"
PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-in=
itial"
PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cro=
ss-intermediate"
PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc:gcc-cross"
PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}g++:gcc-cross"

PREFERRED_PROVIDER_virtual/java-initial   =3D "cacao-initial"
PREFERRED_PROVIDER_classpath              =3D "classpath"
PREFERRED_PROVIDER_swt3.4-gtk             =3D "swt3.4-gtk-hildon"

PREFERRED_VERSION_cacao-initial      =3D "0.98"
PREFERRED_VERSION_classpath-initial  =3D "0.93"

PREFERRED_PROVIDER_virtual/javac-native =3D "ecj-bootstrap-native"
PREFERDED_VERSION_libecj-bootstrap      =3D "3.3"

PREFERRED_PROVIDER_virtual/java-native =3D "cacao-native"
PREFERRED_VERSION_cacao-native 	       =3D "0.99.3"
PREFERRED_VERSION_classpath-native     =3D "0.97.2"

PREFERRED_VERSION_cacao     =3D "0.99.3"
PREFERRED_VERSION_classpath =3D "0.98"





# Uncomment this to specify where BitBake should create its temporary files=
.
# Note that a full build of everything in OpenEmbedded will take GigaBytes =
of hard
# disk space, so make sure to free enough space. The default TMPDIR is
# <build directory>/tmp
# Don't use symlinks in in the path to avoid problems
TMPDIR =3D /home/armcore/oe/build/distrobuild/${DISTRO}

# Uncomment this to specify a machine to build for. See the conf directory
# for machines currently known to OpenEmbedded. This will automatically tak=
e care
# of TARGET_ARCH
MACHINE =3D "cm-x270"

# Use this to specify the target architecture. Note that this is only
# needed when building for a machine not known to OpenEmbedded. Better use
# the MACHINE attribute (see above)
# TARGET_ARCH =3D "arm"

# Use this to specify the target operating system.  The default is "linux",
# for a normal linux system with glibc. Set this to "linux-uclibc" if you w=
ant
# to build a uclibc based system.
# Normally the DISTRO of your choosing will take care of this=20
# TARGET_OS =3D "linux"
# TARGET_OS =3D "linux-uclibc"

# Uncomment this to select a distribution policy. See the conf directory
# for distributions currently known to OpenEmbedded.
# Although it no longer contain version number in the (file-)name
# openzaurus-unstable is a so called "versioned"  distro, i.e. they=20
# explicitely select specific versions of various packages.
# Stay away from unversioned distros unless you really know what you are do=
ing
DISTRO =3D "angstrom-2008.1"

# So far, angstrom.conf sets ENABLE_BINARY_LOCALE_GENERATION
# to generate binary locale packages at build time using qemu-native and
# thereby guarantee i18n support on all devices. If your build breaks on=20
# qemu-native consider disabling ENABLE_BINARY_LOCALE_GENERATION (note that
# this breaks i18n on devices with less than 128MB RAM) or installing
# a working third-party qemu (e.g. provided by your distribution) and
# adding qemu-native to ASSUME_PROVIDED. Caveat emptor, since third-party
# qemus lack patches needed to work with various OE targets.
# ENABLE_BINARY_LOCALE_GENERATION =3D "0"
# ASSUME_PROVIDED +=3D "qemu-native"

# If ENABLE_BINARY_LOCALE_GENERATION is set to "1", you can limit locales
# generated to the list provided by GLIBC_GENERATE_LOCALES. This is huge
# time-savior for developmental builds. Format: list of locale.encoding pai=
rs
# with spaces as separators.
# GLIBC_GENERATE_LOCALES =3D "en_GB.UTF-8 de_DE.UTF-8"

# Uncomment this to select a particular major kernel version if the MACHINE=
 setting
# supports more than one major kernel version. Currently this is suported b=
y the
# following MACHINE types: poodle, tosa and simpad.
# MACHINE_KERNEL_VERSION =3D "2.6"

# Uncomment one of these to build packages during the build process.
# This is done automatically if you set DISTRO (see above)
# INHERIT =3D "package_ipk"
# INHERIT =3D "package_tar"

# Add the required image file system types below. Valid are=20
# jffs2, tar(.gz|bz2), cpio(.gz), cramfs, ext2(.gz), ext3(.gz)
# squashfs, squashfs-lzma
IMAGE_FSTYPES =3D "jffs2 tar"

# Uncomment this to disable the parse cache (not recommended).
# CACHE =3D ""

# Uncomment this if you want BitBake to emit debugging output
# BBDEBUG =3D "yes"

# Uncomment these two if you want BitBake to build images useful for debugg=
ing.=20
# Note that INHIBIT_PACKAGE_STRIP needs a package format to be defined.
# Also note that OE now produces -dbg packages which contain debugging symb=
ols.
# DEBUG_BUILD =3D "1"
# INHIBIT_PACKAGE_STRIP =3D "1"

# Uncomment these to build a package such that you can use gprof to profile=
 it.
# NOTE: This will only work with 'linux' targets, not
# 'linux-uclibc', as uClibc doesn't provide the necessary
# object files.  Also, don't build glibc itself with these
# flags, or it'll fail to build.
#
# PROFILE_OPTIMIZATION =3D "-pg"
# SELECTED_OPTIMIZATION =3D "${PROFILE_OPTIMIZATION}"
# LDFLAGS =3D+ "-pg"

# Uncomment this to enable parallel make.
# This allows make to spawn mutliple processes to take advantage of multipl=
e=20
# processors. Useful on SMP machines. This may break some packages - we're
# in the process of marking these so let us know if you find any.
PARALLEL_MAKE =3D "-j 4"
BB_NUMBER_THTREADS =3D "2"

# Uncomment this if you want BitBake to emit the log if a build fails.
BBINCLUDELOGS =3D "yes"

# Specifies a location to search for pre-generated tarballs when fetching
# a cvs:// URI. Outcomment this, if you always want to pull directly from C=
VS.
#CVS_TARBALL_STASH =3D ""

# Uncomment this if you want to install shared libraries directly under the=
ir SONAME,
# rather than installing as the full version and symlinking to the SONAME.
# PACKAGE_SNAP_LIB_SYMLINKS =3D "1"

# EDIT THIS FILE and then remove the line below before using!
# REMOVE_THIS_LINE:=3D"${@bb.fatal('Read the comments in your conf/local.co=
nf')}"


------=_NextPart_000_002E_01CA00A8.013F1EA0
Content-Type: application/octet-stream;
	name="errorlist.dat"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="errorlist.dat"

NOTE: Out of date cache found, rebuilding...
Parsing .bb files, please wait...done.
NOTE: Parsing finished. 0 cached, 6367 parsed, 294 skipped, 0 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1168 of 1698 (ID: 245, /home/armcore/oe/openembedded/rec=
ipes/classpath/classpath_0.98.bb, do_compile)
ERROR: function do_compile failed
ERROR: log data follows (/home/armcore/oe/build/distrobuild/angstrom/work/a=
rmv5te-angstrom-linux-gnueabi/classpath-0.98-r0/temp/log.do_compile.24827)
| NOTE: make -j 4
| Making all in lib
| make[1]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/lib'
| true
| top_builddir=3D.. top_srcdir=3D.. /bin/sh ./gen-classlist.sh standard
| Adding java source files from srcdir '..'.
| Adding java source files from VM directory ../vm/reference
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/lib'
| Making all in doc
| make[1]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/doc'
| Making all in api
| make[2]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/doc/ap=
i'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/doc/api=
'
| make[2]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/doc'
| make[2]: Nothing to be done for `all-am'.
| make[2]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/doc'
| make[1]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/doc'
| Making all in external
| make[1]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/extern=
al'
| Making all in sax
| make[2]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/extern=
al/sax'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/externa=
l/sax'
| Making all in w3c_dom
| make[2]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/extern=
al/w3c_dom'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/externa=
l/w3c_dom'
| Making all in relaxngDatatype
| make[2]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/extern=
al/relaxngDatatype'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/externa=
l/relaxngDatatype'
| Making all in jsr166
| make[2]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/extern=
al/jsr166'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/externa=
l/jsr166'
| make[2]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/extern=
al'
| make[2]: Nothing to be done for `all-am'.
| make[2]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/externa=
l'
| make[1]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/externa=
l'
| Making all in include
| make[1]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/includ=
e'
| make  all-am
| make[2]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/includ=
e'
| make[2]: Nothing to be done for `all-am'.
| make[2]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/include=
'
| make[1]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/include=
'
| Making all in native
| make[1]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native=
'
| Making all in fdlibm
| make[2]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native=
/fdlibm'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native/=
fdlibm'
| Making all in jni
| make[2]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native=
/jni'
| Making all in classpath
| make[3]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native=
/jni/classpath'
| make[3]: Nothing to be done for `all'.
| make[3]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native/=
jni/classpath'
| Making all in native-lib
| make[3]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native=
/jni/native-lib'
| make[3]: Nothing to be done for `all'.
| make[3]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native/=
jni/native-lib'
| Making all in java-io
| make[3]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native=
/jni/java-io'
| make[3]: Nothing to be done for `all'.
| make[3]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native/=
jni/java-io'
| Making all in java-lang
| make[3]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native=
/jni/java-lang'
| make[3]: Nothing to be done for `all'.
| make[3]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native/=
jni/java-lang'
| Making all in java-net
| make[3]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native=
/jni/java-net'
| make[3]: Nothing to be done for `all'.
| make[3]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native/=
jni/java-net'
| Making all in java-nio
| make[3]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native=
/jni/java-nio'
| make[3]: Nothing to be done for `all'.
| make[3]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native/=
jni/java-nio'
| Making all in java-util
| make[3]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native=
/jni/java-util'
| make[3]: Nothing to be done for `all'.
| make[3]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native/=
jni/java-util'
| Making all in gtk-peer
| make[3]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native=
/jni/gtk-peer'
| make[3]: Nothing to be done for `all'.
| make[3]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native/=
jni/gtk-peer'
| Making all in gconf-peer
| make[3]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native=
/jni/gconf-peer'
| make[3]: Nothing to be done for `all'.
| make[3]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native/=
jni/gconf-peer'
| make[3]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native=
/jni'
| /bin/sh ../../scripts/check_jni_methods.sh
| make[3]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native/=
jni'
| make[2]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native/=
jni'
| Making all in jawt
| make[2]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native=
/jawt'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native/=
jawt'
| make[2]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native=
'
| make[2]: Nothing to be done for `all-am'.
| make[2]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native'
| make[1]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/native'
| Making all in resource
| make[1]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/resour=
ce'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/resourc=
e'
| Making all in scripts
| make[1]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/script=
s'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/scripts=
'
| Making all in tools
| make[1]: Entering directory `/home/armcore/oe/build/distrobuild/angstrom/=
work/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/tools'
| /home/armcore/oe/build/distrobuild/angstrom/staging/i686-linux/usr/bin/mk=
dir -p classes asm
| /home/armcore/oe/build/distrobuild/angstrom/staging/i686-linux/usr/bin/mk=
dir -p ../tools/generated/gnu/classpath/tools/gjdoc/expr
| java -classpath  antlr.Tool -o ../tools/generated/gnu/classpath/tools/gjd=
oc/expr/ \
| 	  ./gnu/classpath/tools/gjdoc/expr/java-expression.g
| Unrecognised command line option: -o
| Usage: java [-options] class [arg1 arg2 ...]
|                  (to run a class file)
|    or  java [-options] -jar jarfile [arg1 arg2 ...]
|                  (to run a standalone jar file)
|=20
| where options include:
|   -client	   compatibility (ignored)
|   -server	   compatibility (ignored)
|=20
|   -cp		   <jar/zip files and directories separated by :>
|   -classpath	   <jar/zip files and directories separated by :>
| 		   locations where to find application classes
|   -D<name>=3D<value> set a system property
|   -verbose[:class|gc|jni]
| 		   :class print out information about class loading, etc.
| 		   :gc print out results of garbage collection
| 		   :jni print out native method dynamic resolution
|   -version	   print out version number and copyright information
|   -showversion     show version number and copyright and continue
|   -fullversion     show jpackage-compatible version number and exit
|   -? -help	   print out this message
|   -X		   show help on non-standard options
| make[1]: *** [tools.zip] Error 1
| make[1]: Leaving directory `/home/armcore/oe/build/distrobuild/angstrom/w=
ork/armv5te-angstrom-linux-gnueabi/classpath-0.98-r0/classpath-0.98/tools'
| make: *** [all-recursive] Error 1
| FATAL: oe_runmake failed
NOTE: Task failed: /home/armcore/oe/build/distrobuild/angstrom/work/armv5te=
-angstrom-linux-gnueabi/classpath-0.98-r0/temp/log.do_compile.24827
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/armcore/oe/openembedded/recipes/classpath/classpath_0=
.98.bb do_compile failed
ERROR: Task 245 (/home/armcore/oe/openembedded/recipes/classpath/classpath_=
0.98.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 1167 tasks of which 1167 didn't need to be r=
erun and 1 failed.
ERROR: '/home/armcore/oe/openembedded/recipes/classpath/classpath_0.98.bb' =
failed


------=_NextPart_000_002E_01CA00A8.013F1EA0--
