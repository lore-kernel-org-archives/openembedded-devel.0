Received: from [138.38.0.38] (helo=senna.bath.ac.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pmountifield@formac.net>) id 1MHfqB-0004Pj-9H
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Jun 2009 17:17:19 +0200
Received: from authenticated user by senna.bath.ac.uk with esmtpsa
	(TLSv1:DHE-RSA-AES256-SHA:256) (Exim 4)
	(envelope-from <pmountifield@formac.net>) id 1MHffs-0000gd-Ef
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Jun 2009 16:06:41 +0100
Message-ID: <4A3BA978.4040702@formac.net>
Date: Fri, 19 Jun 2009 16:06:32 +0100
From: Philip Mountifield <pmountifield@formac.net>
User-Agent: Thunderbird 2.0.0.21 (Windows/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-kerberosV-authenticator: pjm25@BATH.AC.UK
X-BUCS: pjm25
X-Scanner: 0d81dd46a041361e108f562de78e240867faec74
Subject: ERROR: EOL while scanning string literal...
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
X-List-Received-Date: Fri, 19 Jun 2009 15:17:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

I am new to open embedded and trying to use it to cross compile python 
for a moxa device using a external tool chain.

When I run bitbake helloworld I get the following error many times:

bitbake helloworld
__builtin__:74: DeprecationWarning: the sets module is deprecated
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it 
to increase performance.
NOTE: Handling BitBake files: \ (1108/6917) [16 %]NOTE: <type 
'exceptions.SyntaxError'>:EOL while scanning string literal (<string>, 
line 1) while evaluating:
${@oe_filter_out('-I\S+', 
'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing /home/feiadmin/oe/openembedded/recipes/uclibc/uclibc_0.9.30.1.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal 
(<string>, line 1) while evaluating:
${@oe_filter_out('-I\S+', 
'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing /home/feiadmin/oe/openembedded/recipes/uclibc/uclibc_0.9.27.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal 
(<string>, line 1) while evaluating:
${@oe_filter_out('-I\S+', 
'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing /home/feiadmin/oe/openembedded/recipes/uclibc/uclibc_0.9.30.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal 
(<string>, line 1) while evaluating:
${@oe_filter_out('-I\S+', 
'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing /home/feiadmin/oe/openembedded/recipes/uclibc/uclibc_nptl.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal 
(<string>, line 1) while evaluating:
${@oe_filter_out('-I\S+', 
'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing 
/home/feiadmin/oe/openembedded/recipes/uclibc/uclibc-initial_0.9.30.1.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal 
(<string>, line 1) while evaluating:
${@oe_filter_out('-I\S+', 
'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing 
/home/feiadmin/oe/openembedded/recipes/uclibc/uclibc-initial_0.9.26.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal 
(<string>, line 1) while evaluating:
${@oe_filter_out('-I\S+', 
'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing 
/home/feiadmin/oe/openembedded/recipes/uclibc/uclibc-initial_0.9.29.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal 
(<string>, line 1) while evaluating:
${@oe_filter_out('-I\S+', 
'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing /home/feiadmin/oe/openembedded/recipes/uclibc/uclibc_svn.bb
NOTE: Handling BitBake files: \ (1117/6917) [16 %]NOTE: <type 
'exceptions.SyntaxError'>:EOL while scanning string literal (<string>, 
line 1) while evaluating:
${@oe_filter_out('-I\S+', 
'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing /home/feiadmin/oe/openembedded/recipes/uclibc/uclibc-initial_svn.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal 
(<string>, line 1) while evaluating:
${@oe_filter_out('-I\S+', 
'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing /home/feiadmin/oe/openembedded/recipes/uclibc/uclibc_0.9.29.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal 
(<string>, line 1) while evaluating:
${@oe_filter_out('-I\S+', 
'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing /home/feiadmin/oe/openembedded/recipes/uclibc/uclibc_0.9.26.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal 
(<string>, line 1) while evaluating:
${@oe_filter_out('-I\S+', 
'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing 
/home/feiadmin/oe/openembedded/recipes/uclibc/uclibc-initial_0.9.30.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal 
(<string>, line 1) while evaluating:
${@oe_filter_out('-I\S+', 
'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing 
/home/feiadmin/oe/openembedded/recipes/uclibc/uclibc-initial_0.9.27.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal 
(<string>, line 1) while evaluating:
${@oe_filter_out('-I\S+', 
'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing /home/feiadmin/oe/openembedded/recipes/uclibc/bfin-uclibc_svn.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal 
(<string>, line 1) while evaluating:
${@oe_filter_out('-I\S+', 
'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing /home/feiadmin/oe/openembedded/recipes/uclibc/uclibc-initial_nptl.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal 
(<string>, line 1) while evaluating:
${@oe_filter_out('-I\S+', 
'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing 
/home/feiadmin/oe/openembedded/recipes/uclibc/uclibc-initial_0.9.28.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal 
(<string>, line 1) while evaluating:
${@oe_filter_out('-I\S+', 
'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing /home/feiadmin/oe/openembedded/recipes/uclibc/uclibc_0.9.28.bb
NOTE: Handling BitBake files: \ (1201/6917) [17 %]NOTE: <type 
'exceptions.SyntaxError'>:EOL while scanning string literal (<string>, 
line 1) while evaluating:
${@oe_filter_out('-fvisibility-inlines-hidden', 
'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2 -fpermissive', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing 
/home/feiadmin/oe/openembedded/recipes/wxwidgets/wxwidgets-unicode_2.8.10.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal 
(<string>, line 1) while evaluating:
${@oe_filter_out('-fvisibility-inlines-hidden', 
'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2 -fpermissive', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing /home/feiadmin/oe/openembedded/recipes/wxwidgets/wxwidgets_2.8.10.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal 
(<string>, line 1) while evaluating:
${@oe_filter_out('-fvisibility-inlines-hidden', 
'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2 -fpermissive', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing /home/feiadmin/oe/openembedded/recipes/wxwidgets/wxwidgets_2.6.4.bb
NOTE: Handling BitBake files: / (1459/6917) [21 %]NOTE: <type 
'exceptions.SyntaxError'>:EOL while scanning string literal (<string>, 
line 1) while evaluating:
${@oe_filter_out('-fno-rtti', '-fno-exceptions -fno-rtti 
-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2 -fpermissive', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing /home/feiadmin/oe/openembedded/recipes/libqpe/libqpe-opie_cvs.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal 
(<string>, line 1) while evaluating:
${@oe_filter_out('-fno-rtti', '-fno-exceptions -fno-rtti 
-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2 -fpermissive', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing /home/feiadmin/oe/openembedded/recipes/libqpe/libqpe-opie_1.2.2.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal 
(<string>, line 1) while evaluating:
${@oe_filter_out('-fno-rtti', '-fno-exceptions -fno-rtti 
-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2 -fpermissive', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing /home/feiadmin/oe/openembedded/recipes/libqpe/libqpe-opie_1.2.4.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal 
(<string>, line 1) while evaluating:
${@oe_filter_out('-fno-rtti', '-fno-exceptions -fno-rtti 
-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2 -fpermissive', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing /home/feiadmin/oe/openembedded/recipes/libqpe/libqpe-opie_1.2.3.bb
NOTE: Handling BitBake files: / (2216/6917) [32 %]NOTE: <type 
'exceptions.SyntaxError'>:EOL while scanning string literal (<string>, 
line 1) while evaluating:
${@oe_filter_out('-fvisibility-inlines-hidden', 
'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2 -fpermissive', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing /home/feiadmin/oe/openembedded/recipes/qte/qte-mt-static_2.3.10.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal 
(<string>, line 1) while evaluating:
${@oe_filter_out('-fvisibility-inlines-hidden', 
'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2 -fpermissive', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing /home/feiadmin/oe/openembedded/recipes/qte/qte_2.3.10.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal 
(<string>, line 1) while evaluating:
${@oe_filter_out('-fvisibility-inlines-hidden', 
'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2 -fpermissive', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing /home/feiadmin/oe/openembedded/recipes/qte/qte-mt_2.3.10.bb
NOTE: Handling BitBake files: | (3212/6917) [46 %]NOTE: <type 
'exceptions.SyntaxError'>:EOL while scanning string literal (<string>, 
line 1) while evaluating:
${@oe_filter_out('-fno-rtti', '-fno-exceptions -fno-rtti 
-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2 -fpermissive', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing /home/feiadmin/oe/openembedded/recipes/nunome/nunome_1.0.2.bb
NOTE: Handling BitBake files: / (3555/6917) [51 %]NOTE: <type 
'exceptions.SyntaxError'>:EOL while scanning string literal (<string>, 
line 1) while evaluating:
${@'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2'.replace('-frename-registers', '')}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing /home/feiadmin/oe/openembedded/recipes/gnome/gnome-themes_2.6.2.bb
NOTE: Handling BitBake files: | (5729/6917) [82 %]NOTE: <type 
'exceptions.SyntaxError'>:EOL while scanning string literal (<string>, 
line 1) while evaluating:
${@'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2 -fpermissive'.replace('-frename-registers', '')}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing /home/feiadmin/oe/openembedded/recipes/mesa/mesa_6.0.1.bb
NOTE: <type 'exceptions.SyntaxError'>:EOL while scanning string literal 
(<string>, line 1) while evaluating:
${@'-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2 -fpermissive'.replace('-frename-registers', '')}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing 
/home/feiadmin/oe/openembedded/recipes/mesa/mesa_6.4.1+cvs20060101.bb
NOTE: Handling BitBake files: \ (6328/6917) [91 %]NOTE: <type 
'exceptions.SyntaxError'>:EOL while scanning string literal (<string>, 
line 1) while evaluating:
${@oe_filter_out('-fno-rtti', '-fno-exceptions -fno-rtti 
-isystem/home/feiadmin/oe/tmp/staging/arm-linux/usr/include 
-I${PRE_BUILT}/include  -fexpensive-optimizations -fomit-frame-pointer 
-frename-registers -O2 -fpermissive', d)}
ERROR: EOL while scanning string literal (<string>, line 1) while 
parsing /home/feiadmin/oe/openembedded/recipes/jards/jards_1.0.bb
NOTE: Handling BitBake files: \ (6917/6917) [100 %]
NOTE: Parsing finished. 6619 cached, 0 parsed, 266 skipped, 0 masked.
NOTE: Cache is clean, not saving.
ERROR: Parsing errors found, exiting...

My local.conf file is as follows, taken mostly from the user manual:

DL_DIR = "${OEBASE}/sources"
BBFILES := "${OEBASE}/openembedded/recipes/*/*.bb 
${LOCALDIR}/recipes/*/*.bb"
BBFILE_COLLECTIONS = "upstream local"
BBFILE_PATTERN_upstream = "^${OEBASE}/openembedded/recipes/"
BBFILE_PATTERN_local = "^${LOCALDIR}/recipes/"
BBFILE_PRIORITY_upstream = "5"
BBFILE_PRIORITY_local = "10"
BBMASK = ""
#
# machine stuff
#
MACHINE = "moxa"
PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5te iwmmxt xscale"
TARGET_CC_ARCH = "-mcpu=xscale -mtune=iwmmxt"
TARGET_ARCH = "arm"
PACKAGE_ARCH="xscale"

INHERIT += " package_ipk debian"
TARGET_OS  = "linux"
TARGET_FPU = "soft"
DISTRO = "moxa-disro"
DISTRO_NAME = "moxa-distro"
DISTRO_VERSION = "0.0.1"
DISTRO_TYPE = "release"

export CC="${CCACHE}arm-linux-gcc-4.2.1 ${HOST_CC_ARCH}"
export CXX="${CCACHE}arm-linux-g++ ${HOST_CC_ARCH}"
export CPP="arm-linux-gcc-4.2.1 -E"
export LD="arm-linux-ld"
export AR="arm-linux-ar"
export AS="arm-linux-as"
export RANLIB="arm-linux-ranlib"
export STRIP="arm-linux-strip"

#
# point OE to the lib and include directory
#
TARGET_CPPFLAGS_append = " -I${PRE_BUILT}/include "
TARGET_LDFLAGS_prepend = " -L${PRE_BUILT}/qt2/lib -L${PRE_BUILT}/lib \
-Wl,-rpath-link,${PRE_BUILT}/lib -Wl,-rpath-link,${PRE_BUILT}/qt2/lib "

# special to Qt/Qtopia
QTDIR  = "${PRE_BUILT}/qt2"
QPEDIR = "${PRE_BUILT}"

ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc "
ASSUME_PROVIDED += " virtual/libc "
ASSUME_PROVIDED += " virtual/qte "
ASSUME_PROVIDED += " virtual/libqpe "
ASSUME_PROVIDED += " libqpe-opie "


Many thanks in advance.

Philip


