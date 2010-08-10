Received: from 31.mail-out.ovh.net ([213.186.62.10])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <plagnioj@jcrosoft.com>) id 1OilQp-0006Sd-Im
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 11:47:56 +0200
Received: (qmail 4696 invoked by uid 503); 10 Aug 2010 09:48:22 -0000
Received: from b7.ovh.net (HELO mail23.ha.ovh.net) (213.186.33.57)
	by 31.mail-out.ovh.net with SMTP; 10 Aug 2010 09:48:21 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 10 Aug 2010 11:40:44 +0200
Received: from ns32433.ovh.net (HELO localhost)
	(plagnioj%jcrosoft.com@213.251.161.87)
	by ns0.ovh.net with SMTP; 10 Aug 2010 11:40:42 +0200
Date: Tue, 10 Aug 2010 11:35:50 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100810093550.GE10920@game.jcrosoft.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Ovh-Tracer-Id: 2205074967624526665
X-Ovh-Remote: 213.251.161.87 (ns32433.ovh.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-SA-Exim-Connect-IP: 213.186.62.10
X-SA-Exim-Mail-From: plagnioj@jcrosoft.com
X-SA-Exim-Scanned: No (on linuxtogo.org);
	Message bigger than SAmaxbody (256000)
Subject: gcc-cross-initial-4.3.3-r14.1 failed on SH4 angstrom
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
X-List-Received-Date: Tue, 10 Aug 2010 09:47:56 -0000
X-Groupsio-MsgNum: 22042
Content-Type: multipart/mixed; boundary="u65IjBhB3TIa72Vp"
Content-Disposition: inline

--u65IjBhB3TIa72Vp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

HI,

	I'm currently trying to use OE for a titan (SH4) board with Angstrom distrib

	I've attached my conf and log

	gcc-cross-initial-4.3.3-r14.1 failled to compile due to the fact that
	it's include /usr/include

	is some have any idea?

Best Regards,
J.

--u65IjBhB3TIa72Vp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="local.conf"

# Depends on your machine
BB_NUMBER_THREADS = "2"
# Depends on your cluster, but don't use more than -j 15
PARALLEL_MAKE = "-j 5"
BASEDIR=/opt/work/oe
BBFILES = "${BASEDIR}/openembedded/recipes/*/*.bb"
DISTRO = "angstrom-2008.1"
MACHINE = "titan"
#
# OpenEmbedded local configuration file (sample)
#
# Please visit the Wiki at http://openembedded.org/ for more info.
#
#
# Be SURE to read this file in its entirety and the GettingStarted page on the
# wiki before proceeding.
#
# Once you have done that, remove the line at the end of this
# file and build away.
# 
# WARNING: lines starting with a space (' ') will result in parse failures.
# Remove '# ' from commented lines to activate them.
#
# NOTE: Do NOT use $HOME in your paths, BitBake does NOT expand ~ for you.  If you
# must have paths relative to your homedir use ${HOME} (note the {}'s there
# you MUST have them for the variable expansion to be done by BitBake).  Your
# paths should all be absolute paths (They should all start with a / after
# expansion.  Stuff like starting with ${HOME} or ${TOPDIR} is ok).

# Use this to specify where BitBake should place the downloaded sources into
DL_DIR = "${BASEDIR}/sources"

# Delete the line below. Then specify which .bb files to consider for
# your build. Typically this will be something like BBFILES = "/path/to/openembedded/recipes/*/*.bb"
#BBFILES := "${@bb.fatal('Edit your conf/local.conf: BBFILES')}"

# Use the BBMASK below to instruct BitBake to _NOT_ consider some .bb files
# This is a regulary expression, so be sure to get your parenthesis balanced.
BBMASK = ""

# Uncomment this if your host distribution has recent enough Linux
# Kernel header files.  Utilities we use to generate certain types of
# target filesystems need somewhat recent header files.
# ASSUME_PROVIDED += "linux-libc-headers-native"

# Uncomment this if you want to use a prebuilt toolchain. You will need to
# provide packages for toolchain and additional libraries yourself. You also
# have to set PATH in your environment to make sure BitBake finds additional binaries.
# ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}gcc virtual/libc"

# Uncomment this if you are building Linux 2.4 Embedix kernels.
# i.e. openzaurus-sa-2.4.18 and openzaurus-pxa-2.4.18 - and don't forget
# to rename the binaries as instructed in the Wiki.
# Most users do not need this anymore thankfully!
# ASSUME_PROVIDED += "virtual/arm-linux-gcc-2.95"

# Select between multiple alternative providers, if more than one is eligible.
PREFERRED_PROVIDERS = "virtual/qte:qte virtual/libqpe:libqpe-opie"
PREFERRED_PROVIDERS += " virtual/libsdl:libsdl-x11"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"

# Uncomment this to specify where BitBake should create its temporary files.
# Note that a full build of everything in OpenEmbedded will take GigaBytes of hard
# disk space, so make sure to free enough space. The default TMPDIR is
# <build directory>/tmp
# Don't use symlinks in in the path to avoid problems
# TMPDIR = /usr/local/projects/oetmp

# Uncomment this to specify a machine to build for. See the conf directory
# for machines currently known to OpenEmbedded. This will automatically take care
# of TARGET_ARCH
# MACHINE = "c7x0"

# Use this to specify the target architecture. Note that this is only
# needed when building for a machine not known to OpenEmbedded. Better use
# the MACHINE attribute (see above)
# TARGET_ARCH = "arm"

# Use this to specify the target operating system.  The default is "linux",
# for a normal linux system with glibc. Set this to "linux-uclibc" if you want
# to build a uclibc based system.
# Normally the DISTRO of your choosing will take care of this 
# TARGET_OS = "linux"
# TARGET_OS = "linux-uclibc"

# Uncomment this to select a distribution policy. See the conf directory
# for distributions currently known to OpenEmbedded.
# Although it no longer contain version number in the (file-)name
# openzaurus-unstable is a so called "versioned"  distro, i.e. they 
# explicitely select specific versions of various packages.
# Stay away from unversioned distros unless you really know what you are doing
# DISTRO = "angstrom-2008.1"

# So far, angstrom.conf sets ENABLE_BINARY_LOCALE_GENERATION
# to generate binary locale packages at build time using qemu-native and
# thereby guarantee i18n support on all devices. If your build breaks on 
# qemu-native consider disabling ENABLE_BINARY_LOCALE_GENERATION (note that
# this breaks i18n on devices with less than 128MB RAM) or installing
# a working third-party qemu (e.g. provided by your distribution) and
# adding qemu-native to ASSUME_PROVIDED. Caveat emptor, since third-party
# qemus lack patches needed to work with various OE targets.
# ENABLE_BINARY_LOCALE_GENERATION = "0"
# ASSUME_PROVIDED += "qemu-native"

# If ENABLE_BINARY_LOCALE_GENERATION is set to "1", you can limit locales
# generated to the list provided by GLIBC_GENERATE_LOCALES. This is huge
# time-savior for developmental builds. Format: list of locale.encoding pairs
# with spaces as separators.
# GLIBC_GENERATE_LOCALES = "en_US.UTF-8 en_GB.UTF-8 de_DE.UTF-8"

# Uncomment this to select a particular major kernel version if the MACHINE setting
# supports more than one major kernel version. Currently this is suported by the
# following MACHINE types: poodle, tosa and simpad.
# MACHINE_KERNEL_VERSION = "2.6"

# Uncomment one of these to build packages during the build process.
# This is done automatically if you set DISTRO (see above)
# INHERIT = "package_ipk"
# INHERIT = "package_tar"

# Add the required image file system types below. Valid are 
# jffs2, tar(.gz|bz2), cpio(.gz), cramfs, ext2(.gz), ext3(.gz)
# squashfs, squashfs-lzma
IMAGE_FSTYPES = "jffs2 tar squashfs squashfs-lzma"

# Uncomment this if you want to keep the temporary rootfs
# diretory, this can be useful during development.
# (Note that this rootfs is NOT usuable as NFS export.)
# IMAGE_KEEPROOTFS = "1"

# Uncomment this to enable the use of ccache when building.  Due to
# the nature of our builds this is only helpful in cases when one
# is rebuilding a recipe or set of recipes, repeatedly.
# CCACHE = "${@bb.which(bb.data.getVar('PATH', d, 1), 'ccache') and 'ccache '}"

# Uncomment this to disable the parse cache (not recommended).
# CACHE = ""

# Uncomment this if you want BitBake to emit debugging output
# BBDEBUG = "yes"

# Use DEBUG_BUILD to build packages with DEBUG_OPTIMIZATION instead of
# FULL_OPTIMIZATION.
#
# DEBUG_BUILD = "1"

# If you want to have unstripped ready-to-debug binaries, set this to "no",
# although for debugging you can use automatically produced -dbg packages.
# If you need to have completely undebuggable builds, set this to "full",
# by default gnu.debuglink section is left in the binaries after stripping, so
# this might be useful if you want to have checksum-level binary consistency
# across successive builds.
# PACKAGE_STRIP = "no"

# Uncomment these to build a package such that you can use gprof to profile it.
# NOTE: This will only work with 'linux' targets, not
# 'linux-uclibc', as uClibc doesn't provide the necessary
# object files.  Also, don't build glibc itself with these
# flags, or it'll fail to build.
#
# PROFILE_OPTIMIZATION = "-pg"
# SELECTED_OPTIMIZATION = "${PROFILE_OPTIMIZATION}"
# LDFLAGS =+ "-pg"

# Uncomment this to enable parallel make.
# This allows make to spawn mutliple processes to take advantage of multiple 
# processors. Useful on SMP machines. This may break some packages - we're
# in the process of marking these so let us know if you find any.
# PARALLEL_MAKE = "-j 4"

# Uncomment to run multiple bitbake threads in parallel.
# Bitbake can do multiple jobs in parallel: Its a good idea make use of 
# all available resources: e.g. to download sources while some other
# piece of software is compiled.
# BB_NUMBER_THREADS = "2"

# Uncomment this if you want BitBake to emit the log if a build fails.
BBINCLUDELOGS = "yes"

# Specifies a location to search for pre-generated tarballs when fetching
# a cvs:// URI. Outcomment this, if you always want to pull directly from CVS.
#CVS_TARBALL_STASH = ""

# Uncomment this if you want to install shared libraries directly under their SONAME,
# rather than installing as the full version and symlinking to the SONAME.
# PACKAGE_SNAP_LIB_SYMLINKS = "1"

# EDIT THIS FILE and then remove the line below before using!
#REMOVE_THIS_LINE:="${@bb.fatal('Read the comments in your conf/local.conf')}"

--u65IjBhB3TIa72Vp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="log.do_compile.5315"
Content-Transfer-Encoding: quoted-printable

NOTE: make -j 5 ARCH_FLAGS_FOR_TARGET=3D-ml -m4 -isystem/opt/work/oe/openem=
bedded/tmp/sysroots/sh4-angstrom-linux/usr/include
make[1]: Entering directory `/opt/work/oe/openembedded/tmp/work/sh4-angstro=
m-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angs=
trom-linux'
mkdir -p -- ./fixincludes
mkdir -p -- build-x86_64-linux/libiberty
mkdir -p -- ./intl
mkdir -p -- build-x86_64-linux/fixincludes
Configuring in build-x86_64-linux/libiberty
Configuring in build-x86_64-linux/fixincludes
Configuring in ./intl
Configuring in ./fixincludes
mkdir -p -- ./libiberty
Configuring in ./libiberty
configure: creating cache ./config.cache
checking build system type... x86_64-pc-linux-gnu
checking host system type... x86_64-pc-linux-gnu
checking target system type... sh4-angstrom-linux-gnu
checking for x86_64-linux-gcc... gcc=20
checking for C compiler default output file name... configure: creating cac=
he ../config.cache
configure: loading site script /opt/work/oe/openembedded/site/endian-little
configure: loading site script /opt/work/oe/openembedded/site/common-linux
configure: loading site script /opt/work/oe/openembedded/site/endian-little
configure: loading site script /opt/work/oe/openembedded/site/common-glibc
configure: loading site script /opt/work/oe/openembedded/site/x86_64-linux
configure: loading site script /opt/work/oe/openembedded/site/common-linux
configure: loading site script /opt/work/oe/openembedded/site/common
configure: loading site script /opt/work/oe/openembedded/site/common-glibc
a.out
checking whether the C compiler works... configure: loading cache ../config=
.cache
configure: creating cache ./config.cache
configure: loading site script /opt/work/oe/openembedded/site/x86_64-linux
checking build system type... configure: loading site script /opt/work/oe/o=
penembedded/site/common
configure: creating cache ./config.cache
yes
checking whether we are cross compiling... no
checking for suffix of executables... checking whether to enable maintainer=
-specific portions of Makefiles... no
checking for makeinfo... makeinfo --split-size=3D5000000
checking whether to enable maintainer-specific portions of Makefiles... no
checking for makeinfo... makeinfo --split-size=3D5000000
checking for perl... perl
x86_64-pc-linux-gnu
checking host system type... checking whether make sets $(MAKE)... checking=
 for perl... perl
checking build system type...=20
checking for suffix of object files... x86_64-pc-linux-gnu
checking target system type... checking build system type... yes
checking for a BSD-compatible install... /opt/work/oe/openembedded/tmp/sysr=
oots/x86_64-linux/usr/bin/install -c
checking whether NLS is requested... yes
checking for msgfmt... /opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/=
usr/bin/msgfmt
checking for gmsgfmt... /opt/work/oe/openembedded/tmp/sysroots/x86_64-linux=
/usr/bin/msgfmt
x86_64-pc-linux-gnu
o
checking whether we are using the GNU C compiler... x86_64-pc-linux-gnu
sh4-angstrom-linux-gnu
checking for x86_64-linux-gcc... gcc=20
checking for xgettext... checking host system type... checking host system =
type... /opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/bin/xgettex=
t
checking for msgmerge... /opt/work/oe/openembedded/tmp/sysroots/x86_64-linu=
x/usr/bin/msgmerge
x86_64-pc-linux-gnu
checking for C compiler default output file name... x86_64-pc-linux-gnu
checking for x86_64-linux-gcc... gcc=20
checking for x86_64-linux-ar... ar
checking for x86_64-linux-ranlib... ranlib
checking for x86_64-linux-gcc... gcc=20
yes
checking whether gcc  accepts -g... checking for x86_64-linux-ar... ar
checking for x86_64-linux-ranlib... ranlib
checking for x86_64-linux-gcc... gcc=20
a.out
checking whether the C compiler works... yes
checking for C compiler default output file name... checking whether we are=
 cross compiling... no
checking for suffix of executables... yes
checking for gcc  option to accept ISO C89... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables...=20
checking for suffix of object files... none needed
checking for C compiler default output file name... checking for C compiler=
 default output file name... checking whether gcc  supports -W...=20
checking for suffix of object files... o
checking whether we are using the GNU C compiler... a.out
checking whether the C compiler works... a.out
checking whether the C compiler works... yes
yes
checking whether we are cross compiling... no
checking for suffix of executables... checking whether we are cross compili=
ng... no
checking for suffix of executables... o
checking whether we are using the GNU C compiler... yes
yes
checking whether gcc  accepts -g... checking whether gcc  supports -Wall...=
=20
checking for suffix of object files... yes
checking for gcc  option to accept ISO C89...=20
checking for suffix of object files... yes
yes
checking whether gcc  supports -Wwrite-strings... checking whether gcc  acc=
epts -g... o
checking whether we are using the GNU C compiler... o
checking whether we are using the GNU C compiler... none needed
yes
checking whether gcc  supports -W... checking whether gcc  supports -Wstric=
t-prototypes... yes
yes
checking whether gcc  accepts -g... checking whether gcc  accepts -g... yes
checking for gcc  option to accept ANSI C... yes
yes
checking whether gcc  supports -Wall... checking whether gcc  supports -Wmi=
ssing-prototypes... yes
checking for gcc  option to accept ANSI C... yes
checking for gcc  option to accept ANSI C... yes
yes
none needed
checking whether gcc  supports -Wold-style-definition... checking whether g=
cc  supports -Wwrite-strings... none needed
yes
none needed
yes
checking whether gcc  supports -Wmissing-format-attribute... checking build=
 system type... checking whether gcc  supports -Wstrict-prototypes... check=
ing how to run the C preprocessor... gcc -E
checking how to run the C preprocessor... gcc -E
x86_64-pc-linux-gnu
checking host system type... yes
checking whether gcc  supports -Wno-overlength-strings... yes
x86_64-pc-linux-gnu
checking whether gcc  supports -Wmissing-prototypes... checking for x86_64-=
linux-ranlib... ranlib
checking for library containing strerror... checking whether gcc  supports =
-W... yes
checking whether gcc  supports -pedantic -Wno-long-long... checking whether=
 gcc  supports -W... yes
checking whether gcc  supports -Wold-style-definition... yes
checking how to run the C preprocessor... gcc -E
yes
checking whether gcc  supports -Wall... none required
checking how to run the C preprocessor... gcc -E
checking for grep that handles long lines and -e... yes
/bin/grep
checking for egrep... /bin/grep -E
checking for ANSI C header files... checking whether gcc  supports -Wall...=
 yes
checking whether gcc  supports -Wmissing-format-attribute... yes
checking whether gcc  supports -Wwrite-strings... yes
checking whether gcc  supports -Wwrite-strings... checking for egrep... gre=
p -E
checking for ANSI C header files... yes
checking whether gcc  supports -Wno-overlength-strings... yes
checking whether gcc  supports -Wc++-compat... yes
yes
checking whether gcc  supports -pedantic -Wno-long-long... checking whether=
 gcc  supports -Wc++-compat... yes
yes
yes
checking how to run the C preprocessor... gcc -E
checking whether gcc  supports -Wstrict-prototypes... checking for sys/type=
s.h... yes
checking whether gcc  supports -Wstrict-prototypes... yes
checking for grep that handles long lines and -e... yes
/bin/grep
checking for egrep... checking for an ANSI C-conforming const... /bin/grep =
-E
checking for ANSI C header files... yes
yes
checking whether gcc  supports -pedantic ... checking whether gcc  supports=
 -pedantic ... checking for sys/stat.h... yes
checking for inline... yes
yes
checking whether gcc  and cc understand -c and -o together... yes
checking whether gcc  and cc understand -c and -o together... checking for =
stdlib.h... inline
checking for sys/types.h... yes
yes
checking for string.h... checking for sys/types.h... yes
checking for an ANSI C-conforming const... yes
checking for an ANSI C-conforming const... yes
yes
yes
checking for sys/stat.h... checking for memory.h... checking for sys/stat.h=
... yes
checking for inline... yes
checking for inline... yes
yes
inline
checking whether byte ordering is bigendian... inline
checking whether byte ordering is bigendian... (cached) no
checking for a BSD-compatible install... /opt/work/oe/openembedded/tmp/sysr=
oots/x86_64-linux/usr/bin/install -c
checking for stdlib.h... checking for stdlib.h... yes
checking for sys/file.h... checking for strings.h... yes
yes
yes
checking for string.h... yes
checking for sys/param.h... checking for string.h... checking for inttypes.=
h... no
checking for a BSD-compatible install... /opt/work/oe/openembedded/tmp/sysr=
oots/x86_64-linux/usr/bin/install -c
checking for sys/file.h... yes
yes
yes
checking for limits.h... checking for memory.h... yes
checking for stdint.h... yes
checking for memory.h... yes
checking for sys/param.h... checking for stdlib.h... yes
yes
checking for strings.h... yes
yes
checking for unistd.h... yes
checking for malloc.h... checking for strings.h... checking for limits.h...=
 yes
yes
yes
checking for inttypes.h... yes
checking for stdlib.h... checking stddef.h usability... yes
checking for string.h... checking for inttypes.h... yes
yes
yes
yes
checking stddef.h presence... checking for malloc.h... checking for stdint.=
h... checking for unistd.h... yes
yes
checking for stddef.h... yes
checking for stdint.h... checking for stdlib.h... (cached) yes
yes
yes
yes
checking for string.h... checking for strings.h... checking for strings.h..=
. (cached) yes
checking for unistd.h... checking for unistd.h... (cached) yes
yes
yes
checking for unistd.h... checking fcntl.h usability... yes
checking for sys/time.h... yes
checking for unistd.h... yes
checking stddef.h usability... yes
checking fcntl.h presence... checking for strings.h... yes
checking for fcntl.h... yes
yes
checking for time.h... yes
checking sys/file.h usability... yes
checking stddef.h presence... checking for sys/time.h... yes
yes
checking for off_t... yes
checking for stddef.h... yes
yes
checking for sys/resource.h... checking for stdlib.h... (cached) yes
yes
checking sys/file.h presence... checking for time.h... checking for strings=
.h... (cached) yes
yes
checking for sys/file.h... yes
yes
checking for size_t... checking for unistd.h... (cached) yes
checking for sys/stat.h... (cached) yes
yes
yes
checking fcntl.h usability... checking for sys/resource.h... checking for c=
learerr_unlocked... checking for sys/stat.h... yes
yes
checking for working alloca.h... yes
checking fcntl.h presence... checking for sys/stat.h... yes
yes
checking for sys/mman.h... yes
checking for fcntl.h... yes
checking for feof_unlocked... yes
checking sys/file.h usability... yes
yes
checking for alloca... checking for sys/mman.h... yes
checking for fcntl.h... checking for fcntl.h... yes
checking sys/file.h presence... yes
checking for ferror_unlocked... yes
yes
yes
checking for stdlib.h... (cached) yes
checking for sys/file.h... yes
yes
checking for alloca.h... checking for alloca.h... checking for sys/stat.h..=
. (cached) yes
checking for unistd.h... (cached) yes
yes
yes
yes
checking for clearerr_unlocked... checking for getpagesize... (cached) chec=
king for sys/pstat.h... yes
checking for fflush_unlocked... checking for sys/pstat.h... checking for wo=
rking mmap... (cached) yes
checking whether we are using the GNU C Library 2.1 or newer... yes
checking whether integer division by zero raises SIGFPE... no
no
checking for sys/sysmp.h... yes
checking for sys/sysmp.h... yes
checking for feof_unlocked... checking for fgetc_unlocked... no
yes
checking for inttypes.h... no
checking for sys/sysinfo.h... checking for sys/sysinfo.h... yes
yes
yes
yes
yes
checking for machine/hal_sysinfo.h... checking for ferror_unlocked... check=
ing for stdint.h... checking for machine/hal_sysinfo.h... checking for fget=
s_unlocked... no
checking for sys/table.h... yes
no
checking for unsigned long long... checking for sys/table.h... yes
no
yes
checking for sys/sysctl.h... no
checking for fflush_unlocked... checking for sys/sysctl.h... checking for f=
ileno_unlocked... yes
checking for inttypes.h... yes
yes
checking for sys/systemcfg.h... checking for sys/systemcfg.h... yes
yes
yes
checking whether the inttypes.h PRIxNN macros are broken... checking for fg=
etc_unlocked... no
checking for fprintf_unlocked... checking for stdint.h... no
checking for stdint.h... no
checking for ld used by GCC... ld
checking if the linker (ld) is GNU ld... yes
yes
yes
yes
checking for shared library run path origin... checking for fgets_unlocked.=
.. no
checking for stdio_ext.h... checking for stdio_ext.h... checking for fputc_=
unlocked... yes
done
yes
checking for sys/wait.h that is POSIX.1 compatible... checking for sys/wait=
.h that is POSIX.1 compatible... checking argz.h usability... yes
yes
checking for fputs_unlocked... checking for fileno_unlocked... yes
checking whether time.h and sys/time.h may both be included... yes
checking whether time.h and sys/time.h may both be included... yes
checking argz.h presence... yes
yes
checking for fread_unlocked... yes
checking for argz.h... yes
yes
yes
checking whether errno must be declared... checking whether errno must be d=
eclared... checking for fprintf_unlocked... checking limits.h usability... =
no
checking for egrep... grep -E
checking for ANSI C header files... no
checking for egrep... grep -E
checking for ANSI C header files... yes
no
checking for fputc_unlocked... yes
checking limits.h presence... checking for fwrite_unlocked... yes
checking for limits.h... yes
yes
checking locale.h usability... checking for fputs_unlocked... yes
checking for getchar_unlocked... yes
checking locale.h presence... yes
yes
checking for sys/types.h... yes
yes
checking for fread_unlocked... yes
checking for locale.h... yes
checking for sys/types.h... checking for getc_unlocked... yes
checking nl_types.h usability... checking for sys/stat.h... (cached) yes
yes
yes
checking for stdlib.h... (cached) checking for sys/stat.h... (cached) yes
yes
yes
checking for fwrite_unlocked... yes
checking nl_types.h presence... checking for stdlib.h... (cached) checking =
for string.h... (cached) yes
yes
checking for putchar_unlocked... checking for string.h... (cached) checking=
 for memory.h... yes
yes
checking for nl_types.h... yes
checking for memory.h... yes
yes
checking malloc.h usability... yes
checking for strings.h... (cached) yes
yes
checking for getchar_unlocked... checking for putc_unlocked... checking for=
 strings.h... (cached) checking for inttypes.h... yes
checking for inttypes.h... yes
checking malloc.h presence... yes
yes
yes
yes
checking whether abort is declared... checking for stdint.h... (cached) yes
checking for stdint.h... (cached) checking for getc_unlocked... yes
checking for malloc.h... yes
yes
checking for unistd.h... (cached) yes
checking for int... checking stddef.h usability... checking for unistd.h...=
 (cached) yes
checking for int... yes
checking whether asprintf is declared... yes
checking for putchar_unlocked... yes
checking stddef.h presence... yes
checking size of int... no
yes
checking size of int... (cached) 4
checking whether basename is declared... checking for uintptr_t... yes
yes
checking for stddef.h... yes
no
checking whether errno is declared... checking for putc_unlocked... checkin=
g for stdlib.h... (cached) yes
yes
checking for a 64-bit type... 4
checking for uintptr_t... no
checking whether vasprintf is declared... checking for string.h... (cached)=
 yes
yes
checking for unistd.h... (cached) uint64_t
checking for pid_t... yes
checking whether abort is declared... no
checking whether clearerr_unlocked is declared... checking sys/param.h usab=
ility... yes
checking for a 64-bit type... yes
checking whether asprintf is declared... yes
yes
checking whether feof_unlocked is declared... checking for library containi=
ng strerror... uint64_t
checking for pid_t... no
checking whether basename is declared... yes
checking sys/param.h presence... yes
checking whether ferror_unlocked is declared... yes
checking for sys/param.h... yes
none required
yes
no
checking whether errno is declared... checking for asprintf... checking for=
 library containing strerror... checking for feof_unlocked... yes
checking whether fflush_unlocked is declared... no
checking whether vasprintf is declared... yes
checking whether fgetc_unlocked is declared... yes
none required
checking for asprintf... checking for atexit... no
checking whether clearerr_unlocked is declared... yes
checking whether fgets_unlocked is declared... yes
checking for fgets_unlocked... yes
yes
checking whether feof_unlocked is declared... no
checking whether fileno_unlocked is declared... yes
checking for atexit... checking for basename... yes
yes
checking whether ferror_unlocked is declared... yes
checking whether fprintf_unlocked is declared... checking for getc_unlocked=
... yes
yes
checking for bcmp... yes
no
checking whether fflush_unlocked is declared... checking whether fputc_unlo=
cked is declared... checking for basename... yes
yes
checking whether fgetc_unlocked is declared... checking for getcwd... yes
checking whether fputs_unlocked is declared... yes
yes
checking for bcopy... checking for bcmp... yes
no
checking whether fgets_unlocked is declared... checking whether fread_unloc=
ked is declared... yes
checking for getegid... yes
checking for bsearch... no
yes
yes
checking whether fileno_unlocked is declared... checking whether fwrite_unl=
ocked is declared... checking for bcopy... yes
yes
checking whether getchar_unlocked is declared... yes
checking whether fprintf_unlocked is declared... checking for geteuid... ye=
s
yes
yes
checking whether getc_unlocked is declared... no
checking whether fputc_unlocked is declared... checking for bzero... checki=
ng for bsearch... yes
checking whether putchar_unlocked is declared... yes
yes
checking for getgid... checking whether fputs_unlocked is declared... yes
yes
checking whether putc_unlocked is declared... yes
checking for calloc... checking for bzero... no
checking whether fread_unlocked is declared... yes
yes
checking for an ANSI C-conforming const... yes
checking whether fwrite_unlocked is declared... checking for getuid... yes
yes
yes
checking sys/mman.h usability... checking for calloc... checking for clock.=
.. yes
checking whether getchar_unlocked is declared... yes
checking sys/mman.h presence... yes
yes
checking for mempcpy... yes
checking for sys/mman.h... yes
checking for mmap... checking for clock... yes
yes
checking whether getc_unlocked is declared... checking for ffs... yes
checking whether read-only mmap of a plain file works... yes
checking whether mmap from /dev/zero works... yes
checking for MAP_ANON(YMOUS)... yes
checking whether putchar_unlocked is declared... yes
checking for munmap... yes
yes
checking whether mmap with MAP_ANON(YMOUS) works... yes
checking whether to enable maintainer-specific portions of Makefiles... no
checking for ffs... yes
yes
configure: updating cache ./config.cache
checking whether putc_unlocked is declared... checking for getcwd... config=
ure: creating ./config.status
yes
yes
yes
checking for putenv... checking for an ANSI C-conforming const... checking =
for getcwd... yes
checking for getpagesize... (cached) yes
yes
checking sys/mman.h usability... checking for gettimeofday... yes
checking for setenv... yes
checking for getpagesize... yes
checking sys/mman.h presence... yes
yes
checking for sys/mman.h... yes
checking for mmap... checking for index... yes
yes
checking for setlocale... checking for gettimeofday... yes
checking whether read-only mmap of a plain file works... yes
checking whether mmap from /dev/zero works... yes
checking for MAP_ANON(YMOUS)... config.status: creating Makefile
yes
config.status: creating mkheaders.almost
yes
checking whether mmap with MAP_ANON(YMOUS) works... yes
yes
yes
checking for insque... checking whether to enable maintainer-specific porti=
ons of Makefiles... no
config.status: creating config.h
checking for index... checking for stpcpy... configure: updating cache ../c=
onfig.cache
configure: creating ./config.status
yes
yes
yes
checking for memchr... mkdir -p -- ./libdecnumber
checking for insque... checking for strcasecmp... Configuring in ./libdecnu=
mber
yes
checking for memchr... yes
yes
checking for memcmp... checking for strdup... yes
checking for memcmp... yes
yes
checking for memcpy... (cached) yes
checking for strtoul... checking for memmove... config.status: creating Mak=
efile
yes
checking for memcpy... config.status: creating mkheaders.almost
yes
config.status: creating config.h
checking for tsearch... yes
checking for mempcpy... yes
checking for memmove... yes
checking for __argz_count... yes
checking for memset... yes
checking for mempcpy... yes
checking for __argz_stringify... yes
checking for mkstemps... yes
checking for memset... yes
checking for __argz_next... yes
checking for putenv... configure: loading site script /opt/work/oe/openembe=
dded/site/endian-little
configure: loading site script /opt/work/oe/openembedded/site/common-linux
configure: loading site script /opt/work/oe/openembedded/site/common-glibc
configure: loading site script /opt/work/oe/openembedded/site/x86_64-linux
yes
configure: loading site script /opt/work/oe/openembedded/site/common
configure: creating cache ./config.cache
checking for mkstemps... checking whether make sets $(MAKE)... yes
yes
checking for x86_64-linux-gcc... gcc=20
yes
checking for __fsetlocking... checking for random... yes
checking for putenv... checking for C compiler default output file name... =
yes
checking for iconv... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables... yes
yes
checking for random...=20
checking for suffix of object files... checking for rename... o
checking whether we are using the GNU C compiler... yes
checking for iconv declaration... yes
yes
checking for rindex... yes
checking whether gcc  accepts -g...=20
         extern size_t iconv (iconv_t cd, char * *inbuf, size_t *inbyteslef=
t, char * *outbuf, size_t *outbytesleft);
checking for nl_langinfo and CODESET... checking for rename... yes
checking for gcc  option to accept ANSI C... yes
yes
yes
checking for LC_MESSAGES... checking for setenv... checking for rindex... n=
one needed
yes
checking for bison... bison
checking version of bison... checking for x86_64-linux-ranlib... ranlib
2.3, ok
checking whether NLS is requested... yes
checking whether included gettext is requested... no
checking for GNU gettext in libc... checking for aclocal... aclocal
checking for autoconf... autoconf
checking for autoheader... autoheader
checking whether gcc  supports -W... yes
yes
checking for snprintf... checking for setenv... yes
checking whether to use NLS... yes
checking where the gettext function comes from... libc
yes
checking whether gcc  supports -Wall... checking for aclocal... aclocal
checking for autoconf... autoconf
checking for autoheader... autoheader
yes
yes
updating cache ./config.cache
configure: creating ./config.status
checking for snprintf... checking for sigsetmask... yes
checking whether gcc  supports -Wwrite-strings... yes
yes
yes
checking whether gcc  supports -Wstrict-prototypes... checking for stpcpy..=
. checking for sigsetmask... yes
checking whether gcc  supports -Wmissing-prototypes... yes
yes
checking for stpncpy... checking for stpcpy... yes
checking whether gcc  supports -Wold-style-definition... yes
yes
checking for stpncpy... checking for strcasecmp... yes
checking whether gcc  supports -Wmissing-format-attribute... config.status:=
 creating Makefile
yes
yes
yes
config.status: creating config.intl
checking whether gcc  supports -Wcast-qual... checking for strchr... checki=
ng for strcasecmp... config.status: creating config.h
yes
checking whether gcc  supports -pedantic -Wno-long-long... yes
yes
checking for strdup... checking for strchr... yes
checking how to run the C preprocessor... gcc -E
config.status: executing default-1 commands
yes
checking for egrep... grep -E
checking for ANSI C header files... yes
checking for strncasecmp... checking for strdup... yes
yes
checking for strncasecmp... checking for strndup... mkdir -p -- ./gcc
Configuring in ./gcc
make[2]: Entering directory `/opt/work/oe/openembedded/tmp/work/sh4-angstro=
m-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angs=
trom-linux/intl'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angst=
rom-linux/intl'
yes
yes
checking for sys/types.h... yes
checking for strndup... checking for strrchr... yes
checking for sys/stat.h... yes
yes
checking for strstr... checking for strrchr... yes
checking for stdlib.h... yes
yes
checking for strtod... checking for strstr... yes
checking for string.h... yes
yes
checking for strtol... yes
checking for strtod... checking for memory.h... yes
checking for strtoul... yes
yes
checking for strings.h... checking for strtol... yes
checking for strtoul... yes
yes
checking for strverscmp... checking for inttypes.h... yes
yes
checking for strverscmp... yes
configure: loading site script /opt/work/oe/openembedded/site/endian-little
configure: loading site script /opt/work/oe/openembedded/site/common-linux
configure: loading site script /opt/work/oe/openembedded/site/common-glibc
configure: loading site script /opt/work/oe/openembedded/site/x86_64-linux
configure: loading site script /opt/work/oe/openembedded/site/common
checking for tmpnam... checking for stdint.h... configure: creating cache .=
/config.cache
checking build system type... yes
yes
checking for tmpnam... x86_64-pc-linux-gnu
checking for unistd.h... yes
checking host system type... checking for vasprintf... yes
x86_64-pc-linux-gnu
checking for vasprintf... yes
checking target system type... checking ctype.h usability... yes
sh4-angstrom-linux-gnu
checking for vfprintf... checking LIBRARY_PATH variable... ok
checking GCC_EXEC_PREFIX variable... ok
checking whether to place generated files in the source directory... no
checking whether a default linker was specified... no
checking whether a default assembler was specified... no
checking for x86_64-linux-gcc... gcc=20
yes
yes
checking ctype.h presence... checking for vfprintf... yes
checking for ctype.h... checking for C compiler default output file name...=
 yes
yes
checking stddef.h usability... a.out
checking whether the C compiler works... checking for vprintf... yes
checking whether we are cross compiling... no
checking for suffix of executables... yes

yes
checking stddef.h presence... checking for vprintf... checking for suffix o=
f object files... yes
yes
checking for stddef.h... yes
checking for vsnprintf... yes
checking for string.h... (cached) yes
o
checking whether we are using the GNU C compiler... checking for vsnprintf.=
.. checking stdio.h usability... yes
checking whether gcc  accepts -g... yes
yes
checking stdio.h presence... yes
checking for vsprintf... checking for vsprintf... yes
checking for stdio.h... yes
yes
checking for gcc  option to accept ANSI C... looking for a compliant stdint=
.h in stdint.h, checking for uintmax_t... yes
yes
none needed
yes
checking for uintptr_t... checking for waitpid... checking for waitpid... c=
hecking whether gcc  and cc understand -c and -o together... yes
checking for int_least32_t... yes
checking whether alloca needs Cray hooks... yes
checking whether alloca needs Cray hooks... no
checking stack direction for C alloca... yes
checking for int_fast32_t... no
checking stack direction for C alloca... yes
checking how to run the C preprocessor... gcc -E
yes
checking for uint64_t... -1
-1
checking for unistd.h... (cached) yes
checking for unistd.h... (cached) yes
checking for vfork.h... checking for inline... checking for vfork.h... yes
checking what to include in gstdint.h... stdint.h (already complete)
checking for an ANSI C-conforming const... no
no
checking for fork... checking for fork... inline
checking for egrep... grep -E
checking for ANSI C header files... yes
checking for off_t... yes
yes
yes
checking for int... checking for vfork... checking for vfork... yes
checking size of int... (cached) 4
checking for long... yes
yes
yes
checking for working fork... checking for sys/types.h... checking for worki=
ng fork... yes
checking size of long... (cached) 8
checking for ANSI C header files... (cached) yes
yes
checking for working vfork... (cached) yes
yes
checking for working vfork... (cached) yes
yes
checking for _doprnt... checking for _doprnt... checking for sys/stat.h... =
checking build system type... x86_64-pc-linux-gnu
checking host system type... yes
checking for stdlib.h... no
checking for sys_errlist... no
checking for sys_errlist... x86_64-pc-linux-gnu
checking target system type... sh4-angstrom-linux-gnu
yes
yes
checking for decimal floating point... dpd
checking whether byte ordering is bigendian... (cached) no
yes
checking for sys_nerr... checking for sys_nerr... checking for string.h... =
updating cache ./config.cache
configure: creating ./config.status
yes
yes
yes
checking for sys_siglist... checking for memory.h... checking for sys_sigli=
st... yes
yes
yes
checking for external symbol _system_configuration... checking for external=
 symbol _system_configuration... checking for strings.h... no
no
checking for getrusage... checking for getrusage... yes
checking for inttypes.h... yes
checking for on_exit... yes
yes
config.status: creating Makefile
checking for on_exit... checking for stdint.h... config.status: creating co=
nfig.h
yes
checking for psignal... yes
yes
config.status: executing gstdint.h commands
checking for unistd.h... checking for psignal... yes
checking for strerror... (cached) yes
checking for strsignal... yes
yes
checking for void *... checking for strerror... yes
checking for sysconf... yes
checking size of void *... (cached) 8
checking for short... yes
checking for strsignal... yes
checking for times... yes
checking size of short... (cached) 2
checking for int... make[2]: Entering directory `/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/build.x=
86_64-linux.sh4-angstrom-linux/libdecnumber'
source=3D'/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/libdecnumber/decNumber.c' object=3D'decNumber.=
o' libtool=3Dno gcc   -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libdecnumber -I.  -isystem/opt/w=
ork/oe/openembedded/tmp/sysroots/x86_64-linux/usr/include -O2 -g -W -Wall -=
Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definit=
ion -Wmissing-format-attribute -Wcast-qual -pedantic -Wno-long-long  -I/opt=
/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r=
14.1/gcc-4.3.3/libdecnumber -I.  -c /opt/work/oe/openembedded/tmp/work/sh4-=
angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libdecnumber/decNumb=
er.c
source=3D'/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/libdecnumber/decContext.c' object=3D'decContex=
t.o' libtool=3Dno gcc   -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-l=
inux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libdecnumber -I.  -isystem/opt=
/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/include -O2 -g -W -Wall=
 -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-defin=
ition -Wmissing-format-attribute -Wcast-qual -pedantic -Wno-long-long  -I/o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libdecnumber -I.  -c /opt/work/oe/openembedded/tmp/work/sh=
4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libdecnumber/decCo=
ntext.c
yes
source=3D'/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/libdecnumber/dpd/decimal32.c' object=3D'decima=
l32.o' libtool=3Dno gcc   -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libdecnumber -I.  -isystem/o=
pt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/include -O2 -g -W -Wa=
ll -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition -Wmissing-format-attribute -Wcast-qual -pedantic -Wno-long-long  -I=
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/libdecnumber -I.  -c /opt/work/oe/openembedded/tmp/work/=
sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libdecnumber/dpd=
/decimal32.c
checking for sysconf... yes
checking size of int... (cached) 4
checking for long... yes
checking for sbrk... yes
checking size of long... (cached) 8
source=3D'/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/libdecnumber/dpd/decimal64.c' object=3D'decima=
l64.o' libtool=3Dno gcc   -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libdecnumber -I.  -isystem/o=
pt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/include -O2 -g -W -Wa=
ll -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-def=
inition -Wmissing-format-attribute -Wcast-qual -pedantic -Wno-long-long  -I=
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/libdecnumber -I.  -c /opt/work/oe/openembedded/tmp/work/=
sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libdecnumber/dpd=
/decimal64.c
checking for long long... yes
checking for times... yes
yes
checking for long long... (cached) yes
checking size of long long... (cached) 8
checking for __int64... checking for gettimeofday... (cached) yes
source=3D'/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/libdecnumber/dpd/decimal128.c' object=3D'decim=
al128.o' libtool=3Dno gcc   -I/opt/work/oe/openembedded/tmp/work/sh4-angstr=
om-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libdecnumber -I.  -isystem=
/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/include -O2 -g -W -=
Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-d=
efinition -Wmissing-format-attribute -Wcast-qual -pedantic -Wno-long-long  =
-I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4=
.3.3-r14.1/gcc-4.3.3/libdecnumber -I.  -c /opt/work/oe/openembedded/tmp/wor=
k/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libdecnumber/d=
pd/decimal128.c
yes
checking for realpath... checking for sbrk... no
checking whether gcc  supports -W... yes
yes
checking for canonicalize_file_name... checking whether gcc  supports -Wall=
... yes
checking for gettimeofday... (cached) yes
checking for realpath... yes
yes
checking for pstat_getstatic... checking whether gcc  supports -Wwrite-stri=
ngs... yes
checking for canonicalize_file_name... yes
no
checking whether gcc  supports -Wstrict-prototypes... checking for pstat_ge=
tdynamic... rm -f libdecnumber.a
ar cru libdecnumber.a decNumber.o decContext.o decimal32.o decimal64.o deci=
mal128.o=20
ranlib libdecnumber.a
make[2]: Leaving directory `/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angst=
rom-linux/libdecnumber'
yes
yes
no
checking whether gcc  supports -Wmissing-prototypes... checking for pstat_g=
etstatic... checking for sysmp... yes
checking whether gcc  supports -Wc++-compat... no
no
checking for pstat_getdynamic... checking for getsysinfo... yes
no
checking whether gcc  supports -Wold-style-definition... checking for sysmp=
... no
checking for table... yes
no
checking whether gcc  supports -Wmissing-format-attribute... checking for g=
etsysinfo... no
checking for sysctl... yes
checking whether gcc  supports -pedantic -Wno-long-long -Wno-variadic-macro=
s 				     -Wno-overlength-strings... no
checking for table... yes
checking valgrind.h usability... yes
checking for wait3... no
checking valgrind.h presence... no
checking for sysctl... no
checking for valgrind.h... no
yes
checking for wait4... configure: WARNING: fixed-point is not supported for =
this target
checking whether make sets $(MAKE)... yes
checking for wait3... yes
checking for gawk... gawk
checking whether ln -s works... yes
checking whether ln works... yes
checking for x86_64-linux-ranlib... ranlib
checking for a BSD compatible install... /opt/work/oe/openembedded/tmp/sysr=
oots/x86_64-linux/usr/bin/install -c
checking for cmp's capabilities... gnucompare
checking for mktemp... yes
checking for makeinfo... makeinfo --split-size=3D5000000
checking for modern makeinfo... yes
checking for recent Pod::Man... yes
yes
checking for __fsetlocking... checking for wait4... yes
checking for flex... flex
checking for bison... bison
checking for nm... nm
checking for ar... ar
checking for GNU C library... yes
yes
checking whether basename is declared... checking for ANSI C header files..=
. (cached) yes
checking whether time.h and sys/time.h may both be included... yes
checking for __fsetlocking... yes
checking whether string.h and strings.h may both be included... no
checking whether ffs is declared... yes
checking for sys/wait.h that is POSIX.1 compatible... yes
checking whether basename is declared... yes
checking whether asprintf is declared... no
checking whether ffs is declared... yes
no
checking whether vasprintf is declared... checking for limits.h... no
checking whether snprintf is declared... yes
yes
checking whether asprintf is declared... checking for stddef.h... no
checking whether vasprintf is declared... yes
checking whether vsnprintf is declared... yes
checking for string.h... (cached) yes
no
checking whether snprintf is declared... yes
checking whether calloc is declared... checking for strings.h... (cached) y=
es
checking for stdlib.h... (cached) yes
yes
checking whether vsnprintf is declared... checking for time.h... yes
checking whether getenv is declared... yes
checking for iconv.h... yes
checking whether calloc is declared... yes
checking whether getopt is declared... yes
checking for fcntl.h... yes
checking whether getenv is declared... yes
yes
checking whether malloc is declared... checking for unistd.h... (cached) ye=
s
yes
checking whether getopt is declared... checking for sys/file.h... yes
checking whether realloc is declared... yes
yes
checking whether malloc is declared... checking for sys/time.h... yes
yes
checking whether sbrk is declared... yes
checking whether realloc is declared... checking for sys/mman.h... yes
checking for sys/resource.h... yes
checking whether strverscmp is declared... yes
checking whether sbrk is declared... yes
no
checking whether canonicalize_file_name must be declared... checking for sy=
s/param.h... yes
checking whether strverscmp is declared... yes
yes
checking for sys/times.h... checking for stdlib.h... (cached) yes
checking for unistd.h... (cached) yes
no
yes
checking whether canonicalize_file_name must be declared... checking for ge=
tpagesize... (cached) checking for sys/stat.h... (cached) yes
yes
checking for working mmap... (cached) yes
yes
checking for direct.h... checking for working strncmp... checking for stdli=
b.h... (cached) yes
checking for unistd.h... (cached) yes
no
checking for malloc.h... checking for getpagesize... (cached) yes
yes
checking for working mmap... updating cache ./config.cache
configure: creating ./config.status
yes
checking for langinfo.h... yes
yes
checking for working strncmp... checking for ldfcn.h... no
checking for locale.h... yes
updating cache ../config.cache
configure: creating ./config.status
yes
checking for wchar.h... yes
checking for thread.h... no
checking for pthread.h... yes
checking for CHAR_BIT... yes
checking whether byte ordering is bigendian... (cached) no
checking for collect2 libraries... config.status: creating Makefile
config.status: creating testsuite/Makefile
config.status: creating config.h
config.status: creating Makefile
none required
checking for library containing exc_resume... config.status: creating tests=
uite/Makefile
config.status: executing default commands
config.status: creating config.h
no
checking for library containing ldexp... config.status: executing default c=
ommands
none required
checking for inttypes.h... yes
checking for times... mkdir -p -- ./libcpp
Configuring in ./libcpp
make[2]: Entering directory `/opt/work/oe/openembedded/tmp/work/sh4-angstro=
m-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angs=
trom-linux/libiberty'
if [ x"" !=3D x ] && [ ! -d pic ]; then \
	  mkdir pic; \
	else true; fi
touch stamp-picdir
rm -f needed-list; touch needed-list; \
	for f in atexit calloc memchr memcmp memcpy memmove memset rename strchr s=
trerror strncmp strrchr strstr strtol strtoul tmpnam vfprintf vprintf vfork=
 waitpid bcmp bcopy bzero; do \
	  for g in  ; do \
	    case "$g" in \
	      *$f*) echo $g >> needed-list ;; \
	    esac; \
	  done; \
	done
echo ./regex.o ./cplus-dem.o ./cp-demangle.o ./md5.o ./alloca.o ./argv.o ./=
choose-temp.o ./concat.o ./cp-demint.o ./dyn-string.o ./fdmatch.o ./fibheap=
.o ./filename_cmp.o ./floatformat.o ./fnmatch.o ./fopen_unlocked.o ./getopt=
.o ./getopt1.o ./getpwd.o ./getruntime.o ./hashtab.o ./hex.o ./lbasename.o =
./lrealpath.o ./make-relative-prefix.o ./make-temp-file.o ./objalloc.o ./ob=
stack.o ./partition.o ./pexecute.o ./physmem.o ./pex-common.o ./pex-one.o .=
/pex-unix.o ./safe-ctype.o ./sort.o ./spaces.o ./splay-tree.o ./strerror.o =
./strsignal.o ./unlink-if-ordinary.o ./xatexit.o ./xexit.o ./xmalloc.o ./xm=
emdup.o ./xstrdup.o ./xstrerror.o ./xstrndup.o > required-list
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/regex.c -o pic/regex.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/regex.c -o regex.o
make[3]: Entering directory `/opt/work/oe/openembedded/tmp/work/sh4-angstro=
m-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angs=
trom-linux/libiberty/testsuite'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angst=
rom-linux/libiberty/testsuite'
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/cplus-dem.c -o pic/cplus-dem.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/cplus-dem.c -o cplus-dem.o
yes
checking for clock... make[2]: Entering directory `/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/build=
.x86_64-linux.sh4-angstrom-linux/build-x86_64-linux/libiberty'
if [ x"" !=3D x ] && [ ! -d pic ]; then \
	  mkdir pic; \
	else true; fi
touch stamp-picdir
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/safe-ctype.c -o pic/safe-ctype.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/safe-ctype.c -o safe-ctype.o
yes
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/sort.c -o pic/sort.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/sort.c -o sort.o
checking for kill... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/spaces.c -o pic/spaces.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/spaces.c -o spaces.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/splay-tree.c -o pic/splay-tree.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/splay-tree.c -o splay-tree.o
yes
checking for getrlimit... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/strerror.c -o pic/strerror.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/strerror.c -o strerror.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/strsignal.c -o pic/strsignal.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/strsignal.c -o strsignal.o
yes
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/cp-demangle.c -o pic/cp-demangle.o; \
	else true; fi
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/unlink-if-ordinary.c -o pic/unlink-if-ordinary.o=
; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/unlink-if-ordinary.c -o unlink-if-ordinary.o
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/cp-demangle.c -o cp-demangle.o
checking for setrlimit... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/xatexit.c -o pic/xatexit.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/xatexit.c -o xatexit.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/xexit.c -o pic/xexit.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/xexit.c -o xexit.o
yes
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/xmalloc.c -o pic/xmalloc.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/xmalloc.c -o xmalloc.o
checking for atoll... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/xmemdup.c -o pic/xmemdup.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/xmemdup.c -o xmemdup.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/xstrdup.c -o pic/xstrdup.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/xstrdup.c -o xstrdup.o
yes
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/xstrerror.c -o pic/xstrerror.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/xstrerror.c -o xstrerror.o
checking for atoq... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/xstrndup.c -o pic/xstrndup.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/xstrndup.c -o xstrndup.o
rm -f needed-list; touch needed-list; \
	for f in atexit calloc memchr memcmp memcpy memmove memset rename strchr s=
trerror strncmp strrchr strstr strtol strtoul tmpnam vfprintf vprintf vfork=
 waitpid bcmp bcopy bzero; do \
	  for g in  ; do \
	    case "$g" in \
	      *$f*) echo $g >> needed-list ;; \
	    esac; \
	  done; \
	done
no
echo ./regex.o ./cplus-dem.o ./cp-demangle.o ./md5.o ./alloca.o ./argv.o ./=
choose-temp.o ./concat.o ./cp-demint.o ./dyn-string.o ./fdmatch.o ./fibheap=
.o ./filename_cmp.o ./floatformat.o ./fnmatch.o ./fopen_unlocked.o ./getopt=
.o ./getopt1.o ./getpwd.o ./getruntime.o ./hashtab.o ./hex.o ./lbasename.o =
./lrealpath.o ./make-relative-prefix.o ./make-temp-file.o ./objalloc.o ./ob=
stack.o ./partition.o ./pexecute.o ./physmem.o ./pex-common.o ./pex-one.o .=
/pex-unix.o ./safe-ctype.o ./sort.o ./spaces.o ./splay-tree.o ./strerror.o =
./strsignal.o ./unlink-if-ordinary.o ./xatexit.o ./xexit.o ./xmalloc.o ./xm=
emdup.o ./xstrdup.o ./xstrerror.o ./xstrndup.o > required-list
checking for sysconf... make[3]: Entering directory `/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/bui=
ld.x86_64-linux.sh4-angstrom-linux/build-x86_64-linux/libiberty/testsuite'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angst=
rom-linux/build-x86_64-linux/libiberty/testsuite'
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/regex.c -o pic/regex.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/regex.c -o regex.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/md5.c -o pic/md5.o; \
	else true; fi
configure: loading site script /opt/work/oe/openembedded/site/endian-little
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/md5.c -o md5.o
configure: loading site script /opt/work/oe/openembedded/site/common-linux
configure: loading site script /opt/work/oe/openembedded/site/common-glibc
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/alloca.c -o pic/alloca.o; \
	else true; fi
configure: loading site script /opt/work/oe/openembedded/site/x86_64-linux
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/alloca.c -o alloca.o
configure: loading site script /opt/work/oe/openembedded/site/common
configure: creating cache ./config.cache
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/argv.c -o pic/argv.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/argv.c -o argv.o
yes
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/cplus-dem.c -o pic/cplus-dem.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/cplus-dem.c -o cplus-dem.o
checking for strsignal... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/choose-temp.c -o pic/choose-temp.o; \
	else true; fi
checking build system type... gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/=
openembedded/tmp/sysroots/x86_64-linux/usr/include -O2 -g -I. -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Wstric=
t-prototypes -pedantic  /opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/choose-temp.c -o choos=
e-temp.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/concat.c -o pic/concat.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/concat.c -o concat.o
x86_64-pc-linux-gnu
checking host system type... yes
x86_64-pc-linux-gnu
checking for getrusage... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/cp-demint.c -o pic/cp-demint.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/cp-demint.c -o cp-demint.o
checking target system type... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/dyn-string.c -o pic/dyn-string.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/dyn-string.c -o dyn-string.o
sh4-angstrom-linux-gnu
checking whether make sets $(MAKE)... yes
checking for nl_langinfo... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/fdmatch.c -o pic/fdmatch.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/fdmatch.c -o fdmatch.o
yes
checking for a BSD-compatible install... /opt/work/oe/openembedded/tmp/sysr=
oots/x86_64-linux/usr/bin/install -c
checking for x86_64-linux-gcc... gcc=20
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/fibheap.c -o pic/fibheap.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/fibheap.c -o fibheap.o
checking for C compiler default output file name... yes
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/filename_cmp.c -o pic/filename_cmp.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/filename_cmp.c -o filename_cmp.o
checking for scandir... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/floatformat.c -o pic/floatformat.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/floatformat.c -o floatformat.o
a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables...=20
checking for suffix of object files... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/fnmatch.c -o pic/fnmatch.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/fnmatch.c -o fnmatch.o
yes
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/fopen_unlocked.c -o pic/fopen_unlocked.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/fopen_unlocked.c -o fopen_unlocked.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/cp-demangle.c -o pic/cp-demangle.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/cp-demangle.c -o cp-demangle.o
checking for alphasort... o
checking whether we are using the GNU C compiler... if [ x"" !=3D x ]; then=
 \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/getopt.c -o pic/getopt.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/getopt.c -o getopt.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/getopt1.c -o pic/getopt1.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/getopt1.c -o getopt1.o
yes
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/getpwd.c -o pic/getpwd.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/getpwd.c -o getpwd.o
yes
checking whether gcc  accepts -g... checking for gettimeofday... if [ x"" !=
=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/getruntime.c -o pic/getruntime.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/getruntime.c -o getruntime.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/hashtab.c -o pic/hashtab.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/hashtab.c -o hashtab.o
yes
checking for gcc  option to accept ANSI C... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/md5.c -o pic/md5.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/md5.c -o md5.o
yes
checking for mbstowcs... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/hex.c -o pic/hex.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/hex.c -o hex.o
none needed
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/lbasename.c -o pic/lbasename.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/lbasename.c -o lbasename.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/lrealpath.c -o pic/lrealpath.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/lrealpath.c -o lrealpath.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/alloca.c -o pic/alloca.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/alloca.c -o alloca.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/make-relative-prefix.c -o pic/make-relative-pref=
ix.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/make-relative-prefix.c -o make-relative-prefix.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/make-temp-file.c -o pic/make-temp-file.o; \
	else true; fi
checking for x86_64-linux-ranlib... ranlib
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/make-temp-file.c -o make-temp-file.o
checking for aclocal... aclocal
checking for autoconf... autoconf
checking for autoheader... autoheader
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/argv.c -o pic/argv.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/argv.c -o argv.o
checking whether gcc  supports -W... yes
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/objalloc.c -o pic/objalloc.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/objalloc.c -o objalloc.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/obstack.c -o pic/obstack.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/obstack.c -o obstack.o
checking for wcswidth... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/partition.c -o pic/partition.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/partition.c -o partition.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/pexecute.c -o pic/pexecute.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/pexecute.c -o pexecute.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/choose-temp.c -o pic/choose-temp.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/choose-temp.c -o choose-temp.o
yes
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/physmem.c -o pic/physmem.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/physmem.c -o physmem.o
checking whether gcc  supports -Wall... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/concat.c -o pic/concat.o; \
	else true; fi
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/pex-common.c -o pic/pex-common.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/pex-common.c -o pex-common.o
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/concat.c -o concat.o
yes
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/pex-one.c -o pic/pex-one.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/pex-one.c -o pex-one.o
checking for mmap... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/cp-demint.c -o pic/cp-demint.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/cp-demint.c -o cp-demint.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/pex-unix.c -o pic/pex-unix.o; \
	else true; fi
yes
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/pex-unix.c -o pex-unix.o
checking whether gcc  supports -Wwrite-strings... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/dyn-string.c -o pic/dyn-string.o; \
	else true; fi
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/safe-ctype.c -o pic/safe-ctype.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/dyn-string.c -o dyn-string.o
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/safe-ctype.c -o safe-ctype.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/sort.c -o pic/sort.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/sort.c -o sort.o
yes
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/spaces.c -o pic/spaces.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/spaces.c -o spaces.o
checking whether gcc  supports -Wstrict-prototypes... if [ x"" !=3D x ]; th=
en \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/splay-tree.c -o pic/splay-tree.o; \
	else true; fi
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/fdmatch.c -o pic/fdmatch.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/splay-tree.c -o splay-tree.o
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/fdmatch.c -o fdmatch.o
yes
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/strerror.c -o pic/strerror.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/strerror.c -o strerror.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/fibheap.c -o pic/fibheap.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/fibheap.c -o fibheap.o
checking for mincore... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/strsignal.c -o pic/strsignal.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/strsignal.c -o strsignal.o
yes
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/filename_cmp.c -o pic/filename_cmp.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/filename_cmp.c -o filename_cmp.o
checking whether gcc  supports -Wmissing-prototypes... if [ x"" !=3D x ]; t=
hen \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/unlink-if-ordinary.c -o pic/unlink-if-ordinary.o=
; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/unlink-if-ordinary.c -o unlink-if-ordinary.o
yes
checking for setlocale... yes
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/floatformat.c -o pic/floatformat.o; \
	else true; fi
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/xatexit.c -o pic/xatexit.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/xatexit.c -o xatexit.o
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/floatformat.c -o floatformat.o
checking whether gcc  supports -Wold-style-definition... if [ x"" !=3D x ];=
 then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/xexit.c -o pic/xexit.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/xexit.c -o xexit.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/xmalloc.c -o pic/xmalloc.o; \
	else true; fi
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/xmemdup.c -o pic/xmemdup.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/xmalloc.c -o xmalloc.o
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/xmemdup.c -o xmemdup.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/fnmatch.c -o pic/fnmatch.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/fnmatch.c -o fnmatch.o
yes
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/fopen_unlocked.c -o pic/fopen_unlocked.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/fopen_unlocked.c -o fopen_unlocked.o
checking whether gcc  supports -Wmissing-format-attribute... if [ x"" !=3D =
x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/xstrdup.c -o pic/xstrdup.o; \
	else true; fi
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/xstrerror.c -o pic/xstrerror.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/xstrerror.c -o xstrerror.o
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/xstrdup.c -o xstrdup.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/getopt.c -o pic/getopt.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/getopt.c -o getopt.o
yes
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/xstrndup.c -o pic/xstrndup.o; \
	else true; fi
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/getopt1.c -o pic/getopt1.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/xstrndup.c -o xstrndup.o
checking for clearerr_unlocked... gcc  -c -DHAVE_CONFIG_H -isystem/opt/work=
/oe/openembedded/tmp/sysroots/x86_64-linux/usr/include -O2 -g -I. -I/opt/wo=
rk/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.=
1/gcc-4.3.3/libiberty/../include  -W -Wall -Wwrite-strings -Wc++-compat -Ws=
trict-prototypes -pedantic  /opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/getopt1.c -o getop=
t1.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/getpwd.c -o pic/getpwd.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/getpwd.c -o getpwd.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/getruntime.c -o pic/getruntime.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/getruntime.c -o getruntime.o
rm -f ./libiberty.a pic/./libiberty.a
ar rc ./libiberty.a \
	  ./regex.o ./cplus-dem.o ./cp-demangle.o ./md5.o ./alloca.o ./argv.o ./ch=
oose-temp.o ./concat.o ./cp-demint.o ./dyn-string.o ./fdmatch.o ./fibheap.o=
 ./filename_cmp.o ./floatformat.o ./fnmatch.o ./fopen_unlocked.o ./getopt.o=
 ./getopt1.o ./getpwd.o ./getruntime.o ./hashtab.o ./hex.o ./lbasename.o ./=
lrealpath.o ./make-relative-prefix.o ./make-temp-file.o ./objalloc.o ./obst=
ack.o ./partition.o ./pexecute.o ./physmem.o ./pex-common.o ./pex-one.o ./p=
ex-unix.o ./safe-ctype.o ./sort.o ./spaces.o ./splay-tree.o ./strerror.o ./=
strsignal.o ./unlink-if-ordinary.o ./xatexit.o ./xexit.o ./xmalloc.o ./xmem=
dup.o ./xstrdup.o ./xstrerror.o ./xstrndup.o =20
yes
checking whether gcc  supports -pedantic -Wno-long-long... ranlib ./libiber=
ty.a
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/hashtab.c -o pic/hashtab.o; \
	else true; fi
if [ x"" !=3D x ]; then \
	  cd pic; \
	  ar rc ./libiberty.a \
	    ./regex.o ./cplus-dem.o ./cp-demangle.o ./md5.o ./alloca.o ./argv.o ./=
choose-temp.o ./concat.o ./cp-demint.o ./dyn-string.o ./fdmatch.o ./fibheap=
.o ./filename_cmp.o ./floatformat.o ./fnmatch.o ./fopen_unlocked.o ./getopt=
.o ./getopt1.o ./getpwd.o ./getruntime.o ./hashtab.o ./hex.o ./lbasename.o =
./lrealpath.o ./make-relative-prefix.o ./make-temp-file.o ./objalloc.o ./ob=
stack.o ./partition.o ./pexecute.o ./physmem.o ./pex-common.o ./pex-one.o .=
/pex-unix.o ./safe-ctype.o ./sort.o ./spaces.o ./splay-tree.o ./strerror.o =
./strsignal.o ./unlink-if-ordinary.o ./xatexit.o ./xexit.o ./xmalloc.o ./xm=
emdup.o ./xstrdup.o ./xstrerror.o ./xstrndup.o  ; \
	  ranlib ./libiberty.a; \
	  cd ..; \
	else true; fi
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/hex.c -o pic/hex.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/hashtab.c -o hashtab.o
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/hex.c -o hex.o
make[2]: Leaving directory `/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angst=
rom-linux/libiberty'
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/lbasename.c -o pic/lbasename.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/lbasename.c -o lbasename.o
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/lrealpath.c -o pic/lrealpath.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/lrealpath.c -o lrealpath.o
yes
make[2]: Entering directory `/opt/work/oe/openembedded/tmp/work/sh4-angstro=
m-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angs=
trom-linux/fixincludes'
gcc  -c -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototyp=
es -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-string=
s -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixin=
cludes -I../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixincludes/../include /opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/fixincludes/fixincl.c
yes
checking for feof_unlocked... checking dependency style of gcc ... if [ x""=
 !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/make-relative-prefix.c -o pic/make-relative-pref=
ix.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/make-relative-prefix.c -o make-relative-prefix.o
gcc  -c -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototyp=
es -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-string=
s -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixin=
cludes -I../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixincludes/../include /opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/fixincludes/fixtests.c
gcc  -c -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototyp=
es -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-string=
s -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixin=
cludes -I../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixincludes/../include /opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/fixincludes/fixfixes.c
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/make-temp-file.c -o pic/make-temp-file.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/make-temp-file.c -o make-temp-file.o
yes
gcc3
checking whether time.h and sys/time.h may both be included... checking for=
 ferror_unlocked... if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/objalloc.c -o pic/objalloc.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/objalloc.c -o objalloc.o
gcc  -c -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototyp=
es -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-string=
s -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixin=
cludes -I../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixincludes/../include /opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/fixincludes/server.c
gcc  -c -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototyp=
es -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-string=
s -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixin=
cludes -I../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixincludes/../include /opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/fixincludes/procopen.c
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/obstack.c -o pic/obstack.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/obstack.c -o obstack.o
yes
checking whether string.h and strings.h may both be included... gcc  -c -is=
ystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/include -O2 -g=
 -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-st=
yle-definition -Wmissing-format-attribute -Wno-overlength-strings -pedantic=
 -Wno-long-long   -DHAVE_CONFIG_H -I. -I/opt/work/oe/openembedded/tmp/work/=
sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixincludes -I..=
/include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-=
initial-4.3.3-r14.1/gcc-4.3.3/fixincludes/../include /opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fix=
includes/fixlib.c
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/partition.c -o pic/partition.o; \
	else true; fi
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/pexecute.c -o pic/pexecute.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/partition.c -o partition.o
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/pexecute.c -o pexecute.o
yes
gcc  -c -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototyp=
es -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-string=
s -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixin=
cludes -I../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixincludes/../include /opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/fixincludes/fixopts.c
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/physmem.c -o pic/physmem.o; \
	else true; fi
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/pex-common.c -o pic/pex-common.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/physmem.c -o physmem.o
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/pex-common.c -o pex-common.o
checking for fflush_unlocked... yes
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/pex-one.c -o pic/pex-one.o; \
	else true; fi
checking how to run the C preprocessor... gcc -E
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/pex-one.c -o pex-one.o
srcdir=3D"/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/fixincludes" /bin/sh /opt/work/oe/openembedded=
/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixinc=
ludes/mkfixinc.sh sh4-angstrom-linux-gnu
sed -e 's/@gcc_version@/4.3.3/' < mkheaders.almost > mkheadersT
mv -f mkheadersT mkheaders
gcc  -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -g -L/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,=
-rpath-link,/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/lib -Wl=
,-rpath,/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1=
 -o fixincl fixincl.o fixtests.o fixfixes.o server.o procopen.o fixlib.o fi=
xopts.o ../libiberty/libiberty.a
if [ x"" !=3D x ]; then \
	  gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../includ=
e  -W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic   /o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/libiberty/pex-unix.c -o pic/pex-unix.o; \
	else true; fi
gcc  -c -DHAVE_CONFIG_H -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/include -O2 -g -I. -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libiberty/../include  =
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  /opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libiberty/pex-unix.c -o pex-unix.o
echo timestamp > full-stamp
make[2]: Leaving directory `/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angst=
rom-linux/fixincludes'
yes
checking for egrep... grep -E
checking for ANSI C header files... rm -f ./libiberty.a pic/./libiberty.a
checking for fgetc_unlocked... ar rc ./libiberty.a \
	  ./regex.o ./cplus-dem.o ./cp-demangle.o ./md5.o ./alloca.o ./argv.o ./ch=
oose-temp.o ./concat.o ./cp-demint.o ./dyn-string.o ./fdmatch.o ./fibheap.o=
 ./filename_cmp.o ./floatformat.o ./fnmatch.o ./fopen_unlocked.o ./getopt.o=
 ./getopt1.o ./getpwd.o ./getruntime.o ./hashtab.o ./hex.o ./lbasename.o ./=
lrealpath.o ./make-relative-prefix.o ./make-temp-file.o ./objalloc.o ./obst=
ack.o ./partition.o ./pexecute.o ./physmem.o ./pex-common.o ./pex-one.o ./p=
ex-unix.o ./safe-ctype.o ./sort.o ./spaces.o ./splay-tree.o ./strerror.o ./=
strsignal.o ./unlink-if-ordinary.o ./xatexit.o ./xexit.o ./xmalloc.o ./xmem=
dup.o ./xstrdup.o ./xstrerror.o ./xstrndup.o =20
ranlib ./libiberty.a
if [ x"" !=3D x ]; then \
	  cd pic; \
	  ar rc ./libiberty.a \
	    ./regex.o ./cplus-dem.o ./cp-demangle.o ./md5.o ./alloca.o ./argv.o ./=
choose-temp.o ./concat.o ./cp-demint.o ./dyn-string.o ./fdmatch.o ./fibheap=
.o ./filename_cmp.o ./floatformat.o ./fnmatch.o ./fopen_unlocked.o ./getopt=
.o ./getopt1.o ./getpwd.o ./getruntime.o ./hashtab.o ./hex.o ./lbasename.o =
./lrealpath.o ./make-relative-prefix.o ./make-temp-file.o ./objalloc.o ./ob=
stack.o ./partition.o ./pexecute.o ./physmem.o ./pex-common.o ./pex-one.o .=
/pex-unix.o ./safe-ctype.o ./sort.o ./spaces.o ./splay-tree.o ./strerror.o =
./strsignal.o ./unlink-if-ordinary.o ./xatexit.o ./xexit.o ./xmalloc.o ./xm=
emdup.o ./xstrdup.o ./xstrerror.o ./xstrndup.o  ; \
	  ranlib ./libiberty.a; \
	  cd ..; \
	else true; fi
make[2]: Leaving directory `/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angst=
rom-linux/build-x86_64-linux/libiberty'
make[2]: Entering directory `/opt/work/oe/openembedded/tmp/work/sh4-angstro=
m-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angs=
trom-linux/build-x86_64-linux/fixincludes'
gcc  -c -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototyp=
es -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-string=
s -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixin=
cludes -I../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixincludes/../include /opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/fixincludes/fixincl.c
gcc  -c -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototyp=
es -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-string=
s -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixin=
cludes -I../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixincludes/../include /opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/fixincludes/fixtests.c
gcc  -c -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototyp=
es -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-string=
s -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixin=
cludes -I../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixincludes/../include /opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/fixincludes/fixfixes.c
gcc  -c -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototyp=
es -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-string=
s -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixin=
cludes -I../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixincludes/../include /opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/fixincludes/server.c
yes
checking for fgets_unlocked... gcc  -c -isystem/opt/work/oe/openembedded/tm=
p/sysroots/x86_64-linux/usr/include -O2 -g -W -Wall -Wwrite-strings -Wstric=
t-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-a=
ttribute -Wno-overlength-strings -pedantic -Wno-long-long   -DHAVE_CONFIG_H=
 -I. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-init=
ial-4.3.3-r14.1/gcc-4.3.3/fixincludes -I../include -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fix=
includes/../include /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/g=
cc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixincludes/procopen.c
gcc  -c -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototyp=
es -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-string=
s -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixin=
cludes -I../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixincludes/../include /opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/fixincludes/fixlib.c
gcc  -c -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototyp=
es -Wold-style-definition -Wmissing-format-attribute -Wno-overlength-string=
s -pedantic -Wno-long-long   -DHAVE_CONFIG_H -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixin=
cludes -I../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixincludes/../include /opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/fixincludes/fixopts.c
yes
checking for sys/types.h... srcdir=3D"/opt/work/oe/openembedded/tmp/work/sh=
4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/fixincludes" /bin/=
sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-=
4.3.3-r14.1/gcc-4.3.3/fixincludes/mkfixinc.sh sh4-angstrom-linux-gnu
sed -e 's/@gcc_version@/4.3.3/' < mkheaders.almost > mkheadersT
mv -f mkheadersT mkheaders
gcc  -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -g -L/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,=
-rpath-link,/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/lib -Wl=
,-rpath,/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1=
 -o fixincl fixincl.o fixtests.o fixfixes.o server.o procopen.o fixlib.o fi=
xopts.o ../libiberty/libiberty.a
yes
echo timestamp > full-stamp
make[2]: Leaving directory `/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angst=
rom-linux/build-x86_64-linux/fixincludes'
checking for fileno_unlocked... yes
checking for sys/stat.h... yes
yes
checking for stdlib.h... checking for fprintf_unlocked... no
checking for fputc_unlocked... yes
checking for string.h... yes
yes
checking for fputs_unlocked... checking for memory.h... yes
yes
checking for fread_unlocked... checking for strings.h... yes
yes
checking for fwrite_unlocked... checking for inttypes.h... yes
yes
checking for stdint.h... checking for getchar_unlocked... yes
yes
checking for unistd.h... checking for getc_unlocked... yes
yes
checking iconv.h usability... checking for putchar_unlocked... yes
checking iconv.h presence... yes
yes
checking for iconv.h... yes
checking for putc_unlocked... checking locale.h usability... yes
yes
checking locale.h presence... checking whether mbstowcs works... yes
checking for locale.h... yes
yes
checking fcntl.h usability... checking for ssize_t... yes
checking fcntl.h presence... yes
checking for fcntl.h... yes
yes
checking for uid_t in sys/types.h... (cached) {ac_cv_type_uid_t=3Dyes}
checking type of array argument to getgroups... checking limits.h usability=
... gid_t
checking for sys/mman.h... (cached) yes
checking for mmap... (cached) yes
checking whether read-only mmap of a plain file works... yes
checking whether mmap from /dev/zero works... yes
checking for MAP_ANON(YMOUS)... yes
checking limits.h presence... yes
checking for limits.h... yes
yes
checking whether mmap with MAP_ANON(YMOUS) works... yes
checking stddef.h usability... checking for pid_t... yes
checking stddef.h presence... yes
checking for unistd.h... (cached) yes
yes
checking for stddef.h... yes
checking for vfork.h... checking for stdlib.h... (cached) yes
checking for strings.h... (cached) yes
no
checking for string.h... (cached) yes
checking for fork... checking sys/file.h usability... yes
yes
checking sys/file.h presence... checking for vfork... yes
checking for sys/file.h... yes
checking for unistd.h... (cached) yes
checking for an ANSI C-conforming const... yes
checking for working fork... yes
checking for inline... yes
checking for working vfork... (cached) yes
checking for ld used by GCC... ld
checking if the linker (ld) is GNU ld... yes
checking for shared library run path origin... inline
checking for obstacks... done
checking for iconv... yes
checking for off_t... yes
checking for iconv declaration... yes
checking for size_t...=20
         extern size_t iconv (iconv_t cd, char * *inbuf, size_t *inbyteslef=
t, char * *outbuf, size_t *outbytesleft);
checking for LC_MESSAGES... yes
checking for ssize_t... yes
checking for nl_langinfo and CODESET... yes
checking whether struct tm is in sys/time.h or time.h... yes
checking whether getenv is declared... time.h
checking for int... yes
yes
checking size of int... (cached) 4
checking whether atol is declared... checking for long... yes
checking size of long... yes
(cached) 8
checking for clearerr_unlocked... checking whether asprintf is declared... =
yes
yes
checking whether sbrk is declared... checking for feof_unlocked... yes
checking whether abort is declared... yes
checking for ferror_unlocked... yes
yes
checking whether atof is declared... checking for fflush_unlocked... yes
checking whether getcwd is declared... yes
checking for fgetc_unlocked... yes
checking whether getwd is declared... yes
checking for fgets_unlocked... yes
checking whether strsignal is declared... yes
yes
checking whether strstr is declared... checking for fileno_unlocked... yes
yes
checking whether strverscmp is declared... checking for fprintf_unlocked...=
 yes
checking whether errno is declared... no
checking for fputc_unlocked... yes
checking whether snprintf is declared... yes
checking for fputs_unlocked... yes
checking whether vsnprintf is declared... yes
checking for fread_unlocked... yes
checking whether vasprintf is declared... yes
checking for fwrite_unlocked... yes
checking whether malloc is declared... yes
checking for getchar_unlocked... yes
checking whether realloc is declared... yes
checking for getc_unlocked... yes
checking whether calloc is declared... yes
checking for putchar_unlocked... yes
checking whether free is declared... yes
checking for putc_unlocked... yes
checking whether basename is declared... yes
checking whether abort is declared... yes
checking whether getopt is declared... yes
checking whether asprintf is declared... no
checking whether clock is declared... no
checking whether basename is declared... no
checking whether errno is declared... yes
checking whether getpagesize is declared... no
checking whether getopt is declared... yes
checking whether clearerr_unlocked is declared... yes
checking whether clearerr_unlocked is declared... yes
checking whether feof_unlocked is declared... yes
checking whether feof_unlocked is declared... yes
checking whether ferror_unlocked is declared... yes
checking whether ferror_unlocked is declared... yes
yes
checking whether fflush_unlocked is declared... checking whether fflush_unl=
ocked is declared... yes
checking whether fgetc_unlocked is declared... yes
checking whether fgetc_unlocked is declared... yes
checking whether fgets_unlocked is declared... yes
checking whether fgets_unlocked is declared... no
checking whether fileno_unlocked is declared... yes
checking whether fprintf_unlocked is declared... yes
checking whether fileno_unlocked is declared... no
checking whether fputc_unlocked is declared... yes
checking whether fprintf_unlocked is declared... yes
checking whether fputs_unlocked is declared... no
checking whether fputc_unlocked is declared... no
checking whether fread_unlocked is declared... yes
checking whether fputs_unlocked is declared... yes
checking whether fwrite_unlocked is declared... yes
checking whether fread_unlocked is declared... yes
checking whether getchar_unlocked is declared... yes
checking whether fwrite_unlocked is declared... yes
checking whether getc_unlocked is declared... yes
yes
checking whether putchar_unlocked is declared... checking whether getchar_u=
nlocked is declared... yes
checking whether putc_unlocked is declared... yes
checking whether getc_unlocked is declared... yes
checking whether vasprintf is declared... yes
checking whether putchar_unlocked is declared... no
checking for working alloca.h... yes
yes
checking whether putc_unlocked is declared... checking for alloca... yes
yes
checking for ANSI C header files... (cached) yes
checking for nl_langinfo and CODESET... checking whether getrlimit is decla=
red... yes
checking whether NLS is requested... yes
checking for catalogs to be installed... yes
checking whether setrlimit is declared... yes
checking whether getrusage is declared... yes
checking whether ldgetname is declared... no
checking whether times is declared...  be ca da de el es fr id ja nl sv tr =
uk vi zh_CN zh_TW be ca da de el es fr id ja nl sv tr uk vi zh_CN zh_TW
checking for uchar... yes
checking whether sigaltstack is declared...=20
checking for ld used by GCC... ld
checking if the linker (ld) is GNU ld... yes
checking for shared library run path origin... done
yes
checking for iconv... checking for struct tms... yes
checking for iconv declaration... yes
checking for clock_t...=20
         extern size_t iconv (iconv_t cd, char * *inbuf, size_t *inbyteslef=
t, char * *outbuf, size_t *outbytesleft);
yes
checking for .preinit_array/.init_array/.fini_array support... updating cac=
he ./config.cache
configure: creating ./config.status
yes
checking if mkdir takes one argument... no
Using `/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-init=
ial-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.c' for machine-specific logic.
Using `/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-init=
ial-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.md' as machine description file.
Using the following target machine macro files:
	/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/config/sh/little.h
	/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.h
	/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/config/dbxelf.h
	/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/config/elfos.h
	/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/config/svr4.h
	/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/config/sh/elf.h
	/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/config/linux.h
	/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/config/sh/linux.h
Using host-linux.o for host machine hooks.
checking whether NLS is requested... yes
checking for catalogs to be installed... config.status: creating Makefile
config.status: creating config.h
config.status: executing depdir commands
mkdir -p -- .deps
 be da de el es fi fr id ja nl ru sr sv tr zh_CN zh_TW be da de el es fi fr=
 id ja nl ru sr sv tr zh_CN zh_TW
checking for a sed that does not truncate output... /bin/sed
checking for fgrep... grep -F
checking for ld used by gcc ... ld
checking if the linker (ld) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... nm
checking the name lister (nm) interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 345876451382054092=
5
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+=3D"... yes
checking for ld option to reload object files... -r
checking how to recognize dependent libraries... pass_all
checking for x86_64-linux-ar... (cached) ar
checking for x86_64-linux-strip... strip
checking for x86_64-linux-ranlib... (cached) ranlib
checking command to parse nm output from gcc  object... make[2]: Entering d=
irectory `/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angstrom-linux/libcpp'
gcc   -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/work/oe/openembedded/tmp/work/=
sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/../includ=
e -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial=
-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -isystem/opt/work/oe/openembedded/tm=
p/sysroots/x86_64-linux/usr/include -O2 -g -W -Wall -Wwrite-strings -Wstric=
t-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-a=
ttribute -pedantic -Wno-long-long  -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libcpp/../include -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -c -o c=
harset.o -MT charset.o -MMD -MP -MF .deps/charset.Po /opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/lib=
cpp/charset.c
gcc   -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/work/oe/openembedded/tmp/work/=
sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/../includ=
e -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial=
-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -isystem/opt/work/oe/openembedded/tm=
p/sysroots/x86_64-linux/usr/include -O2 -g -W -Wall -Wwrite-strings -Wstric=
t-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-a=
ttribute -pedantic -Wno-long-long  -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libcpp/../include -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -c -o d=
irectives.o -MT directives.o -MMD -MP -MF .deps/directives.Po /opt/work/oe/=
openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-=
4.3.3/libcpp/directives.c
gcc   -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/work/oe/openembedded/tmp/work/=
sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/../includ=
e -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial=
-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -isystem/opt/work/oe/openembedded/tm=
p/sysroots/x86_64-linux/usr/include -O2 -g -W -Wall -Wwrite-strings -Wstric=
t-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-a=
ttribute -pedantic -Wno-long-long  -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libcpp/../include -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -c -o d=
irectives-only.o -MT directives-only.o -MMD -MP -MF .deps/directives-only.P=
o /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4=
.3.3-r14.1/gcc-4.3.3/libcpp/directives-only.c
gcc   -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/work/oe/openembedded/tmp/work/=
sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/../includ=
e -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial=
-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -isystem/opt/work/oe/openembedded/tm=
p/sysroots/x86_64-linux/usr/include -O2 -g -W -Wall -Wwrite-strings -Wstric=
t-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-a=
ttribute -pedantic -Wno-long-long  -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libcpp/../include -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -c -o e=
rrors.o -MT errors.o -MMD -MP -MF .deps/errors.Po /opt/work/oe/openembedded=
/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp=
/errors.c
ok
gcc   -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/work/oe/openembedded/tmp/work/=
sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/../includ=
e -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial=
-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -isystem/opt/work/oe/openembedded/tm=
p/sysroots/x86_64-linux/usr/include -O2 -g -W -Wall -Wwrite-strings -Wstric=
t-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-a=
ttribute -pedantic -Wno-long-long  -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libcpp/../include -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -c -o e=
xpr.o -MT expr.o -MMD -MP -MF .deps/expr.Po /opt/work/oe/openembedded/tmp/w=
ork/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/expr.=
c
gcc   -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/work/oe/openembedded/tmp/work/=
sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/../includ=
e -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial=
-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -isystem/opt/work/oe/openembedded/tm=
p/sysroots/x86_64-linux/usr/include -O2 -g -W -Wall -Wwrite-strings -Wstric=
t-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-a=
ttribute -pedantic -Wno-long-long  -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libcpp/../include -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -c -o f=
iles.o -MT files.o -MMD -MP -MF .deps/files.Po /opt/work/oe/openembedded/tm=
p/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/fi=
les.c
checking for dlfcn.h... yes
checking for objdir... .libs
gcc   -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/work/oe/openembedded/tmp/work/=
sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/../includ=
e -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial=
-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -isystem/opt/work/oe/openembedded/tm=
p/sysroots/x86_64-linux/usr/include -O2 -g -W -Wall -Wwrite-strings -Wstric=
t-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-a=
ttribute -pedantic -Wno-long-long  -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libcpp/../include -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -c -o i=
dentifiers.o -MT identifiers.o -MMD -MP -MF .deps/identifiers.Po /opt/work/=
oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/g=
cc-4.3.3/libcpp/identifiers.c
echo "#define LOCALEDIR \"/opt/work/oe/openembedded/tmp/sysroots/x86_64-lin=
ux/usr/sh4/share/locale\"" > localedir.new
gcc   -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/work/oe/openembedded/tmp/work/=
sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/../includ=
e -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial=
-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -isystem/opt/work/oe/openembedded/tm=
p/sysroots/x86_64-linux/usr/include -O2 -g -W -Wall -Wwrite-strings -Wstric=
t-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-a=
ttribute -pedantic -Wno-long-long  -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libcpp/../include -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -c -o l=
ex.o -MT lex.o -MMD -MP -MF .deps/lex.Po /opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/lex.c
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/libcpp/../move-if-change localedir.new localedir.h
echo timestamp > localedir.hs
gcc   -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/work/oe/openembedded/tmp/work/=
sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/../includ=
e -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial=
-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -isystem/opt/work/oe/openembedded/tm=
p/sysroots/x86_64-linux/usr/include -O2 -g -W -Wall -Wwrite-strings -Wstric=
t-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-a=
ttribute -pedantic -Wno-long-long  -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libcpp/../include -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -c -o l=
ine-map.o -MT line-map.o -MMD -MP -MF .deps/line-map.Po /opt/work/oe/openem=
bedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/=
libcpp/line-map.c
gcc   -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/work/oe/openembedded/tmp/work/=
sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/../includ=
e -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial=
-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -isystem/opt/work/oe/openembedded/tm=
p/sysroots/x86_64-linux/usr/include -O2 -g -W -Wall -Wwrite-strings -Wstric=
t-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-a=
ttribute -pedantic -Wno-long-long  -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libcpp/../include -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -c -o m=
acro.o -MT macro.o -MMD -MP -MF .deps/macro.Po /opt/work/oe/openembedded/tm=
p/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/ma=
cro.c
gcc   -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/work/oe/openembedded/tmp/work/=
sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/../includ=
e -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial=
-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -isystem/opt/work/oe/openembedded/tm=
p/sysroots/x86_64-linux/usr/include -O2 -g -W -Wall -Wwrite-strings -Wstric=
t-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-a=
ttribute -pedantic -Wno-long-long  -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libcpp/../include -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -c -o m=
kdeps.o -MT mkdeps.o -MMD -MP -MF .deps/mkdeps.Po /opt/work/oe/openembedded=
/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp=
/mkdeps.c
gcc   -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/work/oe/openembedded/tmp/work/=
sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/../includ=
e -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial=
-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -isystem/opt/work/oe/openembedded/tm=
p/sysroots/x86_64-linux/usr/include -O2 -g -W -Wall -Wwrite-strings -Wstric=
t-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-a=
ttribute -pedantic -Wno-long-long  -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libcpp/../include -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -c -o p=
ch.o -MT pch.o -MMD -MP -MF .deps/pch.Po /opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/pch.c
checking if gcc  supports -fno-rtti -fno-exceptions... gcc   -I/opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/libcpp -I. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/g=
cc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/../include -I/opt/work/oe/ope=
nembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3=
.3/libcpp/include  -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-li=
nux/usr/include -O2 -g -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissi=
ng-prototypes -Wold-style-definition -Wmissing-format-attribute -pedantic -=
Wno-long-long  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-=
cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/=
../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cros=
s-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -c -o symtab.o -MT symtab.o=
 -MMD -MP -MF .deps/symtab.Po /opt/work/oe/openembedded/tmp/work/sh4-angstr=
om-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/symtab.c
no
checking for gcc  option to produce PIC... -fPIC -DPIC
checking if gcc  PIC flag -fPIC -DPIC works... gcc   -I/opt/work/oe/openemb=
edded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/l=
ibcpp -I. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross=
-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/../include -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcp=
p/include  -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/=
include -O2 -g -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-proto=
types -Wold-style-definition -Wmissing-format-attribute -pedantic -Wno-long=
-long  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-in=
itial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/../inclu=
de -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -c -o traditional.o -MT traditional=
.o -MMD -MP -MF .deps/traditional.Po /opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/traditional.=
c
yes
checking if gcc  static flag -static works... gcc   -I/opt/work/oe/openembe=
dded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/li=
bcpp -I. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-=
initial-4.3.3-r14.1/gcc-4.3.3/libcpp/../include -I/opt/work/oe/openembedded=
/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp=
/include  -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-protot=
ypes -Wold-style-definition -Wmissing-format-attribute -pedantic -Wno-long-=
long  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/work/oe/openembedded/tmp/work/=
sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/../includ=
e -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial=
-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -c -o makedepend.o -MT makedepend.o =
-MMD -MP -MF .deps/makedepend.Po /opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/makedepend.c
gcc   -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/work/oe/openembedded/tmp/work/=
sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/../includ=
e -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial=
-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -isystem/opt/work/oe/openembedded/tm=
p/sysroots/x86_64-linux/usr/include -O2 -g -W -Wall -Wwrite-strings -Wstric=
t-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-a=
ttribute -pedantic -Wno-long-long  -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp -I. -I/opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/libcpp/../include -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/include  -c -o i=
nit.o -MT init.o -MMD -MP -MF .deps/init.Po /opt/work/oe/openembedded/tmp/w=
ork/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/libcpp/init.=
c
yes
checking if gcc  supports -c -o file.o... rm -f libcpp.a
ar cru libcpp.a charset.o directives.o directives-only.o errors.o expr.o fi=
les.o identifiers.o init.o lex.o line-map.o macro.o mkdeps.o pch.o symtab.o=
 traditional.o
ranlib libcpp.a
yes
checking if gcc  supports -c -o file.o... (cached) yes
checking whether the gcc  linker (ld -m elf_x86_64) supports shared librari=
es... gcc  -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/=
include -O2 -g -L/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath-link,/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/l=
ib -Wl,-rpath,/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/lib -=
Wl,-O1 -o makedepend \
	  makedepend.o libcpp.a ../libiberty/libiberty.a \
	  =20
make[2]: Leaving directory `/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angst=
rom-linux/libcpp'
yes
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... no
checking whether to build static libraries... yes
checking what assembler to use... /opt/work/oe/openembedded/tmp/sysroots/x8=
6_64-linux/usr/sh4/sh4-angstrom-linux/bin/as
checking what linker to use... /opt/work/oe/openembedded/tmp/sysroots/x86_6=
4-linux/usr/sh4/sh4-angstrom-linux/bin/ld
checking what nm to use... /opt/work/oe/openembedded/tmp/sysroots/x86_64-li=
nux/usr/sh4/sh4-angstrom-linux/bin/nm
checking what objdump to use... /opt/work/oe/openembedded/tmp/sysroots/x86_=
64-linux/usr/sh4/sh4-angstrom-linux/bin/objdump
checking assembler for .balign and .p2align... yes
checking assembler for .p2align with maximum skip... yes
checking assembler for .literal16... no
checking assembler for working .subsection -1... yes
checking assembler for .weak... yes
checking assembler for .weakref... yes
checking assembler for .nsubspa comdat... no
checking assembler for .hidden... yes
checking linker for .hidden support... yes
checking assembler for .sleb128 and .uleb128... yes
checking assembler for eh_frame optimization... yes
checking assembler for section merging support... yes
checking assembler for COMDAT group support... yes
checking assembler for thread-local storage support... yes
checking linker -Bstatic/-Bdynamic option... yes
checking assembler for tolerance to line number 0... yes
checking linker read-only and read-write section mixing... read-write
checking linker PT_GNU_EH_FRAME support... yes
checking linker position independent executable support... yes
checking linker EH-compatible garbage collection of sections... yes
checking linker --as-needed support... yes
checking linker --sysroot support... yes
checking __stack_chk_fail in target C library... no
Using ggc-page for garbage collection.
checking whether to enable maintainer-specific portions of Makefiles... no
Links are now set up to build a cross-compiler
 from x86_64-pc-linux-gnu to sh4-angstrom-linux-gnu.
updating cache ./config.cache
configure: creating ./config.status
config.status: creating as
config.status: creating collect-ld
config.status: creating nm
config.status: creating Makefile
config.status: creating gccbug
config.status: creating libada-mk
config.status: creating ada/Makefile
config.status: creating auto-host.h
config.status: executing default commands
make[2]: Entering directory `/opt/work/oe/openembedded/tmp/work/sh4-angstro=
m-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angs=
trom-linux/gcc'
TARGET_CPU_DEFAULT=3D"" \
	HEADERS=3D"auto-host.h ansidecl.h" DEFINES=3D"" \
	/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-in=
itial-4.3.3-r14.1/gcc-4.3.3/gcc/mkconfig.sh config.h
TARGET_CPU_DEFAULT=3D"SELECT_SH4" \
	HEADERS=3D"options.h config/sh/little.h config/sh/sh.h config/dbxelf.h con=
fig/elfos.h config/svr4.h config/sh/elf.h config/linux.h config/sh/linux.h =
defaults.h" DEFINES=3D"UCLIBC_DEFAULT=3D0 SH_MULTILIB_CPU_DEFAULT=3D\"m4\" =
SUPPORT_SH4=3D1 SUPPORT_SH4_NOFPU=3D1 SUPPORT_SH4=3D1" \
	/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-in=
itial-4.3.3-r14.1/gcc-4.3.3/gcc/mkconfig.sh tm.h
gawk -f /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/opt-gather.awk /opt/work/oe/openembedded/tmp=
/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/ada/la=
ng.opt /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-init=
ial-4.3.3-r14.1/gcc-4.3.3/gcc/fortran/lang.opt /opt/work/oe/openembedded/tm=
p/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/java/=
lang.opt /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-in=
itial-4.3.3-r14.1/gcc-4.3.3/gcc/treelang/lang.opt /opt/work/oe/openembedded=
/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/c.=
opt /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial=
-4.3.3-r14.1/gcc-4.3.3/gcc/common.opt /opt/work/oe/openembedded/tmp/work/sh=
4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.o=
pt /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-=
4.3.3-r14.1/gcc-4.3.3/gcc/config/linux.opt > tmp-optionlist
TARGET_CPU_DEFAULT=3D"" \
	HEADERS=3D"auto-host.h ansidecl.h" DEFINES=3D"" \
	/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-in=
itial-4.3.3-r14.1/gcc-4.3.3/gcc/mkconfig.sh bconfig.h
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/input.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/coretypes.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include/line-map.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include/cpplib.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include/cpp-id-data.h' >> tmp-gi.lis=
t
echo 'auto-host.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/../include/ansidecl.h' >> tmp-gi.list
echo 'options.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/little.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/config/dbxelf.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/config/elfos.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/config/svr4.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/elf.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/config/linux.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/linux.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/defaults.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/../include/hashtab.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/../include/splay-tree.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/bitmap.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/alias.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/coverage.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/rtl.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/optabs.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/tree.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/function.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/libfuncs.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include/symtab.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/real.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/varray.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/insn-addr.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/hwint.h' >> tmp-gi.list
TARGET_CPU_DEFAULT=3D"" \
	HEADERS=3D"config/sh/sh-protos.h tm-preds.h" DEFINES=3D"" \
	/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-in=
itial-4.3.3-r14.1/gcc-4.3.3/gcc/mkconfig.sh tm_p.h
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/fixed-value.h' >> tmp-gi.list
ltf=3D"/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-init=
ial-4.3.3-r14.1/gcc-4.3.3/gcc/ada/ada-tree.def /opt/work/oe/openembedded/tm=
p/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/cp/cp=
-tree.def /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/java/java-tree.def /opt/work/oe/openembedd=
ed/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/=
objc/objc-tree.def"; for f in $ltf; do \
	    echo "#include \"$f\""; \
	done | sed 's|/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cr=
oss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/||' > tmp-gencheck.h
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/ipa-reference.h' >> tmp-gi.list
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-gencheck.h gencheck.h
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/output.h' >> tmp-gi.list
echo timestamp > s-gencheck
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cfgloop.h' >> tmp-gi.list
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/dummy-checksum.c -o dummy-checksum.o
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cselib.h' >> tmp-gi.list
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/sparseset.c -o sparseset.o
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/basic-block.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cgraph.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/reload.h' >> tmp-gi.list
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedded/t=
mp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-li=
nux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/o=
penembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4=
.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-angstr=
om-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt=
/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r=
14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    \
	-DBASEVER=3D"\"4.3.3\"" -DDATESTAMP=3D"\"\"" \
	-DREVISION=3D \
	-DDEVPHASE=3D"\"\"" -DPKGVERSION=3D"\"(GCC) \"" \
	-DBUGURL=3D"\"<http://gcc.gnu.org/bugs.html>\"" -c /opt/work/oe/openembedd=
ed/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/=
version.c -o version.o
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/caller-save.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/alias.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/bitmap.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cselib.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cgraph.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/ipa-prop.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/ipa-cp.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/ipa-inline.c' >> tmp-gi.list
if test no =3D yes \
	   || test -n ""; then \
	  /bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-=
initial-4.3.3-r14.1/gcc-4.3.3/gcc/genmultilib \
	    " m4-nofpu/m4" \
	    "" \
	    "" \
	    "" \
	    "" \
	    "" \
	    "" \
	    "no" \
	    > tmp-mlib.h; \
	else \
	  /bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-=
initial-4.3.3-r14.1/gcc-4.3.3/gcc/genmultilib '' '' '' '' '' '' '' no \
	    > tmp-mlib.h; \
	fi
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/matrix-reorg.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/dbxout.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/ipa-struct-reorg.c' >> tmp-gi.list
lsf=3D""; for f in $lsf; do \
	    echo "#include \"$f\""; \
	done | sed 's|/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cr=
oss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/||' > tmp-specs.h
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/dwarf2out.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/dwarf2asm.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/dojump.c' >> tmp-gi.list
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-specs.h specs.h
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/emit-rtl.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/except.c' >> tmp-gi.list
echo timestamp > s-specs
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/explow.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/expr.c' >> tmp-gi.list
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-optionlist optionlist
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/function.c' >> tmp-gi.list
TARGET_CPU_DEFAULT=3D"" \
	HEADERS=3D"auto-host.h ansidecl.h" DEFINES=3D"USED_FOR_TARGET " \
	/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-in=
itial-4.3.3-r14.1/gcc-4.3.3/gcc/mkconfig.sh tconfig.h
echo timestamp > s-options
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/except.h' >> tmp-gi.list
echo '#define FLOAT' > fp-bit.c
echo '#ifdef __LITTLE_ENDIAN__' >> fp-bit.c
echo '#define FLOAT_BIT_ORDER_MISMATCH' >>fp-bit.c
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/gcse.c' >> tmp-gi.list
echo '#endif' 		>> fp-bit.c
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/integrate.c' >> tmp-gi.list
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-mlib.h multilib.h
cat /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial=
-4.3.3-r14.1/gcc-4.3.3/gcc/config/fp-bit.c >> fp-bit.c
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/lists.c' >> tmp-gi.list
echo '#ifdef __LITTLE_ENDIAN__' > dp-bit.c
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/optabs.c' >> tmp-gi.list
echo '#define FLOAT_BIT_ORDER_MISMATCH' >>dp-bit.c
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/profile.c' >> tmp-gi.list
echo '#endif' 		>> dp-bit.c
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/regclass.c' >> tmp-gi.list
echo timestamp > s-mlib
cat /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial=
-4.3.3-r14.1/gcc-4.3.3/gcc/config/fp-bit.c >> dp-bit.c
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/reg-stack.c' >> tmp-gi.list
(echo "@set version-GCC 4.3.3"; \
	 if [ "" =3D "experimental" ]; \
	 then echo "@set DEVELOPMENT"; \
	 else echo "@clear DEVELOPMENT"; \
	 fi) > gcc-vers.texiT
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cfglayout.c' >> tmp-gi.list
echo @set srcdir /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-=
cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc >> gcc-vers.texiT
echo timestamp > gpl.pod
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cfglayout.h' >> tmp-gi.list
if [ -n "(GCC) " ]; then \
	  echo "@set VERSION_PACKAGE (GCC) " >> gcc-vers.texiT; \
	fi
perl /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../contrib/texi2pod.pl /opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/d=
oc/include/gpl_v3.texi > gpl.pod
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/sdbout.c' >> tmp-gi.list
echo "@set BUGURL @uref{http://gcc.gnu.org/bugs.html}" >> gcc-vers.texiT; \
	mv -f gcc-vers.texiT gcc-vers.texi
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/stor-layout.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/stringpool.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/tree.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/varasm.c' >> tmp-gi.list
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/alloc-pool.c -o alloc-pool.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/dbgcnt.c -o dbgcnt.o
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/tree-mudflap.c' >> tmp-gi.list
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/graphds.c -o graphds.o
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/tree-flow.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/tree-scalar-evolution.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/tree-ssanames.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/tree-eh.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/tree-ssa-address.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/tree-phinodes.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/tree-cfg.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/tree-dfa.c' >> tmp-gi.list
gawk -f /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/opt-functions.awk -f /opt/work/oe/openembedd=
ed/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/=
optc-gen.awk \
	       -v header_name=3D"config.h system.h coretypes.h tm.h" < optionlist =
> options.c
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/tree-ssa-propagate.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/tree-iterator.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/gimplify.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/tree-chrec.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/tree-vect-generic.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/tree-ssa-operands.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/tree-profile.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/tree-nested.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/ipa-reference.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/tree-ssa-structalias.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/tree-ssa-structalias.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/tree-parloops.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/omp-low.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/varpool.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/targhooks.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/passes.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cgraphunit.c' >> tmp-gi.list
echo '[ada]' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/ada/ada-tree.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/ada/gigi.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/ada/decl.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/ada/trans.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/ada/utils.c' >> tmp-gi.list
echo '[cp]' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/rtti.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/mangle.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/name-lookup.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/name-lookup.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/cp-tree.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/decl.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/call.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/decl.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/decl2.c' >> tmp-gi.list
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/opts-common.c -o opts-common.o
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/pt.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/repo.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/semantics.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/tree.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/parser.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/method.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/typeck2.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-common.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-common.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-lex.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-pragma.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-pragma.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/class.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/cp-objcp-common.c' >> tmp-gi.list
echo '[fortran]' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/fortran/f95-lang.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/fortran/trans-decl.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/fortran/trans-intrinsic.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/fortran/trans-io.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/fortran/trans-types.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/fortran/trans-types.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/fortran/trans.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/fortran/trans-const.h' >> tmp-gi.list
echo '[java]' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/java/java-tree.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/java/jcf.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/java/parse.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/java/builtins.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/java/class.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/java/constants.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/java/decl.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/java/expr.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/java/jcf-parse.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/java/lang.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/java/mangle.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/java/resource.c' >> tmp-gi.list
echo '[objc]' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/objc/objc-act.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-parser.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-tree.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-decl.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-objc-common.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-common.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-common.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-pragma.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-pragma.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/objc/objc-act.c' >> tmp-gi.list
echo '[objcp]' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/objcp/objcp-decl.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/objc/objc-act.c' >> tmp-gi.list
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/pointer-set.c -o pointer-set.o
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/objc/objc-act.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/rtti.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/mangle.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/name-lookup.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/name-lookup.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/cp-tree.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/decl.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/call.c' >> tmp-gi.list
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/genchecksum.o /opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/genchecksum.c
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/decl.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/decl2.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/pt.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/repo.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/semantics.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/tree.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/parser.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/method.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/typeck2.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-common.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-common.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-lex.c' >> tmp-gi.list
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/errors.c -o errors.o
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-pragma.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-pragma.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cp/cp-objcp-common.c' >> tmp-gi.list
if [ xinfo =3D xinfo ]; then \
		makeinfo --split-size=3D5000000 --split-size=3D5000000 --no-split -I . -I=
 /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/doc \
			-I /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/doc/include -o doc/cpp.info /opt/work/oe/opene=
mbedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3=
/gcc/doc/cpp.texi; \
	fi
if [ xinfo =3D xinfo ]; then \
		makeinfo --split-size=3D5000000 --split-size=3D5000000 --no-split -I . -I=
 /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/doc \
			-I /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/doc/include -o doc/gcc.info /opt/work/oe/opene=
mbedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3=
/gcc/doc/gcc.texi; \
	fi
echo '[treelang]' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/treelang/tree1.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/treelang/treetree.c' >> tmp-gi.list
if [ xinfo =3D xinfo ]; then \
		makeinfo --split-size=3D5000000 --split-size=3D5000000 --no-split -I . -I=
 /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/doc \
			-I /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/doc/include -o doc/gccint.info /opt/work/oe/op=
enembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.=
3.3/gcc/doc/gccint.texi; \
	fi
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/treelang/treelang.h' >> tmp-gi.list
echo '[c]' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-lang.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-tree.h' >> tmp-gi.list
if [ xinfo =3D xinfo ]; then \
		makeinfo --split-size=3D5000000 --split-size=3D5000000 --no-split -I /opt=
/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r=
14.1/gcc-4.3.3/gcc/doc \
			-I /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/doc/include -o doc/gccinstall.info /opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/doc/install.texi; \
	fi
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-decl.c' >> tmp-gi.list
if [ xinfo =3D xinfo ]; then \
		makeinfo --split-size=3D5000000 --split-size=3D5000000 --no-split -I . -I=
 /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/doc \
			-I /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/doc/include -o doc/cppinternals.info /opt/work=
/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/=
gcc-4.3.3/gcc/doc/cppinternals.texi; \
	fi
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-common.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-common.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-pragma.h' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-pragma.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-objc-common.c' >> tmp-gi.list
echo '/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/c-parser.c' >> tmp-gi.list
echo timestamp > doc/gpl.7
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-gi.list gtyp-input.lis=
t
(pod2man --center=3D"GNU" --release=3D"gcc-4.3.3" --section=3D7 gpl.pod > d=
oc/gpl.7.T$$ && \
		mv -f doc/gpl.7.T$$ doc/gpl.7) || \
		(rm -f doc/gpl.7.T$$ && exit 1)
gawk -f /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/opt-functions.awk -f /opt/work/oe/openembedd=
ed/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/=
opth-gen.awk \
	       < optionlist > tmp-options.h
echo timestamp > s-gtyp-input
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/genmodes.o /opt/work/oe/o=
penembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4=
.3.3/gcc/genmodes.c
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-options.h options.h
echo timestamp > s-options-h
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/errors.o /opt/work/oe/ope=
nembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3=
.3/gcc/errors.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/gengenrtl.o /opt/work/oe/=
openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-=
4.3.3/gcc/gengenrtl.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/gengtype.o /opt/work/oe/o=
penembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4=
.3.3/gcc/gengtype.c
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/gengtype.c: In function 'read_input_list':
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/gengtype.c:436: warning: cast discards qualifiers fr=
om pointer target type
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/gengtype.c: In function 'adjust_field_type':
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/gengtype.c:1274: warning: cast discards qualifiers f=
rom pointer target type
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/gengtype.c:1276: warning: cast discards qualifiers f=
rom pointer target type
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/gengtype.c: In function 'process_gc_options':
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/gengtype.c:1325: warning: cast discards qualifiers f=
rom pointer target type
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings  -Wno-error  -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ib=
uild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-init=
ial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angs=
trom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/wo=
rk/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.=
1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dp=
d -I../libdecnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-an=
gstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/ope=
nembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3=
.3/gcc/build -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cr=
oss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/g=
cc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/o=
penembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4=
.3.3/gcc/../libdecnumber/dpd -I../libdecnumber     -o build/gengtype-lex.o =
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/gengtype-lex.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/gengtype-parse.o /opt/wor=
k/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1=
/gcc-4.3.3/gcc/gengtype-parse.c
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -L/opt/work/oe/opene=
mbedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/open=
embedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembe=
dded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genchecksum \
	    build/genchecksum.o ../build-x86_64-linux/libiberty/libiberty.a
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -L/opt/work/oe/opene=
mbedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/open=
embedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembe=
dded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genmodes \
	    build/genmodes.o build/errors.o ../build-x86_64-linux/libiberty/libibe=
rty.a
gengtype-lex.c: In function 'yy_get_next_buffer':
gengtype-lex.c:1884: warning: comparison between signed and unsigned intege=
r expressions
/abuild/rguenther/tmp/gcc-4.3.3/gcc-4.3.3/gcc/gengtype-lex.l: At top level:
gengtype-lex.c:1988: warning: 'input' defined but not used
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -L/opt/work/oe/opene=
mbedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/open=
embedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembe=
dded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/gengenrtl \
	    build/gengenrtl.o build/errors.o ../build-x86_64-linux/libiberty/libib=
erty.a
build/genmodes -m > tmp-min-modes.c
gcc  -c -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -DHAVE_CONFIG_H -DGENERATOR_FILE -I=
. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross=
-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/wo=
rk/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.=
1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstro=
m-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/s=
h4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumb=
er/dpd -I../libdecnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/s=
h4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/build -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/g=
cc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openem=
bedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/=
gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-li=
nux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work=
/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/=
gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber     -o build/gencheck.o=
 /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/gencheck.c
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-min-modes.c min-insn-m=
odes.c
echo timestamp > s-modes-m
build/genmodes > tmp-modes.c
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-modes.c insn-modes.c
echo timestamp > s-modes
build/gengenrtl > tmp-genrtl.c
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-genrtl.c genrtl.c
echo timestamp > s-genrtl
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/gen-protos.o /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/gen-protos.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/scan.o /opt/work/oe/opene=
mbedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3=
/gcc/scan.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/scan-decls.o /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/scan-decls.c
build/genmodes -h > tmp-modes.h
build/gengenrtl -h > tmp-genrtl.h
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-genrtl.h genrtl.h
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-modes.h insn-modes.h
gcc  -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE -W -Wall -Wwrite-strings -Wst=
rict-prototypes -Wmissing-prototypes -DHAVE_CONFIG_H -DGENERATOR_FILE -L/op=
t/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/o=
pt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/opt/w=
ork/oe/openembedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genc=
heck \
	    build/gencheck.o ../build-x86_64-linux/libiberty/libiberty.a
echo timestamp > s-genrtl-h
echo timestamp > s-modes-h
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -L/opt/work/oe/opene=
mbedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/open=
embedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembe=
dded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/gen-protos \
	  build/gen-protos.o build/scan.o build/errors.o ../build-x86_64-linux/lib=
iberty/libiberty.a
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/read-rtl.o /opt/work/oe/o=
penembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4=
.3.3/gcc/read-rtl.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/min-insn-modes.o min-insn=
-modes.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/gensupport.o /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/gensupport.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/print-rtl.o /opt/work/oe/=
openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-=
4.3.3/gcc/print-rtl.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/genmddeps.o /opt/work/oe/=
openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-=
4.3.3/gcc/genmddeps.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/genflags.o /opt/work/oe/o=
penembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4=
.3.3/gcc/genflags.c
gcc  -c -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -DHAVE_CONFIG_H -DGENERATOR_FILE -I=
. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross=
-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/wo=
rk/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.=
1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstro=
m-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/s=
h4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumb=
er/dpd -I../libdecnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/s=
h4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/build -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/g=
cc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openem=
bedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/=
gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-li=
nux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work=
/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/=
gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber     -o build/genconditi=
ons.o /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/genconditions.c
gcc  -c -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -DHAVE_CONFIG_H -DGENERATOR_FILE -I=
. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross=
-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/wo=
rk/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.=
1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstro=
m-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/s=
h4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumb=
er/dpd -I../libdecnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/s=
h4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/build -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/g=
cc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openem=
bedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/=
gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-li=
nux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work=
/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/=
gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber     -o build/genpreds.o=
 /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/genpreds.c
build/gencheck > tmp-check.h
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-check.h tree-check.h
echo timestamp > s-check
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/genconfig.o /opt/work/oe/=
openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-=
4.3.3/gcc/genconfig.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/genattr.o /opt/work/oe/op=
enembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.=
3.3/gcc/genattr.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/genautomata.o /opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/genautomata.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/genemit.o /opt/work/oe/op=
enembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.=
3.3/gcc/genemit.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/gencodes.o /opt/work/oe/o=
penembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4=
.3.3/gcc/gencodes.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/genextract.o /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/genextract.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/genopinit.o /opt/work/oe/=
openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-=
4.3.3/gcc/genopinit.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/genoutput.o /opt/work/oe/=
openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-=
4.3.3/gcc/genoutput.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/genpeep.o /opt/work/oe/op=
enembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.=
3.3/gcc/genpeep.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/genrecog.o /opt/work/oe/o=
penembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4=
.3.3/gcc/genrecog.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    -I. -I. -I/o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linu=
x/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded=
/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/..=
/include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-=
initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openemb=
edded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/g=
cc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/=
gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdec=
number \
		/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4=
.3.3-r14.1/gcc-4.3.3/gcc/config/host-linux.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/genconstants.o /opt/work/=
oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/g=
cc-4.3.3/gcc/genconstants.c
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -L/opt/work/oe/opene=
mbedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/open=
embedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembe=
dded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/gengtype \
	    build/gengtype.o build/gengtype-lex.o build/gengtype-parse.o build/err=
ors.o ../build-x86_64-linux/libiberty/libiberty.a
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/pretty-print.c -o pretty-print.o
build/gengtype /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cr=
oss-initial-4.3.3-r14.1/gcc-4.3.3/gcc gtyp-input.list
echo timestamp > s-gtype
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/genattrtab.o /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/genattrtab.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/ggc-common.c -o ggc-common.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/vec.c -o vec.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/rtl.o /opt/work/oe/openem=
bedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/=
gcc/rtl.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/ggc-none.o /opt/work/oe/o=
penembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4=
.3.3/gcc/ggc-none.c
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/ggc-common.c: In function 'ggc_mark_roots':
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/ggc-common.c:128: warning: cast discards qualifiers =
from pointer target type
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/vec.o /opt/work/oe/openem=
bedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/=
gcc/vec.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/stub-objc.c -o stub-objc.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-iterator.c -o tree-iterator.o
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -L/opt/work/oe/opene=
mbedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/open=
embedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembe=
dded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genconstants \
	    build/genconstants.o build/rtl.o build/read-rtl.o build/ggc-none.o bui=
ld/vec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/=
errors.o ../build-x86_64-linux/libiberty/libiberty.a
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -L/opt/work/oe/opene=
mbedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/open=
embedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembe=
dded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genmddeps \
	    build/genmddeps.o build/rtl.o build/read-rtl.o build/ggc-none.o build/=
vec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/err=
ors.o ../build-x86_64-linux/libiberty/libiberty.a
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -L/opt/work/oe/opene=
mbedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/open=
embedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembe=
dded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genflags \
	    build/genflags.o build/rtl.o build/read-rtl.o build/ggc-none.o build/v=
ec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/erro=
rs.o ../build-x86_64-linux/libiberty/libiberty.a
gcc  -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE -W -Wall -Wwrite-strings -Wst=
rict-prototypes -Wmissing-prototypes -DHAVE_CONFIG_H -DGENERATOR_FILE -L/op=
t/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/o=
pt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/opt/w=
ork/oe/openembedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genc=
onditions \
	    build/genconditions.o build/rtl.o build/read-rtl.o build/ggc-none.o bu=
ild/vec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build=
/errors.o ../build-x86_64-linux/libiberty/libiberty.a
gcc  -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE -W -Wall -Wwrite-strings -Wst=
rict-prototypes -Wmissing-prototypes -DHAVE_CONFIG_H -DGENERATOR_FILE -L/op=
t/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/o=
pt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/opt/w=
ork/oe/openembedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genp=
reds \
	    build/genpreds.o build/rtl.o build/read-rtl.o build/ggc-none.o build/v=
ec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/erro=
rs.o ../build-x86_64-linux/libiberty/libiberty.a
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -L/opt/work/oe/opene=
mbedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/open=
embedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembe=
dded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genconfig \
	    build/genconfig.o build/rtl.o build/read-rtl.o build/ggc-none.o build/=
vec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/err=
ors.o ../build-x86_64-linux/libiberty/libiberty.a
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -L/opt/work/oe/opene=
mbedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/open=
embedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembe=
dded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genattr \
	    build/genattr.o build/rtl.o build/read-rtl.o build/ggc-none.o build/ve=
c.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/error=
s.o ../build-x86_64-linux/libiberty/libiberty.a
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -L/opt/work/oe/opene=
mbedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/open=
embedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembe=
dded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genautomata \
	    build/genautomata.o build/rtl.o build/read-rtl.o build/ggc-none.o buil=
d/vec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/e=
rrors.o ../build-x86_64-linux/libiberty/libiberty.a -lm
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -L/opt/work/oe/opene=
mbedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/open=
embedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembe=
dded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genemit \
	    build/genemit.o build/rtl.o build/read-rtl.o build/ggc-none.o build/ve=
c.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/error=
s.o ../build-x86_64-linux/libiberty/libiberty.a
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -L/opt/work/oe/opene=
mbedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/open=
embedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembe=
dded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/gencodes \
	    build/gencodes.o build/rtl.o build/read-rtl.o build/ggc-none.o build/v=
ec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/erro=
rs.o ../build-x86_64-linux/libiberty/libiberty.a
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -L/opt/work/oe/opene=
mbedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/open=
embedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembe=
dded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genextract \
	    build/genextract.o build/rtl.o build/read-rtl.o build/ggc-none.o build=
/vec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/er=
rors.o ../build-x86_64-linux/libiberty/libiberty.a
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -L/opt/work/oe/opene=
mbedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/open=
embedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembe=
dded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genopinit \
	    build/genopinit.o build/rtl.o build/read-rtl.o build/ggc-none.o build/=
vec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/err=
ors.o ../build-x86_64-linux/libiberty/libiberty.a
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -L/opt/work/oe/opene=
mbedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/open=
embedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembe=
dded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genoutput \
	    build/genoutput.o build/rtl.o build/read-rtl.o build/ggc-none.o build/=
vec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/err=
ors.o ../build-x86_64-linux/libiberty/libiberty.a
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -L/opt/work/oe/opene=
mbedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/open=
embedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembe=
dded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genpeep \
	    build/genpeep.o build/rtl.o build/read-rtl.o build/ggc-none.o build/ve=
c.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/error=
s.o ../build-x86_64-linux/libiberty/libiberty.a
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -L/opt/work/oe/opene=
mbedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/open=
embedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembe=
dded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genrecog \
	    build/genrecog.o build/rtl.o build/read-rtl.o build/ggc-none.o build/v=
ec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/erro=
rs.o ../build-x86_64-linux/libiberty/libiberty.a
build/genmddeps /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-c=
ross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.md > tmp-mddeps
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-mddeps mddeps.mk
echo timestamp > s-mddeps
build/genconstants /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gc=
c-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.md \
	  > tmp-constants.h
build/genconditions /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/g=
cc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.md > tmp-condmd.c
build/genpreds -h /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc=
-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.md > tmp-preds.h
build/genpreds -c /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc=
-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.md > tmp-constrs.h
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-constants.h insn-const=
ants.h
echo timestamp > s-constants
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-condmd.c build/gencond=
md.c
build/genpreds /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cr=
oss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.md > tmp-preds.c
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-preds.h tm-preds.h
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-constrs.h tm-constrs.h
echo timestamp > s-conditions
echo timestamp > s-constrs-h
echo timestamp > s-preds-h
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-preds.c insn-preds.c
echo timestamp > s-preds
gcc  -c -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -DHAVE_CONFIG_H -DGENERATOR_FILE -I=
. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross=
-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/wo=
rk/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.=
1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstro=
m-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/s=
h4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumb=
er/dpd -I../libdecnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/s=
h4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/build -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/g=
cc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openem=
bedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/=
gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-li=
nux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work=
/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/=
gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber     -o build/gencondmd.=
o build/gencondmd.c
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -L/opt/work/oe/opene=
mbedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/open=
embedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembe=
dded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/gencondmd \
	    build/gencondmd.o ../build-x86_64-linux/libiberty/libiberty.a
build/gencondmd > tmp-cond.md
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-cond.md insn-condition=
s.md
echo timestamp > s-condmd
build/genflags /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cr=
oss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.md \
	  insn-conditions.md > tmp-flags.h
build/genconfig /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-c=
ross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.md \
	  insn-conditions.md > tmp-config.h
build/genattr /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.md \
	  insn-conditions.md > tmp-attr.h
build/genautomata /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc=
-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.md \
	  insn-conditions.md > tmp-automata.c
build/genemit /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.md \
	  insn-conditions.md > tmp-emit.c
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-flags.h insn-flags.h
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-config.h insn-config.h
echo timestamp > s-flags
build/gencodes /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cr=
oss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.md \
	  insn-conditions.md > tmp-codes.h
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-attr.h insn-attr.h
echo timestamp > s-config
build/genextract /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-=
cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.md \
	  insn-conditions.md > tmp-extract.c
echo timestamp > s-attr
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-emit.c insn-emit.c
echo timestamp > s-emit
build/genopinit /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-c=
ross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.md \
	  insn-conditions.md > tmp-opinit.c
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-codes.h insn-codes.h
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-extract.c insn-extract=
.c
build/genoutput /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-c=
ross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.md \
	  insn-conditions.md > tmp-output.c
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-automata.c insn-automa=
ta.c
echo timestamp > s-extract
echo timestamp > s-codes
build/genpeep /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.md \
	  insn-conditions.md > tmp-peep.c
echo timestamp > s-automata
build/genrecog /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cr=
oss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.md \
	  insn-conditions.md > tmp-recog.c
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.md:2281: '@' is redundant for output te=
mplate with single alternative
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.md:2293: '@' is redundant for output te=
mplate with single alternative
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-opinit.c insn-opinit.c
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-output.c insn-output.c
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-peep.c insn-peep.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/c-convert.c -o c-convert.o
echo timestamp > s-opinit
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.md:1221: warning: source missing a mode=
?
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.md:1234: warning: source missing a mode=
?
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.md:7351: warning: source missing a mode=
?
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/c-aux-info.c -o c-aux-info.o
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.md:7351: warning: source missing a mode=
?
echo timestamp > s-output
echo timestamp > s-peep
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/c-common.c -o c-common.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    \
		/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4=
.3.3-r14.1/gcc-4.3.3/gcc/c-opts.c -o c-opts.o -DTARGET_SYSTEM_ROOT=3D\"/opt=
/work/oe/openembedded/tmp/sysroots/sh4-angstrom-linux\"
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-recog.c insn-recog.c
echo timestamp > s-recog
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/c-format.c -o c-format.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/c-semantics.c -o c-semantics.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/c-incpath.c -o c-incpath.o
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedded/t=
mp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-li=
nux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/o=
penembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4=
.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-angstr=
om-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt=
/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r=
14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    \
	  -DGCC_INCLUDE_DIR=3D\"/opt/work/oe/openembedded/tmp/sysroots/x86_64-linu=
x/usr/sh4/lib/gcc/sh4-angstrom-linux/4.3.3/include\" -DFIXED_INCLUDE_DIR=3D=
\"/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/sh4/lib/gcc/sh4-a=
ngstrom-linux/4.3.3/include-fixed\" -DGPLUSPLUS_INCLUDE_DIR=3D\"/opt/work/o=
e/openembedded/tmp/sysroots/sh4-angstrom-linux/usr/include/c++\" -DGPLUSPLU=
S_TOOL_INCLUDE_DIR=3D\"/opt/work/oe/openembedded/tmp/sysroots/sh4-angstrom-=
linux/usr/include/c++/sh4-angstrom-linux\" -DGPLUSPLUS_BACKWARD_INCLUDE_DIR=
=3D\"/opt/work/oe/openembedded/tmp/sysroots/sh4-angstrom-linux/usr/include/=
c++/backward\" -DLOCAL_INCLUDE_DIR=3D\"/opt/work/oe/openembedded/tmp/sysroo=
ts/sh4-angstrom-linux/usr/include\" -DCROSS_INCLUDE_DIR=3D\"/opt/work/oe/op=
enembedded/tmp/sysroots/sh4-angstrom-linux${sysroot_headers_suffix}/usr/inc=
lude\" -DTOOL_INCLUDE_DIR=3D\"/opt/work/oe/openembedded/tmp/sysroots/x86_64=
-linux/usr/sh4/lib/gcc/sh4-angstrom-linux/4.3.3/../../../../sh4-angstrom-li=
nux/include\" -DPREFIX=3D\"/opt/work/oe/openembedded/tmp/sysroots/x86_64-li=
nux/usr/sh4/\" -DSTANDARD_EXEC_PREFIX=3D\"/opt/work/oe/openembedded/tmp/sys=
roots/x86_64-linux/usr/sh4/lib/gcc/\" -DTARGET_SYSTEM_ROOT=3D\"/opt/work/oe=
/openembedded/tmp/sysroots/sh4-angstrom-linux\" \
	  -c /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/cppdefault.c -o cppdefault.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/c-ppoutput.c -o c-ppoutput.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/c-cppbuiltin.c -o c-cppbuiltin.o
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedded/t=
mp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-li=
nux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/o=
penembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4=
.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-angstr=
om-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt=
/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r=
14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    \
	-DPREFIX=3D\"/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/sh4\"=
 -DBASEVER=3D"\"4.3.3\"" \
	  -c /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/prefix.c -o prefix.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/c-objc-common.c -o c-objc-common.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/c-dump.c -o c-dump.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    \
	  -DHOST_MACHINE=3D\"x86_64-pc-linux-gnu\" -DTARGET_MACHINE=3D\"sh4-angstr=
om-linux-gnu\" \
	  /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-=
4.3.3-r14.1/gcc-4.3.3/gcc/c-pch.c -o c-pch.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/c-parser.c -o c-parser.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    -I. -I. -I/o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linu=
x/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded=
/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/..=
/include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-=
initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openemb=
edded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/g=
cc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/=
gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdec=
number /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-init=
ial-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh-c.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/c-gimplify.c -o c-gimplify.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-mudflap.c -o tree-mudflap.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/c-pretty-print.c -o c-pretty-print.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/c-omp.c -o c-omp.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/main.c -o main.o
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -L/opt/work/oe/opene=
mbedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/open=
embedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembe=
dded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/genattrtab \
	    build/genattrtab.o build/rtl.o build/read-rtl.o build/ggc-none.o build=
/vec.o build/min-insn-modes.o build/gensupport.o build/print-rtl.o build/er=
rors.o ../build-x86_64-linux/libiberty/libiberty.a
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    insn-modes.c=
 -o insn-modes.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    insn-preds.c=
 -o insn-preds.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/ggc-page.c -o ggc-page.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/alias.c -o alias.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/auto-inc-dec.c -o auto-inc-dec.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/bb-reorder.c -o bb-reorder.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/bitmap.c -o bitmap.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/bt-load.c -o bt-load.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/builtins.c -o builtins.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/caller-save.c -o caller-save.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/calls.c -o calls.o
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/builtins.c: In function 'expand_builtin_memcpy':
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/builtins.c:3353: warning: cast discards qualifiers f=
rom pointer target type
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/builtins.c:3357: warning: cast discards qualifiers f=
rom pointer target type
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/builtins.c: In function 'expand_builtin_mempcpy_args=
':
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/builtins.c:3466: warning: cast discards qualifiers f=
rom pointer target type
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/builtins.c:3472: warning: cast discards qualifiers f=
rom pointer target type
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/builtins.c: In function 'expand_builtin_strncpy':
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/builtins.c:3815: warning: cast discards qualifiers f=
rom pointer target type
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/builtins.c:3821: warning: cast discards qualifiers f=
rom pointer target type
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/cfg.c -o cfg.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/cfganal.c -o cfganal.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/cfgbuild.c -o cfgbuild.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/cfgcleanup.c -o cfgcleanup.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/cfgexpand.c -o cfgexpand.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/cfghooks.c -o cfghooks.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/cfglayout.c -o cfglayout.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/cfgloop.c -o cfgloop.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/cfgloopanal.c -o cfgloopanal.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/cfgloopmanip.c -o cfgloopmanip.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/cfgrtl.c -o cfgrtl.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/combine.c -o combine.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/combine-stack-adj.c -o combine-stack-adj.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/convert.c -o convert.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/gcov-iov.o /opt/work/oe/o=
penembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4=
.3.3/gcc/gcov-iov.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/cse.c -o cse.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/cselib.c -o cselib.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/dbxout.c -o dbxout.o
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/cselib.c: In function 'entry_and_rtx_equal_p':
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/cselib.c:237: warning: cast discards qualifiers from=
 pointer target type
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/dce.c -o dce.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/ddg.c -o ddg.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/debug.c -o debug.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/df-core.c -o df-core.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/df-problems.c -o df-problems.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/df-scan.c -o df-scan.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/dfp.c -o dfp.o
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c: In function 'encode_decimal32':
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:142: warning: dereferencing type-punned pointe=
r will break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c: In function 'decode_decimal32':
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:158: warning: dereferencing type-punned pointe=
r will break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c: In function 'encode_decimal64':
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:182: warning: dereferencing type-punned pointe=
r will break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:188: warning: dereferencing type-punned pointe=
r will break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c: In function 'decode_decimal64':
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:207: warning: dereferencing type-punned pointe=
r will break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:212: warning: dereferencing type-punned pointe=
r will break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c: In function 'encode_decimal128':
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:238: warning: dereferencing type-punned pointe=
r will break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:248: warning: dereferencing type-punned pointe=
r will break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c: In function 'decode_decimal128':
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:267: warning: dereferencing type-punned pointe=
r will break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:274: warning: dereferencing type-punned pointe=
r will break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:267: warning: dereferencing pointer '({anonymo=
us})' does break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:267: note: initialized from here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:268: warning: dereferencing pointer '({anonymo=
us})' does break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:268: note: initialized from here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:269: warning: dereferencing pointer '({anonymo=
us})' does break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:269: note: initialized from here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:270: warning: dereferencing pointer '({anonymo=
us})' does break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:270: note: initialized from here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:274: warning: dereferencing pointer '({anonymo=
us})' does break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:274: note: initialized from here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:275: warning: dereferencing pointer '({anonymo=
us})' does break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:275: note: initialized from here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:276: warning: dereferencing pointer '({anonymo=
us})' does break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:276: note: initialized from here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:277: warning: dereferencing pointer '({anonymo=
us})' does break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:277: note: initialized from here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c: In function 'encode_decimal128':
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:238: warning: dereferencing pointer '({anonymo=
us})' does break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:238: note: initialized from here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:239: warning: dereferencing pointer '({anonymo=
us})' does break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:239: note: initialized from here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:240: warning: dereferencing pointer '({anonymo=
us})' does break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:240: note: initialized from here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:241: warning: dereferencing pointer '({anonymo=
us})' does break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:241: note: initialized from here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:245: warning: dereferencing pointer '({anonymo=
us})' does break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:245: note: initialized from here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:246: warning: dereferencing pointer '({anonymo=
us})' does break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:246: note: initialized from here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:247: warning: dereferencing pointer '({anonymo=
us})' does break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:247: note: initialized from here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:248: warning: dereferencing pointer '({anonymo=
us})' does break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:248: note: initialized from here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c: In function 'decode_decimal32':
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:158: warning: dereferencing pointer '({anonymo=
us})' does break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:158: note: initialized from here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c: In function 'encode_decimal64':
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:182: warning: dereferencing pointer '({anonymo=
us})' does break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:182: note: initialized from here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:183: warning: dereferencing pointer '({anonymo=
us})' does break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:183: note: initialized from here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:187: warning: dereferencing pointer '({anonymo=
us})' does break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:187: note: initialized from here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:188: warning: dereferencing pointer '({anonymo=
us})' does break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:188: note: initialized from here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c: In function 'decode_decimal64':
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:207: warning: dereferencing pointer '({anonymo=
us})' does break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:207: note: initialized from here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:208: warning: dereferencing pointer '({anonymo=
us})' does break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:208: note: initialized from here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:212: warning: dereferencing pointer '({anonymo=
us})' does break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:212: note: initialized from here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:213: warning: dereferencing pointer '({anonymo=
us})' does break strict-aliasing rules
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/dfp.c:213: note: initialized from here
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/diagnostic.c -o diagnostic.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/dojump.c -o dojump.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/dominance.c -o dominance.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/domwalk.c -o domwalk.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/double-int.c -o double-int.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/dse.c -o dse.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/dwarf2asm.c -o dwarf2asm.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/dwarf2out.c -o dwarf2out.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/ebitmap.c -o ebitmap.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/emit-rtl.c -o emit-rtl.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/et-forest.c -o et-forest.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/except.c -o except.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/explow.c -o explow.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/expmed.c -o expmed.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/expr.c -o expr.o
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/expr.c: In function 'store_expr':
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/expr.c:4559: warning: cast discards qualifiers from =
pointer target type
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/expr.c:4567: warning: cast discards qualifiers from =
pointer target type
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/fixed-value.c -o fixed-value.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/fold-const.c -o fold-const.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/function.c -o function.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/fwprop.c -o fwprop.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/gcse.c -o gcse.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    genrtl.c -o =
genrtl.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/gimple-low.c -o gimple-low.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/gimplify.c -o gimplify.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/global.c -o global.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/graph.c -o graph.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    gtype-desc.c=
 -o gtype-desc.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/haifa-sched.c -o haifa-sched.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/hooks.c -o hooks.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/ifcvt.c -o ifcvt.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/init-regs.c -o init-regs.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/integrate.c -o integrate.o
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedded/t=
mp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-li=
nux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/o=
penembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4=
.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-angstr=
om-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt=
/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r=
14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    \
	  -DLOCALEDIR=3D\"/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/=
sh4/share/locale\" \
	  -c /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/intl.c -o intl.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/jump.c -o jump.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/lambda-code.c -o lambda-code.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/lambda-mat.c -o lambda-mat.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/lambda-trans.c -o lambda-trans.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/langhooks.c -o langhooks.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/lcm.c -o lcm.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/lists.c -o lists.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/local-alloc.c -o local-alloc.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/loop-doloop.c -o loop-doloop.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/loop-init.c -o loop-init.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/loop-invariant.c -o loop-invariant.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/loop-iv.c -o loop-iv.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/loop-unroll.c -o loop-unroll.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/loop-unswitch.c -o loop-unswitch.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/lower-subreg.c -o lower-subreg.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/mode-switching.c -o mode-switching.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/omega.c -o omega.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/omp-low.c -o omp-low.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/optabs.c -o optabs.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    options.c -o=
 options.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/opts.c -o opts.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/params.c -o params.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/postreload-gcse.c -o postreload-gcse.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/postreload.c -o postreload.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/print-rtl.c -o print-rtl.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/print-tree.c -o print-tree.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/ra-conflict.c -o ra-conflict.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/real.c -o real.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/recog.c -o recog.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/reg-stack.c -o reg-stack.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/regclass.c -o regclass.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/regmove.c -o regmove.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/regrename.c -o regrename.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/regstat.c -o regstat.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/reload.c -o reload.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/reload1.c -o reload1.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/reorg.c -o reorg.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/resource.c -o resource.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/rtl-error.c -o rtl-error.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/rtl-factoring.c -o rtl-factoring.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/rtl.c -o rtl.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/rtlanal.c -o rtlanal.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/rtlhooks.c -o rtlhooks.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/sbitmap.c -o sbitmap.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/sched-deps.c -o sched-deps.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/sched-ebb.c -o sched-ebb.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/sched-rgn.c -o sched-rgn.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/sched-vis.c -o sched-vis.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/sdbout.c -o sdbout.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/see.c -o see.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/simplify-rtx.c -o simplify-rtx.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/sreal.c -o sreal.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/stack-ptr-mod.c -o stack-ptr-mod.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/stmt.c -o stmt.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/stor-layout.c -o stor-layout.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/stringpool.c -o stringpool.o
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/stringpool.c: In function 'gt_pch_n_S':
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/stringpool.c:200: warning: cast discards qualifiers =
from pointer target type
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/stringpool.c:200: warning: cast discards qualifiers =
from pointer target type
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/struct-equiv.c -o struct-equiv.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/targhooks.c -o targhooks.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/timevar.c -o timevar.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-affine.c -o tree-affine.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-cfg.c -o tree-cfg.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-cfgcleanup.c -o tree-cfgcleanup.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-chrec.c -o tree-chrec.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-complex.c -o tree-complex.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-data-ref.c -o tree-data-ref.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-dfa.c -o tree-dfa.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-dump.c -o tree-dump.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-eh.c -o tree-eh.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-gimple.c -o tree-gimple.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-if-conv.c -o tree-if-conv.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-into-ssa.c -o tree-into-ssa.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-loop-linear.c -o tree-loop-linear.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-nested.c -o tree-nested.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-nrv.c -o tree-nrv.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-object-size.c -o tree-object-size.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-optimize.c -o tree-optimize.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-outof-ssa.c -o tree-outof-ssa.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-parloops.c -o tree-parloops.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-phinodes.c -o tree-phinodes.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-predcom.c -o tree-predcom.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-pretty-print.c -o tree-pretty-print.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-scalar-evolution.c -o tree-scalar-evolution.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-sra.c -o tree-sra.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-address.c -o tree-ssa-address.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-alias.c -o tree-ssa-alias.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-alias-warnings.c -o tree-ssa-alias-warnings.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-ccp.c -o tree-ssa-ccp.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-coalesce.c -o tree-ssa-coalesce.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-copy.c -o tree-ssa-copy.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-copyrename.c -o tree-ssa-copyrename.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-dce.c -o tree-ssa-dce.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-dom.c -o tree-ssa-dom.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-dse.c -o tree-ssa-dse.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-forwprop.c -o tree-ssa-forwprop.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-ifcombine.c -o tree-ssa-ifcombine.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-live.c -o tree-ssa-live.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-loop-ch.c -o tree-ssa-loop-ch.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-loop-im.c -o tree-ssa-loop-im.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-loop-ivcanon.c -o tree-ssa-loop-ivcanon.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-loop-ivopts.c -o tree-ssa-loop-ivopts.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-loop-manip.c -o tree-ssa-loop-manip.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-loop-niter.c -o tree-ssa-loop-niter.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-loop-prefetch.c -o tree-ssa-loop-prefetch.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-loop-unswitch.c -o tree-ssa-loop-unswitch.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-loop.c -o tree-ssa-loop.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-math-opts.c -o tree-ssa-math-opts.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-operands.c -o tree-ssa-operands.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-phiopt.c -o tree-ssa-phiopt.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-pre.c -o tree-ssa-pre.o
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-phiopt.c: In function 'name_to_bb_hash':
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-phiopt.c:1118: warning: cast discards quali=
fiers from pointer target type
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-phiopt.c:1119: warning: cast discards quali=
fiers from pointer target type
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-propagate.c -o tree-ssa-propagate.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-reassoc.c -o tree-ssa-reassoc.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-sccvn.c -o tree-ssa-sccvn.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-sink.c -o tree-ssa-sink.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-structalias.c -o tree-ssa-structalias.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-ter.c -o tree-ssa-ter.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-threadedge.c -o tree-ssa-threadedge.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-threadupdate.c -o tree-ssa-threadupdate.o
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-sccvn.c: In function 'run_scc_vn':
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-sccvn.c:1923: warning: 'iter.mayuse_index' =
may be used uninitialized in this function
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-sccvn.c:1923: note: 'iter.mayuse_index' was=
 declared here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-sccvn.c:1923: warning: 'iter.vuse_index' ma=
y be used uninitialized in this function
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-sccvn.c:1923: note: 'iter.vuse_index' was d=
eclared here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-sccvn.c:1923: warning: 'iter.phi_stmt' may =
be used uninitialized in this function
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-sccvn.c:1923: note: 'iter.phi_stmt' was dec=
lared here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-sccvn.c:1923: warning: 'iter.num_phi' may b=
e used uninitialized in this function
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-sccvn.c:1923: note: 'iter.num_phi' was decl=
ared here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-sccvn.c:1923: warning: 'iter.phi_i' may be =
used uninitialized in this function
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-sccvn.c:1923: note: 'iter.phi_i' was declar=
ed here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-sccvn.c:1923: warning: 'iter.iter_type' may=
 be used uninitialized in this function
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-sccvn.c:1923: note: 'iter.iter_type' was de=
clared here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-sccvn.c:1923: warning: 'iter.mayuses' may b=
e used uninitialized in this function
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-sccvn.c:1923: note: 'iter.mayuses' was decl=
ared here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-sccvn.c:1923: warning: 'iter.vdefs' may be =
used uninitialized in this function
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-sccvn.c:1923: note: 'iter.vdefs' was declar=
ed here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-sccvn.c:1923: warning: 'iter.vuses' may be =
used uninitialized in this function
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-sccvn.c:1923: note: 'iter.vuses' was declar=
ed here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-sccvn.c:1923: warning: 'iter.uses' may be u=
sed uninitialized in this function
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-sccvn.c:1923: note: 'iter.uses' was declare=
d here
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-sccvn.c:1923: warning: 'iter.defs' may be u=
sed uninitialized in this function
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/tree-ssa-sccvn.c:1923: note: 'iter.defs' was declare=
d here
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa-uncprop.c -o tree-ssa-uncprop.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssa.c -o tree-ssa.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-ssanames.c -o tree-ssanames.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-stdarg.c -o tree-stdarg.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-tailcall.c -o tree-tailcall.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-vect-analyze.c -o tree-vect-analyze.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-vect-generic.c -o tree-vect-generic.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-vect-patterns.c -o tree-vect-patterns.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-vect-transform.c -o tree-vect-transform.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-vectorizer.c -o tree-vectorizer.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-vn.c -o tree-vn.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-vrp.c -o tree-vrp.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree.c -o tree.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/var-tracking.c -o var-tracking.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/varasm.c -o varasm.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/varray.c -o varray.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/vmsdbgout.c -o vmsdbgout.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/web.c -o web.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/xcoffout.c -o xcoffout.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    \
		/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4=
.3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.c -o sh.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/cgraph.c -o cgraph.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/cgraphbuild.c -o cgraphbuild.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/cgraphunit.c -o cgraphunit.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/ipa-cp.c -o ipa-cp.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/ipa-prop.c -o ipa-prop.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/ipa-pure-const.c -o ipa-pure-const.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/ipa-reference.c -o ipa-reference.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/ipa-type-escape.c -o ipa-type-escape.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/ipa-utils.c -o ipa-utils.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/ipa.c -o ipa.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/matrix-reorg.c -o matrix-reorg.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-inline.c -o tree-inline.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-nomudflap.c -o tree-nomudflap.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/varpool.c -o varpool.o
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedded/t=
mp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-li=
nux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/o=
penembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4=
.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-angstr=
om-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt=
/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r=
14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber     \
	-DTARGET_MACHINE=3D\"sh4-angstrom-linux\" \
	-c /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial=
-4.3.3-r14.1/gcc-4.3.3/gcc/collect2.c -o collect2.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tlink.c -o tlink.o
(SHLIB_LINK=3D'/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cr=
oss-initial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angstrom-linux/./g=
cc/xgcc -B/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angstrom-linux/./gcc/ -=
ml -m4 -isystem/opt/work/oe/openembedded/tmp/sysroots/sh4-angstrom-linux/us=
r/include -B/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/sh4/sh4=
-angstrom-linux/bin/ -B/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/=
usr/sh4/sh4-angstrom-linux/lib/ -isystem /opt/work/oe/openembedded/tmp/sysr=
oots/x86_64-linux/usr/sh4/sh4-angstrom-linux/include -isystem /opt/work/oe/=
openembedded/tmp/sysroots/x86_64-linux/usr/sh4/sh4-angstrom-linux/sys-inclu=
de -O2  -g -Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE   -W -Wall -Wwrite-stri=
ngs -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition  -isyst=
em ./include  -fPIC -g  -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED -Dinhibit_lib=
c -shared -nodefaultlibs -Wl,--soname=3D@shlib_base_name@.so.1 -Wl,--versio=
n-script=3D@shlib_map_file@ -o @multilib_dir@/@shlib_base_name@.so.1.tmp @m=
ultilib_flags@ @shlib_objs@ -lc && rm -f @multilib_dir@/@shlib_base_name@.s=
o && if [ -f @multilib_dir@/@shlib_base_name@.so.1 ]; then mv -f @multilib_=
dir@/@shlib_base_name@.so.1 @multilib_dir@/@shlib_base_name@.so.1.backup; e=
lse true; fi && mv @multilib_dir@/@shlib_base_name@.so.1.tmp @multilib_dir@=
/@shlib_base_name@.so.1 && ln -s @shlib_base_name@.so.1 @multilib_dir@/@shl=
ib_base_name@.so'; \
	gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings =
-Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-f=
ormat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno=
-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-l=
inux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/=
openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-=
4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-angst=
rom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    \
  -DSTANDARD_STARTFILE_PREFIX=3D\"../../../\" -DSTANDARD_EXEC_PREFIX=3D\"/o=
pt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/sh4/lib/gcc/\" -DSTAN=
DARD_LIBEXEC_PREFIX=3D\"/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux=
/usr/sh4/libexec/gcc/\" -DDEFAULT_TARGET_VERSION=3D\"4.3.3\" -DDEFAULT_TARG=
ET_MACHINE=3D\"sh4-angstrom-linux\" -DSTANDARD_BINDIR_PREFIX=3D\"/opt/work/=
oe/openembedded/tmp/sysroots/x86_64-linux/usr/sh4/bin/\" -DTOOLDIR_BASE_PRE=
FIX=3D\"../../../../\" -DTARGET_SYSTEM_ROOT=3D\"/opt/work/oe/openembedded/t=
mp/sysroots/sh4-angstrom-linux\"  `test "X${SHLIB_LINK}" =3D "X" || test "n=
o" !=3D "yes" || echo "-DENABLE_SHARED_LIBGCC"` \
  -c /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/gcc.c -o gcc.o)
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    -o gcc-optio=
ns.o -DGCC_DRIVER options.c
(SHLIB_LINK=3D'/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cr=
oss-initial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angstrom-linux/./g=
cc/xgcc -B/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angstrom-linux/./gcc/ -=
ml -m4 -isystem/opt/work/oe/openembedded/tmp/sysroots/sh4-angstrom-linux/us=
r/include -B/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/sh4/sh4=
-angstrom-linux/bin/ -B/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/=
usr/sh4/sh4-angstrom-linux/lib/ -isystem /opt/work/oe/openembedded/tmp/sysr=
oots/x86_64-linux/usr/sh4/sh4-angstrom-linux/include -isystem /opt/work/oe/=
openembedded/tmp/sysroots/x86_64-linux/usr/sh4/sh4-angstrom-linux/sys-inclu=
de -O2  -g -Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE   -W -Wall -Wwrite-stri=
ngs -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition  -isyst=
em ./include  -fPIC -g  -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED -Dinhibit_lib=
c -shared -nodefaultlibs -Wl,--soname=3D@shlib_base_name@.so.1 -Wl,--versio=
n-script=3D@shlib_map_file@ -o @multilib_dir@/@shlib_base_name@.so.1.tmp @m=
ultilib_flags@ @shlib_objs@ -lc && rm -f @multilib_dir@/@shlib_base_name@.s=
o && if [ -f @multilib_dir@/@shlib_base_name@.so.1 ]; then mv -f @multilib_=
dir@/@shlib_base_name@.so.1 @multilib_dir@/@shlib_base_name@.so.1.backup; e=
lse true; fi && mv @multilib_dir@/@shlib_base_name@.so.1.tmp @multilib_dir@=
/@shlib_base_name@.so.1 && ln -s @shlib_base_name@.so.1 @multilib_dir@/@shl=
ib_base_name@.so'; \
	gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/inc=
lude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings =
-Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-f=
ormat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno=
-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-l=
inux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/=
openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-=
4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-angst=
rom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    \
  -DSTANDARD_STARTFILE_PREFIX=3D\"../../../\" -DSTANDARD_EXEC_PREFIX=3D\"/o=
pt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/sh4/lib/gcc/\" -DSTAN=
DARD_LIBEXEC_PREFIX=3D\"/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux=
/usr/sh4/libexec/gcc/\" -DDEFAULT_TARGET_VERSION=3D\"4.3.3\" -DDEFAULT_TARG=
ET_MACHINE=3D\"sh4-angstrom-linux\" -DSTANDARD_BINDIR_PREFIX=3D\"/opt/work/=
oe/openembedded/tmp/sysroots/x86_64-linux/usr/sh4/bin/\" -DTOOLDIR_BASE_PRE=
FIX=3D\"../../../../\" -DTARGET_SYSTEM_ROOT=3D\"/opt/work/oe/openembedded/t=
mp/sysroots/sh4-angstrom-linux\"  `test "X${SHLIB_LINK}" =3D "X" || test "n=
o" !=3D "yes" || echo "-DENABLE_SHARED_LIBGCC"` \
  -c /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/gccspec.c -o gccspec.o)
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/cppspec.c -o cppspec.o
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/gcc.c: In function 'execute':
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/gcc.c:3089: warning: cast discards qualifiers from p=
ointer target type
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/gcc.c: In function 'retry_ice':
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/gcc.c:6208: warning: cast discards qualifiers from p=
ointer target type
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/gcc.c:6210: warning: cast discards qualifiers from p=
ointer target type
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/c-lang.c -o c-lang.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/attribs.c -o attribs.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/c-errors.c -o c-errors.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/c-lex.c -o c-lex.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/c-pragma.c -o c-pragma.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/c-decl.c -o c-decl.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/c-typeck.c -o c-typeck.o
build/genattrtab /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-=
cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/config/sh/sh.md \
	  insn-conditions.md > tmp-attrtab.c
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-attrtab.c insn-attrtab=
.c
echo timestamp > s-attrtab
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    insn-automat=
a.c -o insn-automata.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    insn-emit.c =
-o insn-emit.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    insn-extract=
.c -o insn-extract.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    insn-opinit.=
c -o insn-opinit.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    insn-output.=
c -o insn-output.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    insn-peep.c =
-o insn-peep.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    insn-recog.c=
 -o insn-recog.o
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -L/opt/work/oe/opene=
mbedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/open=
embedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembe=
dded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 build/gcov-iov.o -o build/gc=
ov-iov
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -L/opt/work/oe/openembedded/tmp/sysro=
ots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/openembedded/tmp/sysr=
oots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembedded/tmp/sysroots=
/x86_64-linux/usr/lib -Wl,-O1 -o Tcollect2 \
		collect2.o tlink.o intl.o version.o ../libcpp/libcpp.a   ../libiberty/lib=
iberty.a ../libdecnumber/libdecnumber.a=20
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -L/opt/work/oe/openembedded/tmp/sysro=
ots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/openembedded/tmp/sysr=
oots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembedded/tmp/sysroots=
/x86_64-linux/usr/lib -Wl,-O1 -o xgcc gcc.o opts-common.o gcc-options.o gcc=
spec.o \
	  intl.o prefix.o version.o  ../libcpp/libcpp.a   ../libiberty/libiberty.a=
 ../libdecnumber/libdecnumber.a
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -L/opt/work/oe/openembedded/tmp/sysro=
ots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/openembedded/tmp/sysr=
oots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembedded/tmp/sysroots=
/x86_64-linux/usr/lib -Wl,-O1 -o cpp gcc.o opts-common.o gcc-options.o cpps=
pec.o \
	  intl.o prefix.o version.o  ../libcpp/libcpp.a   ../libiberty/libiberty.a=
 ../libdecnumber/libdecnumber.a
mv -f Tcollect2 collect2
build/gcov-iov '4.3.3' '' \
	    > tmp-gcov-iov.h
cp xgcc gcc-cross
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angstrom-linux/./gcc/xgcc -B/opt/=
work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r1=
4.1/gcc-4.3.3/build.x86_64-linux.sh4-angstrom-linux/./gcc/ -ml -m4 -isystem=
/opt/work/oe/openembedded/tmp/sysroots/sh4-angstrom-linux/usr/include -B/op=
t/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/sh4/sh4-angstrom-linux=
/bin/ -B/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/sh4/sh4-ang=
strom-linux/lib/ -isystem /opt/work/oe/openembedded/tmp/sysroots/x86_64-lin=
ux/usr/sh4/sh4-angstrom-linux/include -isystem /opt/work/oe/openembedded/tm=
p/sysroots/x86_64-linux/usr/sh4/sh4-angstrom-linux/sys-include -dumpspecs >=
 tmp-specs
mv tmp-specs specs
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    insn-attrtab=
.c -o insn-attrtab.o
: > tmp-libgcc.mvars
echo LIB1ASMFUNCS =3D '_ashiftrt _ashiftrt_n _ashiftlt _lshiftrt _movmem _m=
ovmem_i4 _mulsi3 _sdivsi3 _sdivsi3_i4 _udivsi3 _udivsi3_i4 _set_fpscr _div_=
table _udiv_qrnnd_16 _ic_invalidate _ic_invalidate_array' >> tmp-libgcc.mva=
rs
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-gcov-iov.h gcov-iov.h
echo LIB1ASMSRC =3D 'sh/lib1funcs.asm' >> tmp-libgcc.mvars
echo timestamp > s-iov
echo LIB2FUNCS_ST =3D '_eprintf __gcc_bcmp' >> tmp-libgcc.mvars
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/coverage.c -o coverage.o
echo LIB2FUNCS_EXCLUDE =3D '' >> tmp-libgcc.mvars
echo LIBGCOV =3D '_gcov _gcov_merge_add _gcov_merge_single _gcov_merge_delt=
a _gcov_fork _gcov_execl _gcov_execlp _gcov_execle _gcov_execv _gcov_execvp=
 _gcov_execve _gcov_interval_profiler _gcov_pow2_profiler _gcov_one_value_p=
rofiler _gcov_indirect_call_profiler _gcov_average_profiler _gcov_ior_profi=
ler _gcov_merge_ior' >> tmp-libgcc.mvars
echo LIB2ADD =3D '$(gcc_srcdir)/config/sh/linux-atomic.asm ' >> tmp-libgcc.=
mvars
echo LIB2ADD_ST =3D ' ' >> tmp-libgcc.mvars
echo LIB2ADDEH =3D '$(gcc_srcdir)/unwind-dw2.c $(gcc_srcdir)/unwind-dw2-fde=
-glibc.c $(gcc_srcdir)/unwind-sjlj.c $(gcc_srcdir)/gthr-gnat.c $(gcc_srcdir=
)/unwind-c.c $(gcc_srcdir)/emutls.c ' >> tmp-libgcc.mvars
echo LIB2ADDEHSTATIC =3D '$(gcc_srcdir)/unwind-dw2.c $(gcc_srcdir)/unwind-d=
w2-fde-glibc.c $(gcc_srcdir)/unwind-sjlj.c $(gcc_srcdir)/gthr-gnat.c $(gcc_=
srcdir)/unwind-c.c $(gcc_srcdir)/emutls.c ' >> tmp-libgcc.mvars
echo LIB2ADDEHSHARED =3D '$(gcc_srcdir)/unwind-dw2.c $(gcc_srcdir)/unwind-d=
w2-fde-glibc.c $(gcc_srcdir)/unwind-sjlj.c $(gcc_srcdir)/gthr-gnat.c $(gcc_=
srcdir)/unwind-c.c $(gcc_srcdir)/emutls.c ' >> tmp-libgcc.mvars
echo LIB2_SIDITI_CONV_FUNCS =3D '' >> tmp-libgcc.mvars
echo LIBUNWIND =3D ' ' >> tmp-libgcc.mvars
echo SHLIBUNWIND_LINK =3D '' >> tmp-libgcc.mvars
echo SHLIBUNWIND_INSTALL =3D '' >> tmp-libgcc.mvars
echo FPBIT =3D 'fp-bit.c' >> tmp-libgcc.mvars
echo FPBIT_FUNCS =3D '_pack_sf _unpack_sf _addsub_sf _mul_sf _div_sf _fpcmp=
_parts_sf _compare_sf _eq_sf _ne_sf _gt_sf _ge_sf _lt_sf _le_sf _unord_sf _=
si_to_sf _sf_to_si _negate_sf _make_sf _sf_to_df _sf_to_tf _thenan_sf _sf_t=
o_usi _usi_to_sf' >> tmp-libgcc.mvars
echo LIB2_DIVMOD_FUNCS =3D '_divdi3 _moddi3 _udivdi3 _umoddi3 _udiv_w_sdiv =
_udivmoddi4' >> tmp-libgcc.mvars
echo DPBIT =3D 'dp-bit.c' >> tmp-libgcc.mvars
echo DPBIT_FUNCS =3D '_pack_df _unpack_df _addsub_df _mul_df _div_df _fpcmp=
_parts_df _compare_df _eq_df _ne_df _gt_df _ge_df _lt_df _le_df _unord_df _=
si_to_df _df_to_si _negate_df _make_df _df_to_sf _df_to_tf _thenan_df _df_t=
o_usi _usi_to_df' >> tmp-libgcc.mvars
echo TPBIT =3D '' >> tmp-libgcc.mvars
echo TPBIT_FUNCS =3D '_pack_tf _unpack_tf _addsub_tf _mul_tf _div_tf _fpcmp=
_parts_tf _compare_tf _eq_tf _ne_tf _gt_tf _ge_tf _lt_tf _le_tf _unord_tf _=
si_to_tf _tf_to_si _negate_tf _make_tf _tf_to_df _tf_to_sf _thenan_tf _tf_t=
o_usi _usi_to_tf' >> tmp-libgcc.mvars
echo DFP_ENABLE =3D '' >> tmp-libgcc.mvars
echo DFP_CFLAGS=3D'' >> tmp-libgcc.mvars
echo D32PBIT=3D'' >> tmp-libgcc.mvars
echo D32PBIT_FUNCS=3D'_addsub_sd _div_sd _mul_sd _plus_sd _minus_sd _eq_sd =
_ne_sd _lt_sd _gt_sd _le_sd _ge_sd _sd_to_si _sd_to_di _sd_to_usi _sd_to_ud=
i _si_to_sd _di_to_sd _usi_to_sd _udi_to_sd _sd_to_sf _sd_to_df _sd_to_xf _=
sd_to_tf _sf_to_sd _df_to_sd _xf_to_sd _tf_to_sd _sd_to_dd _sd_to_td _unord=
_sd _conv_sd' >> tmp-libgcc.mvars
echo D64PBIT=3D'' >> tmp-libgcc.mvars
echo D64PBIT_FUNCS=3D'_addsub_dd _div_dd _mul_dd _plus_dd _minus_dd _eq_dd =
_ne_dd _lt_dd _gt_dd _le_dd _ge_dd _dd_to_si _dd_to_di _dd_to_usi _dd_to_ud=
i _si_to_dd _di_to_dd _usi_to_dd _udi_to_dd _dd_to_sf _dd_to_df _dd_to_xf _=
dd_to_tf _sf_to_dd _df_to_dd _xf_to_dd _tf_to_dd _dd_to_sd _dd_to_td _unord=
_dd _conv_dd' >> tmp-libgcc.mvars
echo D128PBIT=3D'' >> tmp-libgcc.mvars
echo D128PBIT_FUNCS=3D'_addsub_td _div_td _mul_td _plus_td _minus_td _eq_td=
 _ne_td _lt_td _gt_td _le_td _ge_td _td_to_si _td_to_di _td_to_usi _td_to_u=
di _si_to_td _di_to_td _usi_to_td _udi_to_td _td_to_sf _td_to_df _td_to_xf =
_td_to_tf _sf_to_td _df_to_td _xf_to_td _tf_to_td _td_to_sd _td_to_dd _unor=
d_td _conv_td' >> tmp-libgcc.mvars
echo GCC_EXTRA_PARTS =3D 'crtbegin.o crtbeginS.o crtbeginT.o crtend.o crten=
dS.o' >> tmp-libgcc.mvars
echo SHLIB_LINK =3D '$(GCC_FOR_TARGET) -O2  -g -Os -DIN_GCC -DCROSS_DIRECTO=
RY_STRUCTURE   -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-proto=
types -Wold-style-definition  -isystem ./include  -fPIC -g  -DIN_LIBGCC2 -D=
__GCC_FLOAT_NOT_NEEDED -Dinhibit_libc -shared -nodefaultlibs -Wl,--soname=
=3D@shlib_base_name@.so.1 -Wl,--version-script=3D@shlib_map_file@ -o @multi=
lib_dir@/@shlib_base_name@.so.1.tmp @multilib_flags@ @shlib_objs@ -lc && rm=
 -f @multilib_dir@/@shlib_base_name@.so && if [ -f @multilib_dir@/@shlib_ba=
se_name@.so.1 ]; then mv -f @multilib_dir@/@shlib_base_name@.so.1 @multilib=
_dir@/@shlib_base_name@.so.1.backup; else true; fi && mv @multilib_dir@/@sh=
lib_base_name@.so.1.tmp @multilib_dir@/@shlib_base_name@.so.1 && ln -s @shl=
ib_base_name@.so.1 @multilib_dir@/@shlib_base_name@.so' >> tmp-libgcc.mvars
echo SHLIB_INSTALL =3D '$(mkinstalldirs) $(DESTDIR)$(slibdir)@shlib_slibdir=
_qual@; /opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/bin/install=
 -c -m 644 @multilib_dir@/@shlib_base_name@.so.1 $(DESTDIR)$(slibdir)@shlib=
_slibdir_qual@/@shlib_base_name@.so.1; rm -f $(DESTDIR)$(slibdir)@shlib_sli=
bdir_qual@/@shlib_base_name@.so; ln -s @shlib_base_name@.so.1 $(DESTDIR)$(s=
libdir)@shlib_slibdir_qual@/@shlib_base_name@.so' >> tmp-libgcc.mvars
echo SHLIB_EXT =3D '.so' >> tmp-libgcc.mvars
echo SHLIB_MKMAP =3D '$(gcc_srcdir)/mkmap-symver.awk ' >> tmp-libgcc.mvars
echo SHLIB_MKMAP_OPTS =3D '' >> tmp-libgcc.mvars
echo SHLIB_MAPFILES =3D '$(gcc_srcdir)/libgcc-std.ver $(gcc_srcdir)/config/=
libgcc-glibc.ver ' >> tmp-libgcc.mvars
echo SHLIB_NM_FLAGS =3D '-pg' >> tmp-libgcc.mvars
echo LIBGCC2_CFLAGS =3D '-O2  -g -Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  =
 -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-st=
yle-definition  -isystem ./include  -fPIC -g  -DIN_LIBGCC2 -D__GCC_FLOAT_NO=
T_NEEDED -Dinhibit_libc' >> tmp-libgcc.mvars
echo CRTSTUFF_CFLAGS =3D '-O2 -g -Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  =
 -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-st=
yle-definition  -isystem ./include  -I. -I. -I/opt/work/oe/openembedded/tmp=
/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt=
/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r=
14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linu=
x/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/ope=
nembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3=
.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/w=
ork/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14=
.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber  -g0 -finhibit-size-=
directive -fno-inline-functions -fno-exceptions -fno-zero-initialized-in-bs=
s -fno-toplevel-reorder -fno-tree-vectorize -Dinhibit_libc' >> tmp-libgcc.m=
vars
echo CRTSTUFF_T_CFLAGS =3D '' >> tmp-libgcc.mvars
echo CRTSTUFF_T_CFLAGS_S =3D '-fPIC' >> tmp-libgcc.mvars
mv tmp-libgcc.mvars libgcc.mvars
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/final.c -o final.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/modulo-sched.c -o modulo-sched.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/passes.c -o passes.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/predict.c -o predict.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/profile.c -o profile.o
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedded/t=
mp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-li=
nux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/o=
penembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4=
.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-angstr=
om-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt=
/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r=
14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    \
	  -DTARGET_NAME=3D\"sh4-angstrom-linux\" \
	  -c /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initi=
al-4.3.3-r14.1/gcc-4.3.3/gcc/toplev.c -o toplev.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tracer.c -o tracer.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/tree-profile.c -o tree-profile.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/value-prof.c -o value-prof.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/ipa-inline.c -o ipa-inline.o
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/value-prof.c: In function 'tree_stringop_fixed_value=
':
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/gcc/value-prof.c:1268: warning: suggest parentheses arou=
nd operand of '!' or change '&' to '&&' or '!' to '~'
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/ipa-struct-reorg.c -o ipa-struct-reorg.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/gcov.c -o gcov.o
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/gcov-dump.c -o gcov-dump.o
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -L/opt/work/oe/openembedded/tmp/sysro=
ots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/openembedded/tmp/sysr=
oots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembedded/tmp/sysroots=
/x86_64-linux/usr/lib -Wl,-O1 gcov-dump.o version.o errors.o ../libcpp/libc=
pp.a   ../libiberty/libiberty.a ../libdecnumber/libdecnumber.a -o gcov-dump
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -L/opt/work/oe/openembedded/tmp/sysro=
ots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/openembedded/tmp/sysr=
oots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembedded/tmp/sysroots=
/x86_64-linux/usr/lib -Wl,-O1 gcov.o intl.o version.o errors.o ../libcpp/li=
bcpp.a   ../libiberty/libiberty.a ../libdecnumber/libdecnumber.a -o gcov
rm -rf libbackend.a
ar rc libbackend.a insn-attrtab.o insn-automata.o insn-emit.o insn-extract.=
o insn-modes.o insn-opinit.o insn-output.o insn-peep.o insn-preds.o insn-re=
cog.o ggc-page.o alias.o alloc-pool.o auto-inc-dec.o bb-reorder.o bitmap.o =
bt-load.o builtins.o caller-save.o calls.o cfg.o cfganal.o cfgbuild.o cfgcl=
eanup.o cfgexpand.o cfghooks.o cfglayout.o cfgloop.o cfgloopanal.o cfgloopm=
anip.o cfgrtl.o combine.o combine-stack-adj.o convert.o coverage.o cse.o cs=
elib.o dbxout.o dbgcnt.o dce.o ddg.o debug.o df-core.o df-problems.o df-sca=
n.o dfp.o diagnostic.o dojump.o dominance.o domwalk.o double-int.o dse.o dw=
arf2asm.o dwarf2out.o ebitmap.o emit-rtl.o et-forest.o except.o explow.o ex=
pmed.o expr.o final.o fixed-value.o fold-const.o function.o fwprop.o gcse.o=
 genrtl.o ggc-common.o gimple-low.o gimplify.o global.o graph.o graphds.o g=
type-desc.o haifa-sched.o hooks.o ifcvt.o init-regs.o integrate.o intl.o ju=
mp.o lambda-code.o lambda-mat.o lambda-trans.o langhooks.o lcm.o lists.o lo=
cal-alloc.o loop-doloop.o loop-init.o loop-invariant.o loop-iv.o loop-unrol=
l.o loop-unswitch.o lower-subreg.o mode-switching.o modulo-sched.o omega.o =
omp-low.o optabs.o options.o opts-common.o opts.o params.o passes.o pointer=
-set.o postreload-gcse.o postreload.o predict.o pretty-print.o print-rtl.o =
print-tree.o profile.o ra-conflict.o real.o recog.o reg-stack.o regclass.o =
regmove.o regrename.o regstat.o reload.o reload1.o reorg.o resource.o rtl-e=
rror.o rtl-factoring.o rtl.o rtlanal.o rtlhooks.o sbitmap.o sched-deps.o sc=
hed-ebb.o sched-rgn.o sched-vis.o sdbout.o see.o simplify-rtx.o sparseset.o=
 sreal.o stack-ptr-mod.o stmt.o stor-layout.o stringpool.o struct-equiv.o t=
arghooks.o timevar.o toplev.o tracer.o tree-affine.o tree-cfg.o tree-cfgcle=
anup.o tree-chrec.o tree-complex.o tree-data-ref.o tree-dfa.o tree-dump.o t=
ree-eh.o tree-gimple.o tree-if-conv.o tree-into-ssa.o tree-iterator.o tree-=
loop-linear.o tree-nested.o tree-nrv.o tree-object-size.o tree-optimize.o t=
ree-outof-ssa.o tree-parloops.o tree-phinodes.o tree-predcom.o tree-pretty-=
print.o tree-profile.o tree-scalar-evolution.o tree-sra.o tree-ssa-address.=
o tree-ssa-alias.o tree-ssa-alias-warnings.o tree-ssa-ccp.o tree-ssa-coales=
ce.o tree-ssa-copy.o tree-ssa-copyrename.o tree-ssa-dce.o tree-ssa-dom.o tr=
ee-ssa-dse.o tree-ssa-forwprop.o tree-ssa-ifcombine.o tree-ssa-live.o tree-=
ssa-loop-ch.o tree-ssa-loop-im.o tree-ssa-loop-ivcanon.o tree-ssa-loop-ivop=
ts.o tree-ssa-loop-manip.o tree-ssa-loop-niter.o tree-ssa-loop-prefetch.o t=
ree-ssa-loop-unswitch.o tree-ssa-loop.o tree-ssa-math-opts.o tree-ssa-opera=
nds.o tree-ssa-phiopt.o tree-ssa-pre.o tree-ssa-propagate.o tree-ssa-reasso=
c.o tree-ssa-sccvn.o tree-ssa-sink.o tree-ssa-structalias.o tree-ssa-ter.o =
tree-ssa-threadedge.o tree-ssa-threadupdate.o tree-ssa-uncprop.o tree-ssa.o=
 tree-ssanames.o tree-stdarg.o tree-tailcall.o tree-vect-analyze.o tree-vec=
t-generic.o tree-vect-patterns.o tree-vect-transform.o tree-vectorizer.o tr=
ee-vn.o tree-vrp.o tree.o value-prof.o var-tracking.o varasm.o varray.o vec=
.o version.o vmsdbgout.o web.o xcoffout.o sh.o  host-linux.o cgraph.o cgrap=
hbuild.o cgraphunit.o ipa-cp.o ipa-inline.o ipa-prop.o ipa-pure-const.o ipa=
-reference.o ipa-struct-reorg.o ipa-type-escape.o ipa-utils.o ipa.o matrix-=
reorg.o tree-inline.o tree-nomudflap.o varpool.o
ranlib  libbackend.a
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -L/opt/work/oe/openembedded/tmp/sysro=
ots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/openembedded/tmp/sysr=
oots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembedded/tmp/sysroots=
/x86_64-linux/usr/lib -Wl,-O1 -o cc1-dummy c-lang.o stub-objc.o attribs.o c=
-errors.o c-lex.o c-pragma.o c-decl.o c-typeck.o c-convert.o c-aux-info.o c=
-common.o c-opts.o c-format.o c-semantics.o c-incpath.o cppdefault.o c-ppou=
tput.o c-cppbuiltin.o prefix.o c-objc-common.o c-dump.o c-pch.o c-parser.o =
sh-c.o c-gimplify.o tree-mudflap.o c-pretty-print.o c-omp.o dummy-checksum.=
o \
	  main.o  libbackend.a ../libcpp/libcpp.a ../libdecnumber/libdecnumber.a .=
./libcpp/libcpp.a   ../libiberty/libiberty.a ../libdecnumber/libdecnumber.a=
 -lmpfr -lgmp
build/genchecksum cc1-dummy > cc1-checksum.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -I. -I. -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -=
I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.=
3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/o=
e/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gc=
c-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/openembedded/tmp/work/sh4-ang=
strom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../libdecnumber    cc1-checksum=
.c -o cc1-checksum.o
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -L/opt/work/oe/openembedded/tmp/sysro=
ots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/openembedded/tmp/sysr=
oots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembedded/tmp/sysroots=
/x86_64-linux/usr/lib -Wl,-O1 -o cc1 c-lang.o stub-objc.o attribs.o c-error=
s.o c-lex.o c-pragma.o c-decl.o c-typeck.o c-convert.o c-aux-info.o c-commo=
n.o c-opts.o c-format.o c-semantics.o c-incpath.o cppdefault.o c-ppoutput.o=
 c-cppbuiltin.o prefix.o c-objc-common.o c-dump.o c-pch.o c-parser.o sh-c.o=
 c-gimplify.o tree-mudflap.o c-pretty-print.o c-omp.o cc1-checksum.o \
	  main.o  libbackend.a ../libcpp/libcpp.a ../libdecnumber/libdecnumber.a .=
./libcpp/libcpp.a   ../libiberty/libiberty.a ../libdecnumber/libdecnumber.a=
 -lmpfr -lgmp
echo | /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-init=
ial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angstrom-linux/./gcc/xgcc =
-B/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4=
.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angstrom-linux/./gcc/ -ml -m4 -=
isystem/opt/work/oe/openembedded/tmp/sysroots/sh4-angstrom-linux/usr/includ=
e -B/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/sh4/sh4-angstro=
m-linux/bin/ -B/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/sh4/=
sh4-angstrom-linux/lib/ -isystem /opt/work/oe/openembedded/tmp/sysroots/x86=
_64-linux/usr/sh4/sh4-angstrom-linux/include -isystem /opt/work/oe/openembe=
dded/tmp/sysroots/x86_64-linux/usr/sh4/sh4-angstrom-linux/sys-include -E -d=
M - | \
	  sed -n -e 's/^#define \([^_][a-zA-Z0-9_]*\).*/\1/p' \
		 -e 's/^#define \(_[^_A-Z][a-zA-Z0-9_]*\).*/\1/p' | \
	  sort -u > tmp-macro_list
if /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-=
4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angstrom-linux/./gcc/xgcc -B/o=
pt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3=
-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angstrom-linux/./gcc/ -ml -m4 -isys=
tem/opt/work/oe/openembedded/tmp/sysroots/sh4-angstrom-linux/usr/include -B=
/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/sh4/sh4-angstrom-li=
nux/bin/ -B/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/sh4/sh4-=
angstrom-linux/lib/ -isystem /opt/work/oe/openembedded/tmp/sysroots/x86_64-=
linux/usr/sh4/sh4-angstrom-linux/include -isystem /opt/work/oe/openembedded=
/tmp/sysroots/x86_64-linux/usr/sh4/sh4-angstrom-linux/sys-include -print-sy=
sroot-headers-suffix > /dev/null 2>&1; then \
	  set -e; for ml in `/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angstrom-li=
nux/./gcc/xgcc -B/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-=
cross-initial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angstrom-linux/.=
/gcc/ -ml -m4 -isystem/opt/work/oe/openembedded/tmp/sysroots/sh4-angstrom-l=
inux/usr/include -B/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/=
sh4/sh4-angstrom-linux/bin/ -B/opt/work/oe/openembedded/tmp/sysroots/x86_64=
-linux/usr/sh4/sh4-angstrom-linux/lib/ -isystem /opt/work/oe/openembedded/t=
mp/sysroots/x86_64-linux/usr/sh4/sh4-angstrom-linux/include -isystem /opt/w=
ork/oe/openembedded/tmp/sysroots/x86_64-linux/usr/sh4/sh4-angstrom-linux/sy=
s-include -print-multi-lib`; do \
	    multi_dir=3D`echo ${ml} | sed -e 's/;.*$//'`; \
	    flags=3D`echo ${ml} | sed -e 's/^[^;]*;//' -e 's/@/ -/g'`; \
	    sfx=3D`/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross=
-initial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angstrom-linux/./gcc/=
xgcc -B/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-init=
ial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angstrom-linux/./gcc/ -ml =
-m4 -isystem/opt/work/oe/openembedded/tmp/sysroots/sh4-angstrom-linux/usr/i=
nclude -B/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/sh4/sh4-an=
gstrom-linux/bin/ -B/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr=
/sh4/sh4-angstrom-linux/lib/ -isystem /opt/work/oe/openembedded/tmp/sysroot=
s/x86_64-linux/usr/sh4/sh4-angstrom-linux/include -isystem /opt/work/oe/ope=
nembedded/tmp/sysroots/x86_64-linux/usr/sh4/sh4-angstrom-linux/sys-include =
${flags} -print-sysroot-headers-suffix`; \
	    if [ "${multi_dir}" =3D "." ]; \
	      then multi_dir=3D""; \
	    else \
	      multi_dir=3D/${multi_dir}; \
	    fi; \
	    echo "${sfx};${multi_dir}"; \
	  done; \
	else \
	  echo ";"; \
	fi > tmp-fixinc_list
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-fixinc_list fixinc_lis=
t
echo timestamp > s-fixinc_list
/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-ini=
tial-4.3.3-r14.1/gcc-4.3.3/gcc/../move-if-change tmp-macro_list macro_list
echo timestamp > s-macro_list
rm -rf include-fixed; mkdir include-fixed
chmod a+rx include-fixed
if [ -d ../prev-gcc ]; then \
	  cd ../prev-gcc && \
	  make real-install-headers-tar DESTDIR=3D`pwd`/../gcc/ \
	    libsubdir=3D. ; \
	else \
	  set -e; for ml in `cat fixinc_list`; do \
	    sysroot_headers_suffix=3D`echo ${ml} | sed -e 's/;.*$//'`; \
	    multi_dir=3D`echo ${ml} | sed -e 's/^[^;]*;//'`; \
	    fix_dir=3Dinclude-fixed${multi_dir}; \
	    if ! true && test ! -d `echo /opt/work/oe/openembedded/tmp/sysroots/sh=
4-angstrom-linux${sysroot_headers_suffix}/usr/include | sed -e :a -e 's,[^/=
]*/\.\.\/,,' -e ta`; then \
	      echo The directory that should contain system headers does not exist=
: >&2 ; \
	      echo "  `echo /opt/work/oe/openembedded/tmp/sysroots/sh4-angstrom-li=
nux${sysroot_headers_suffix}/usr/include | sed -e :a -e 's,[^/]*/\.\.\/,,' =
-e ta`" >&2 ; \
	      tooldir_sysinc=3D`echo "/opt/work/oe/openembedded/tmp/sysroots/x86_6=
4-linux/usr/sh4/lib/gcc/sh4-angstrom-linux/4.3.3/../../../../sh4-angstrom-l=
inux/sys-include" | sed -e :a -e "s,[^/]*/\.\.\/,," -e ta`; \
	      if test "x`echo /opt/work/oe/openembedded/tmp/sysroots/sh4-angstrom-=
linux${sysroot_headers_suffix}/usr/include | sed -e :a -e 's,[^/]*/\.\.\/,,=
' -e ta`" =3D "x${tooldir_sysinc}"; \
	      then sleep 1; else exit 1; fi; \
	    fi; \
	    /bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cros=
s-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../mkinstalldirs ${fix_dir}; \
	    chmod a+rx ${fix_dir} || true; \
	    (TARGET_MACHINE=3D'sh4-angstrom-linux-gnu'; srcdir=3D`cd /opt/work/oe/=
openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-=
4.3.3/gcc; ${PWDCMD-pwd}`; \
	      SHELL=3D'/bin/sh'; MACRO_LIST=3D`${PWDCMD-pwd}`/macro_list ; \
	      export TARGET_MACHINE srcdir SHELL MACRO_LIST && \
	      cd ../build-x86_64-linux/fixincludes && \
	      /bin/sh ./fixinc.sh ../../gcc/${fix_dir} \
	        `echo /opt/work/oe/openembedded/tmp/sysroots/sh4-angstrom-linux${s=
ysroot_headers_suffix}/usr/include | sed -e :a -e 's,[^/]*/\.\.\/,,' -e ta`=
  ); \
	    rm -f ${fix_dir}/syslimits.h; \
	    if [ -f ${fix_dir}/limits.h ]; then \
	      mv ${fix_dir}/limits.h ${fix_dir}/syslimits.h; \
	    else \
	      cp /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/gsyslimits.h ${fix_dir}/syslimits.h; \
	    fi; \
	    chmod a+r ${fix_dir}/syslimits.h; \
	  done; \
	fi
Fixing headers into /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/g=
cc-cross-initial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angstrom-linu=
x/gcc/include-fixed for sh4-angstrom-linux-gnu target
Forbidden identifiers: linux unix=20
Finding directories and links to directories
 Searching /opt/work/oe/openembedded/tmp/sysroots/sh4-angstrom-linux/usr/in=
clude/.
Making symbolic directory links
Fixing directory /opt/work/oe/openembedded/tmp/sysroots/sh4-angstrom-linux/=
usr/include into /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-=
cross-initial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angstrom-linux/g=
cc/include-fixed
Applying io_quotes_use            to drm/drm.h
Applying io_quotes_use            to drm/i810_drm.h
Applying io_quotes_use            to drm/i830_drm.h
Applying io_quotes_use            to drm/i915_drm.h
Applying io_quotes_use            to drm/mga_drm.h
Applying io_quotes_use            to drm/r128_drm.h
Applying io_quotes_use            to drm/radeon_drm.h
Applying io_quotes_use            to drm/savage_drm.h
Applying io_quotes_use            to drm/sis_drm.h
Applying io_quotes_use            to drm/via_drm.h
Applying io_quotes_use            to linux/agpgart.h
Applying io_quotes_use            to linux/atmbr2684.h
Applying io_quotes_use            to linux/auto_fs.h
Applying io_quotes_use            to linux/auto_fs4.h
Applying io_quotes_use            to linux/blkpg.h
Applying io_quotes_use            to linux/cciss_ioctl.h
Applying io_quotes_use            to linux/cm4000_cs.h
Applying io_quotes_use            to linux/dm-ioctl.h
Applying io_quotes_use            to linux/dn.h
Applying io_quotes_use            to linux/fd.h
Applying io_quotes_use            to linux/fs.h
Applying io_quotes_use            to linux/gigaset_dev.h
Applying io_quotes_use            to linux/i2o-dev.h
Applying io_quotes_use            to linux/if_pppox.h
Applying io_quotes_use            to linux/input.h
Applying io_quotes_use            to linux/ipmi.h
Applying io_quotes_use            to linux/mmtimer.h
Applying io_quotes_use            to linux/nbd.h
Applying io_quotes_def            to linux/pci_regs.h
Applying io_quotes_use            to linux/phantom.h
Applying io_quotes_use            to linux/pktcdvd.h
Applying io_quotes_use            to linux/ppdev.h
Applying io_quotes_def            to linux/ppp-comp.h
Applying io_quotes_use            to linux/raid/md_u.h
Applying io_quotes_use            to linux/random.h
Applying io_quotes_use            to linux/raw.h
Applying io_quotes_use            to linux/reiserfs_fs.h
Applying io_quotes_use            to linux/rfkill.h
Applying io_quotes_def            to linux/soundcard.h
Applying io_quotes_use            to linux/spi/spidev.h
Applying io_quotes_use            to linux/suspend_ioctls.h
Applying io_quotes_use            to linux/synclink.h
Applying io_quotes_use            to linux/uinput.h
Applying io_quotes_use            to linux/usb/tmc.h
Applying io_quotes_use            to linux/usb/vstusb.h
Applying io_quotes_def            to linux/version.h
Applying io_quotes_use            to linux/videotext.h
Applying io_quotes_use            to linux/watchdog.h
Applying io_quotes_use            to mtd/ubi-user.h
Applying io_quotes_use            to rdma/ib_user_mad.h
Applying io_quotes_use            to sound/asequencer.h
Applying io_quotes_use            to sound/asound.h
Applying io_quotes_use            to sound/emu10k1.h
Applying io_quotes_use            to video/sisfb.h
Cleaning up unneeded directories:
fixincludes is done
echo timestamp > stmp-fixinc
if [ -d include ] ; then true; else mkdir include; chmod a+rx include; fi
if [ -d include-fixed ] ; then true; else mkdir include-fixed; chmod a+rx i=
nclude-fixed; fi
for file in .. /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cr=
oss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/ginclude/float.h /opt/work/oe/openemb=
edded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/g=
cc/ginclude/iso646.h /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/=
gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/ginclude/stdarg.h /opt/work/oe/=
openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-=
4.3.3/gcc/ginclude/stdbool.h /opt/work/oe/openembedded/tmp/work/sh4-angstro=
m-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/ginclude/stddef.h /opt/=
work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r1=
4.1/gcc-4.3.3/gcc/ginclude/varargs.h /opt/work/oe/openembedded/tmp/work/sh4=
-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/ginclude/stdfix=
.h ; do \
	  if [ X$file !=3D X.. ]; then \
	    realfile=3D`echo $file | sed -e 's|.*/\([^/]*\)$|\1|'`; \
	    echo timestamp > include/$realfile; \
	    rm -f include/$realfile; \
	    cp $file include; \
	    chmod a+r include/$realfile; \
	  fi; \
	done
rm -f include/unwind.h
cp /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-=
4.3.3-r14.1/gcc-4.3.3/gcc/unwind-generic.h include/unwind.h
set -e; for ml in `cat fixinc_list`; do \
	  sysroot_headers_suffix=3D`echo ${ml} | sed -e 's/;.*$//'`; \
	  multi_dir=3D`echo ${ml} | sed -e 's/^[^;]*;//'`; \
	  fix_dir=3Dinclude-fixed${multi_dir}; \
	  if [ -f `echo /opt/work/oe/openembedded/tmp/sysroots/sh4-angstrom-linux$=
{sysroot_headers_suffix}/usr/include | sed -e :a -e 's,[^/]*/\.\.\/,,' -e t=
a`/limits.h ] ; then \
	    cat /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-in=
itial-4.3.3-r14.1/gcc-4.3.3/gcc/limitx.h /opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/glimits.h /=
opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.=
3-r14.1/gcc-4.3.3/gcc/limity.h > tmp-xlimits.h; \
	  else \
	    cat /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-in=
itial-4.3.3-r14.1/gcc-4.3.3/gcc/glimits.h > tmp-xlimits.h; \
	  fi; \
	  /bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-=
initial-4.3.3-r14.1/gcc-4.3.3/gcc/../mkinstalldirs ${fix_dir}; \
	  chmod a+rx ${fix_dir} || true; \
	  rm -f ${fix_dir}/limits.h; \
	  mv tmp-xlimits.h ${fix_dir}/limits.h; \
	  chmod a+r ${fix_dir}/limits.h; \
	done
rm -f include-fixed/README
cp /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-=
4.3.3-r14.1/gcc-4.3.3/gcc/../fixincludes/README-fixinc include-fixed/README
chmod a+r include-fixed/README
echo timestamp > stmp-int-hdrs
if [ -d "`echo /opt/work/oe/openembedded/tmp/sysroots/sh4-angstrom-linux${s=
ysroot_headers_suffix}/usr/include | sed -e :a -e 's,[^/]*/\.\.\/,,' -e ta`=
" ]; \
	then \
	  CC=3D"/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-in=
itial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angstrom-linux/./gcc/xgc=
c -B/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial=
-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angstrom-linux/./gcc/ -ml -m4=
 -isystem/opt/work/oe/openembedded/tmp/sysroots/sh4-angstrom-linux/usr/incl=
ude -B/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/sh4/sh4-angst=
rom-linux/bin/ -B/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/sh=
4/sh4-angstrom-linux/lib/ -isystem /opt/work/oe/openembedded/tmp/sysroots/x=
86_64-linux/usr/sh4/sh4-angstrom-linux/include -isystem /opt/work/oe/openem=
bedded/tmp/sysroots/x86_64-linux/usr/sh4/sh4-angstrom-linux/sys-include -g =
-Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE   -W -Wall -Wwrite-strings -Wstric=
t-prototypes -Wmissing-prototypes -Wold-style-definition  -isystem ./includ=
e  -I. -I. -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cros=
s-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh=
4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/. -I/opt/work/=
oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/g=
cc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-l=
inux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/=
work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r1=
4.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-=
angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/=
dpd -I../libdecnumber    -I. -I/opt/work/oe/openembedded/tmp/work/sh4-angst=
rom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -isystem include -isy=
stem `echo /opt/work/oe/openembedded/tmp/sysroots/sh4-angstrom-linux${sysro=
ot_headers_suffix}/usr/include | sed -e :a -e 's,[^/]*/\.\.\/,,' -e ta`"; \
	  export CC; \
	  /bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-=
initial-4.3.3-r14.1/gcc-4.3.3/gcc/scan-types.sh "/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc" >t=
mp-deduced.h; \
	  mv tmp-deduced.h deduced.h; \
	else \
	  echo timestamp > deduced.h; \
	fi
sed -e s/TARGET_GETGROUPS_T/gid_t/ \
	  deduced.h /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cros=
s-initial-4.3.3-r14.1/gcc-4.3.3/gcc/sys-protos.h > tmp-fixtmp.c
mv tmp-fixtmp.c fixtmp.c
/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3=
.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angstrom-linux/./gcc/xgcc -B/opt/=
work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r1=
4.1/gcc-4.3.3/build.x86_64-linux.sh4-angstrom-linux/./gcc/ -ml -m4 -isystem=
/opt/work/oe/openembedded/tmp/sysroots/sh4-angstrom-linux/usr/include -B/op=
t/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/sh4/sh4-angstrom-linux=
/bin/ -B/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/sh4/sh4-ang=
strom-linux/lib/ -isystem /opt/work/oe/openembedded/tmp/sysroots/x86_64-lin=
ux/usr/sh4/sh4-angstrom-linux/include -isystem /opt/work/oe/openembedded/tm=
p/sysroots/x86_64-linux/usr/sh4/sh4-angstrom-linux/sys-include fixtmp.c -w =
-U__SIZE_TYPE__ -U__PTRDIFF_TYPE__ -U__WCHAR_TYPE__ -E \
	  | sed -e 's/	/ /g' -e 's/ *(/ (/g' -e 's/ [ ]*/ /g' -e 's/( )/()/' \
	  |  build/gen-protos >xsys-protos.hT
gen-protos: 1346 entries 340 collisions
mv xsys-protos.hT xsys-protos.h
rm -rf fixtmp.c
gcc  -c   -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/i=
nclude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-string=
s -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing=
-format-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -W=
no-overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild -I/op=
t/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-=
r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux=
/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/build -I/opt/work/oe/openembed=
ded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc=
/../include -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cro=
ss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/include  -I/opt/work/oe/open=
embedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.=
3/gcc/../libdecnumber -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber/dpd -I../lib=
decnumber -I. -Ibuild -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-lin=
ux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc -I/opt/work/oe/openembedded/=
tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/bui=
ld -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initia=
l-4.3.3-r14.1/gcc-4.3.3/gcc/../include -I/opt/work/oe/openembedded/tmp/work=
/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../libcpp/i=
nclude  -I/opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-i=
nitial-4.3.3-r14.1/gcc-4.3.3/gcc/../libdecnumber -I/opt/work/oe/openembedde=
d/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/.=
./libdecnumber/dpd -I../libdecnumber     -o build/fix-header.o /opt/work/oe=
/openembedded/tmp/work/sh4-angstrom-linux/gcc-cross-initial-4.3.3-r14.1/gcc=
-4.3.3/gcc/fix-header.c
gcc    -isystem/opt/work/oe/openembedded/tmp/sysroots/x86_64-linux/usr/incl=
ude -O2 -g -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall -Wwrite-strings -=
Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-fo=
rmat-attribute -pedantic -Wno-long-long -Wno-variadic-macros 				     -Wno-=
overlength-strings    -DHAVE_CONFIG_H -DGENERATOR_FILE -L/opt/work/oe/opene=
mbedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/opt/work/oe/open=
embedded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/opt/work/oe/openembe=
dded/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1 -o build/fix-header \
	 build/fix-header.o c-incpath.o cppdefault.o build/scan-decls.o prefix.o \
	 build/scan.o build/errors.o ../libcpp/libcpp.a   ../libiberty/libiberty.a=
 ../libdecnumber/libdecnumber.a
if [ -f fixhdr.ready ] ; then \
		true; \
	else \
		echo timestamp > fixhdr.ready; \
	fi
set -e; for ml in `cat fixinc_list`; do \
	  sysroot_headers_suffix=3D`echo ${ml} | sed -e 's/;.*$//'`; \
	  multi_dir=3D`echo ${ml} | sed -e 's/^[^;]*;//'`; \
	  fix_dir=3Dinclude-fixed${multi_dir}; \
	  if [ -f ${fix_dir}/fixed ] ; then true; \
	  else \
	    : This line works around a 'make' bug in BSDI 1.1.; \
	    FIXPROTO_DEFINES=3D""; export FIXPROTO_DEFINES; \
	    FIX_HEADER=3D"build/fix-header"; export FIX_HEADER; \
	    mkinstalldirs=3D"/bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstr=
om-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/gcc/../mkinstalldirs"; \
	      export mkinstalldirs; \
	    if [ -d "`echo /opt/work/oe/openembedded/tmp/sysroots/sh4-angstrom-lin=
ux${sysroot_headers_suffix}/usr/include | sed -e :a -e 's,[^/]*/\.\.\/,,' -=
e ta`" ]; then \
	      /bin/sh /opt/work/oe/openembedded/tmp/work/sh4-angstrom-linux/gcc-cr=
oss-initial-4.3.3-r14.1/gcc-4.3.3/gcc/fixproto ${fix_dir} ${fix_dir} `echo =
/opt/work/oe/openembedded/tmp/sysroots/sh4-angstrom-linux${sysroot_headers_=
suffix}/usr/include | sed -e :a -e 's,[^/]*/\.\.\/,,' -e ta`; \
	      if [ $? -eq 0 ] ; then true ; else exit 1 ; fi ; \
	    else true; fi; \
	    echo timestamp > ${fix_dir}/fixed; \
	  fi; \
	done
fixproto: populating `include-fixed'
CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include
fix-header: Internal error: abort in add_path, at c-incpath.c:425
make[2]: *** [stmp-fixproto] Error 1
make[2]: Leaving directory `/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angst=
rom-linux/gcc'
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory `/opt/work/oe/openembedded/tmp/work/sh4-angstrom=
-linux/gcc-cross-initial-4.3.3-r14.1/gcc-4.3.3/build.x86_64-linux.sh4-angst=
rom-linux'
make: *** [all] Error 2
FATAL: oe_runmake failed

--u65IjBhB3TIa72Vp--
