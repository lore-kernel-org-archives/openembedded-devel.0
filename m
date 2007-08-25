Received: from [209.85.128.187] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <yakov.zaytsev@gmail.com>) id 1IOu5d-0005MQ-Tf
	for openembedded-devel@openembedded.org; Sat, 25 Aug 2007 13:46:06 +0200
Received: by fk-out-0910.google.com with SMTP id 18so984679fks
	for <openembedded-devel@openembedded.org>;
	Sat, 25 Aug 2007 04:44:43 -0700 (PDT)
Received: by 10.82.116.15 with SMTP id o15mr7956803buc.1188042283444;
	Sat, 25 Aug 2007 04:44:43 -0700 (PDT)
Received: from 89-179-104-90.broadband.corbina.ru ( [89.179.104.90])
	by mx.google.com with ESMTPS id f3sm5318554nfh.2007.08.25.04.44.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 25 Aug 2007 04:44:41 -0700 (PDT)
Message-ID: <46D01621.4010406@gmail.com>
Date: Sat, 25 Aug 2007 15:44:33 +0400
From: yakov.zaytsev@gmail.com
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1ef816af0708221151m5c3c2b4ds9b90fdbddc56d8d1@mail.gmail.com>	<19c1b8a90708221646p6cfd0e6do6574668bbe15d775@mail.gmail.com>	<1ef816af0708230241s62454f78oa0147b10cae53ce6@mail.gmail.com>	<46CD69E3.707@whitby.id.au>
	<46CD6D45.9050602@dominion.kabel.utwente.nl>
In-Reply-To: <46CD6D45.9050602@dominion.kabel.utwente.nl>
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
Subject: Re: binutils-cross_2.17.50.0.5.bb failed
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
X-List-Received-Date: Sat, 25 Aug 2007 11:46:06 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Here's complete error log..
PS
I still can't understand why 
/Volumes/OE/stuff/build/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-cross-2.17.50.0.5-r1/binutils-2.17.50.0.5/build.i386-darwin.arm-angstrom-linux-gnueabi 

is empty before do_cofigure..

$ bitbake -b 
/Volumes/OE/stuff/org.openembedded.dev/packages/binutils/binutils-cross_2.17.50.0.5.bb 
-c configure -D -D
DEBUG: CONF reading /Volumes/OE/stuff/org.openembedded.dev/conf/bitbake.conf
DEBUG: update_data()
DEBUG: update_data()
DEBUG: CONF file 'conf/site.conf' not found
DEBUG: CONF file 'conf/auto.conf' not found
DEBUG: CONF including /Volumes/OE/stuff/build/conf/local.conf
DEBUG: CONF file 'conf/build/i386-darwin.conf' not found
DEBUG: CONF file 'conf/target/INVALID-INVALID.conf' not found
DEBUG: CONF including 
/Volumes/OE/stuff/org.openembedded.dev/conf/machine/qemuarm.conf
DEBUG: CONF including 
/Volumes/OE/stuff/org.openembedded.dev/conf/machine/include/qemu.conf
DEBUG: CONF including 
/Volumes/OE/stuff/org.openembedded.dev/conf/machine/include/tune-arm926ejs.conf
DEBUG: CONF including 
/Volumes/OE/stuff/org.openembedded.dev/conf/distro/angstrom-2007.1.conf
DEBUG: BB conf/distro/include/sane-srcdates.inc: handle(data, include)
DEBUG: BB :0: inheriting classes/base.bbclass
DEBUG: BB classes/base.bbclass: handle(data, include)
DEBUG: BB :0: inheriting classes/patch.bbclass
DEBUG: BB classes/patch.bbclass: handle(data, include)
DEBUG: BB :0: inheriting classes/siteinfo.bbclass
DEBUG: BB classes/siteinfo.bbclass: handle(data, include)
DEBUG: BB conf/distro/include/preferred-gpe-versions-2.8.inc: 
handle(data, include)
DEBUG: BB conf/distro/include/preferred-e-versions.inc: handle(data, 
include)
DEBUG: BB conf/distro/include/preferred-xorg-versions.inc: handle(data, 
include)
DEBUG: BB conf/distro/include/angstrom.inc: handle(data, include)
DEBUG: BB conf/distro/include/angstrom-glibc.inc: handle(data, include)
DEBUG: update_data()
DEBUG: CONF including 
/Volumes/OE/stuff/org.openembedded.dev/conf/documentation.conf
DEBUG: CONF including 
/Volumes/OE/stuff/org.openembedded.dev/conf/sanity.conf
DEBUG: update_data()
DEBUG: BB classes/base.bbclass: handle(data, include)
DEBUG: BB classes/package_ipk.bbclass: handle(data, include)
DEBUG: BB :0: inheriting classes/package.bbclass
DEBUG: BB classes/package.bbclass: handle(data, include)
DEBUG: BB classes/debian.bbclass: handle(data, include)
DEBUG: BB classes/multimachine.bbclass: handle(data, include)
DEBUG: BB classes/sanity.bbclass: handle(data, include)
DEBUG: BB classes/devshell.bbclass: handle(data, include)
DEBUG: BB classes/angstrom-mirrors.bbclass: handle(data, include)
DEBUG: BB classes/insane.bbclass: handle(data, include)
DEBUG: BB classes/sanity.bbclass: handle(data, include)
DEBUG: Using 
'/Volumes/OE/stuff/build/tmp/cache/qemuarm/bb_persist_data.sqlite3' as 
the persistent data cache
DEBUG: Clearing SRCREV cache due to cache policy of: clear
DEBUG: update_data()
DEBUG: BB 
/Volumes/OE/stuff/org.openembedded.dev/packages/binutils/binutils-cross_2.17.50.0.5.bb: 
handle(data)
DEBUG: BB :0: inheriting classes/package_ipk.bbclass
DEBUG: BB classes/package_ipk.bbclass: handle(data, include)
DEBUG: BB :0: inheriting classes/package.bbclass
DEBUG: BB classes/package.bbclass: handle(data, include)
DEBUG: BB :0: inheriting classes/debian.bbclass
DEBUG: BB classes/debian.bbclass: handle(data, include)
DEBUG: BB :0: inheriting classes/multimachine.bbclass
DEBUG: BB classes/multimachine.bbclass: handle(data, include)
DEBUG: BB :0: inheriting classes/sanity.bbclass
DEBUG: BB classes/sanity.bbclass: handle(data, include)
DEBUG: BB :0: inheriting classes/devshell.bbclass
DEBUG: BB classes/devshell.bbclass: handle(data, include)
DEBUG: BB :0: inheriting classes/angstrom-mirrors.bbclass
DEBUG: BB classes/angstrom-mirrors.bbclass: handle(data, include)
DEBUG: BB :0: inheriting classes/insane.bbclass
DEBUG: BB classes/insane.bbclass: handle(data, include)
DEBUG: BB binutils_2.17.50.0.5.bb: handle(data, include)
DEBUG: BB binutils.inc: handle(data, include)
DEBUG: BB :0: inheriting classes/autotools.bbclass
DEBUG: BB classes/autotools.bbclass: handle(data, include)
DEBUG: BB :0: inheriting classes/gettext.bbclass
DEBUG: BB classes/gettext.bbclass: handle(data, include)
DEBUG: BB binutils-cross.inc: handle(data, include)
DEBUG: BB :0: inheriting classes/cross.bbclass
DEBUG: BB classes/cross.bbclass: handle(data, include)
DEBUG: update_data()
DEBUG: update_data()
DEBUG: update_data()
NOTE: package binutils-cross-2.17.50.0.5: started
DEBUG: Executing task do_configure
DEBUG: update_data()
NOTE: package binutils-cross-2.17.50.0.5-r1: task do_configure: started
ERROR: Information not available for target 'i386-darwin'
NOTE: <type 'exceptions.AttributeError'>:'NoneType' object has no 
attribute 'append' while evaluating:
${@siteinfo_get_files(d)}
ERROR: Information not available for target 'i386-darwin'
NOTE: <type 'exceptions.AttributeError'>:'NoneType' object has no 
attribute 'append' while evaluating:
${@siteinfo_get_files(d)}
NOTE: <type 'exceptions.AttributeError'>:'NoneType' object has no 
attribute 'append' while evaluating:
(cd ${S}; gnu-configize) || die "Failed to run gnu-configize"
oe_runconf
#
# must prime config.cache to ensure the build of libiberty
#
mkdir -p ${B}/build-${BUILD_SYS}
for i in ${CONFIG_SITE}; do
cat $i >> ${B}/build-${BUILD_SYS}/config.cache
done

+ export localstatedir=/Volumes/OE/stuff/build/tmp/cross/var
+ localstatedir=/Volumes/OE/stuff/build/tmp/cross/var
+ export prefix=/Volumes/OE/stuff/build/tmp/cross
+ prefix=/Volumes/OE/stuff/build/tmp/cross
+ export 'CPP=gcc -E'
+ CPP=gcc -E
+ export mandir=/Volumes/OE/stuff/build/tmp/cross/share/man
+ mandir=/Volumes/OE/stuff/build/tmp/cross/share/man
+ export STRIP=strip
+ STRIP=strip
+ export 
STAGING_SIPDIR=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/share/sip
+ STAGING_SIPDIR=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/share/sip
+ export 'BUILD_CC=ccache gcc'
+ BUILD_CC=ccache gcc
+ export 
'BUILD_CXXFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include 
-Os -fpermissive'
+ 
BUILD_CXXFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include 
-Os -fpermissive
+ export OBJCOPY=objcopy
+ OBJCOPY=objcopy
+ export libexecdir=/Volumes/OE/stuff/build/tmp/cross/libexec
+ libexecdir=/Volumes/OE/stuff/build/tmp/cross/libexec
+ export QTDIR=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/qt2
+ QTDIR=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/qt2
+ export datadir=/Volumes/OE/stuff/build/tmp/cross/share
+ datadir=/Volumes/OE/stuff/build/tmp/cross/share
+ export 'BUILD_CXX=ccache g++'
+ BUILD_CXX=ccache g++
+ export LD=ld
+ LD=ld
+ export LD_FOR_TARGET=arm-angstrom-linux-gnueabi-ld
+ LD_FOR_TARGET=arm-angstrom-linux-gnueabi-ld
+ export 'EXTRA_OEMAKE=configure-build-libiberty all'
+ EXTRA_OEMAKE=configure-build-libiberty all
+ export LDFLAGS=-L/Volumes/OE/stuff/build/tmp/staging/i386-darwin/lib
+ LDFLAGS=-L/Volumes/OE/stuff/build/tmp/staging/i386-darwin/lib
+ export bindir=/Volumes/OE/stuff/build/tmp/cross/bin
+ bindir=/Volumes/OE/stuff/build/tmp/cross/bin
+ export 
'TARGET_CXXFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/arm-angstrom-linux-gnueabi/include 
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os 
-fpermissive'
+ 
TARGET_CXXFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/arm-angstrom-linux-gnueabi/include 
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os 
-fpermissive
+ export MAKE=make
+ MAKE=make
+ export CPP_FOR_BUILD=cpp
+ CPP_FOR_BUILD=cpp
+ export exec_prefix=/Volumes/OE/stuff/build/tmp/cross
+ exec_prefix=/Volumes/OE/stuff/build/tmp/cross
+ export OPIEDIR=/Volumes/OE/stuff/build/tmp/staging/i386-darwin
+ OPIEDIR=/Volumes/OE/stuff/build/tmp/staging/i386-darwin
+ export 
'BUILD_LDFLAGS=-L/Volumes/OE/stuff/build/tmp/staging/i386-darwin/lib 
-Wl,-rpath-link,/Volumes/OE/stuff/build/tmp/staging/i386-darwin/lib 
-Wl,-rpath,/Volumes/OE/stuff/build/tmp/staging/i386-darwin/lib -Wl,-O1'
+ BUILD_LDFLAGS=-L/Volumes/OE/stuff/build/tmp/staging/i386-darwin/lib 
-Wl,-rpath-link,/Volumes/OE/stuff/build/tmp/staging/i386-darwin/lib 
-Wl,-rpath,/Volumes/OE/stuff/build/tmp/staging/i386-darwin/lib -Wl,-O1
+ export 
STAGING_IDLDIR=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/share/idl
+ STAGING_IDLDIR=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/share/idl
+ export BUILD_LD=ld
+ BUILD_LD=ld
+ export oldincludedir=/Volumes/OE/stuff/build/tmp/cross/include
+ oldincludedir=/Volumes/OE/stuff/build/tmp/cross/include
+ export 'CCLD=ccache gcc'
+ CCLD=ccache gcc
+ export QPEDIR=/Volumes/OE/stuff/build/tmp/staging/i386-darwin
+ QPEDIR=/Volumes/OE/stuff/build/tmp/staging/i386-darwin
+ export BUILD_CCLD=gcc
+ BUILD_CCLD=gcc
+ export 
BBPATH=/Volumes/OE/stuff/org.openembedded.dev/packages/binutils:/Volumes/OE/stuff/org.openembedded.dev/packages/binutils:/Volumes/OE/stuff/org.openembedded.dev/packages/binutils:/Volumes/OE/stuff/org.openembedded.dev/packages/binutils:/Volumes/OE/stuff/org.openembedded.dev/conf/distro/include:/Volumes/OE/stuff/org.openembedded.dev/conf/distro/include:/Volumes/OE/stuff/org.openembedded.dev/conf/distro/include:/Volumes/OE/stuff/org.openembedded.dev/conf/distro/include:/Volumes/OE/stuff/org.openembedded.dev/conf/distro/include:/Volumes/OE/stuff/org.openembedded.dev/conf/distro/include:/Volumes/OE/stuff/build:/Volumes/OE/stuff/org.openembedded.dev
+ 
BBPATH=/Volumes/OE/stuff/org.openembedded.dev/packages/binutils:/Volumes/OE/stuff/org.openembedded.dev/packages/binutils:/Volumes/OE/stuff/org.openembedded.dev/packages/binutils:/Volumes/OE/stuff/org.openembedded.dev/packages/binutils:/Volumes/OE/stuff/org.openembedded.dev/conf/distro/include:/Volumes/OE/stuff/org.openembedded.dev/conf/distro/include:/Volumes/OE/stuff/org.openembedded.dev/conf/distro/include:/Volumes/OE/stuff/org.openembedded.dev/conf/distro/include:/Volumes/OE/stuff/org.openembedded.dev/conf/distro/include:/Volumes/OE/stuff/org.openembedded.dev/conf/distro/include:/Volumes/OE/stuff/build:/Volumes/OE/stuff/org.openembedded.dev
+ export base_libdir=/Volumes/OE/stuff/build/tmp/cross/lib
+ base_libdir=/Volumes/OE/stuff/build/tmp/cross/lib
+ export 
'TARGET_CFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/arm-angstrom-linux-gnueabi/include 
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os'
+ 
TARGET_CFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/arm-angstrom-linux-gnueabi/include 
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os
+ export base_bindir=/Volumes/OE/stuff/build/tmp/cross/bin
+ base_bindir=/Volumes/OE/stuff/build/tmp/cross/bin
+ export AR_FOR_TARGET=arm-angstrom-linux-gnueabi-ar
+ AR_FOR_TARGET=arm-angstrom-linux-gnueabi-ar
+ export 
'CFLAGS_FOR_BUILD=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include 
-Os'
+ 
CFLAGS_FOR_BUILD=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include 
-Os
+ export includedir=/Volumes/OE/stuff/build/tmp/cross/include
+ includedir=/Volumes/OE/stuff/build/tmp/cross/include
+ export servicedir=/Volumes/OE/stuff/build/tmp/cross/srv
+ servicedir=/Volumes/OE/stuff/build/tmp/cross/srv
+ export BUILD_CPP=cpp
+ BUILD_CPP=cpp
+ export AS_FOR_TARGET=arm-angstrom-linux-gnueabi-as
+ AS_FOR_TARGET=arm-angstrom-linux-gnueabi-as
+ export 
TARGET_CPPFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/arm-angstrom-linux-gnueabi/include
+ 
TARGET_CPPFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/arm-angstrom-linux-gnueabi/include
+ export sbindir=/Volumes/OE/stuff/build/tmp/cross/bin
+ sbindir=/Volumes/OE/stuff/build/tmp/cross/bin
+ export 
'CFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include -Os'
+ CFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include -Os
+ export BUILD_AR=ar
+ BUILD_AR=ar
+ export sharedstatedir=/Volumes/OE/stuff/build/tmp/cross/com
+ sharedstatedir=/Volumes/OE/stuff/build/tmp/cross/com
+ export 'F77=ccache g77'
+ F77=ccache g77
+ export OBJDUMP=objdump
+ OBJDUMP=objdump
+ export 'CC_FOR_HOST=ccache gcc'
+ CC_FOR_HOST=ccache gcc
+ export 
'BUILD_CFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include 
-Os'
+ 
BUILD_CFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include 
-Os
+ unset DISTRO
+ export 
QMAKE_MKSPEC_PATH=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/share/qmake
+ 
QMAKE_MKSPEC_PATH=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/share/qmake
+ export 
PKG_CONFIG_DIR=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/lib/pkgconfig
+ 
PKG_CONFIG_DIR=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/lib/pkgconfig
+ export palmtopdir=/Volumes/OE/stuff/build/tmp/cross/lib/opie
+ palmtopdir=/Volumes/OE/stuff/build/tmp/cross/lib/opie
+ export PKG_CONFIG_DISABLE_UNINSTALLED=yes
+ PKG_CONFIG_DISABLE_UNINSTALLED=yes
+ export infodir=/Volumes/OE/stuff/build/tmp/cross/share/info
+ infodir=/Volumes/OE/stuff/build/tmp/cross/share/info
+ export base_prefix=/Volumes/OE/stuff/build/tmp/cross
+ base_prefix=/Volumes/OE/stuff/build/tmp/cross
+ export 'CC=ccache gcc'
+ CC=ccache gcc
+ export 
PATH=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/bin/i386-darwin:/Volumes/OE/stuff/build/tmp/staging/i386-darwin/bin:/Volumes/OE/stuff/build/tmp/cross/bin:/opt/local/bin/:/sw/bin:/Volumes/OE/stuff/bitbake/bin:/usr/local/bin/:/opt/local/bin:/opt/local/sbin:/sw/bin:/sw/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/X11R6/bin
+ 
PATH=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/bin/i386-darwin:/Volumes/OE/stuff/build/tmp/staging/i386-darwin/bin:/Volumes/OE/stuff/build/tmp/cross/bin:/opt/local/bin/:/sw/bin:/Volumes/OE/stuff/bitbake/bin:/usr/local/bin/:/opt/local/bin:/opt/local/sbin:/sw/bin:/sw/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/X11R6/bin
+ export 'BUILD_F77=ccache g77'
+ BUILD_F77=ccache g77
+ export RANLIB=ranlib
+ RANLIB=ranlib
+ export 
'TARGET_LDFLAGS=-L/Volumes/OE/stuff/build/tmp/staging/arm-angstrom-linux-gnueabi/lib 
-Wl,-rpath-link,/Volumes/OE/stuff/build/tmp/staging/arm-angstrom-linux-gnueabi/lib 
-Wl,-O1'
+ 
TARGET_LDFLAGS=-L/Volumes/OE/stuff/build/tmp/staging/arm-angstrom-linux-gnueabi/lib 
-Wl,-rpath-link,/Volumes/OE/stuff/build/tmp/staging/arm-angstrom-linux-gnueabi/lib 
-Wl,-O1
+ export 'CXX_FOR_HOST=ccache gcc'
+ CXX_FOR_HOST=ccache gcc
+ export 
CPPFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include
+ CPPFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include
+ export docdir=/Volumes/OE/stuff/build/tmp/cross/share/doc
+ docdir=/Volumes/OE/stuff/build/tmp/cross/share/doc
+ export NM_FOR_TARGET=arm-angstrom-linux-gnueabi-nm
+ NM_FOR_TARGET=arm-angstrom-linux-gnueabi-nm
+ export palmqtdir=/Volumes/OE/stuff/build/tmp/cross/lib/opie
+ palmqtdir=/Volumes/OE/stuff/build/tmp/cross/lib/opie
+ export base_sbindir=/Volumes/OE/stuff/build/tmp/cross/bin
+ base_sbindir=/Volumes/OE/stuff/build/tmp/cross/bin
+ export 'CXX=ccache g++'
+ CXX=ccache g++
+ export 
PKG_CONFIG_PATH=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/lib/pkgconfig
+ 
PKG_CONFIG_PATH=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/lib/pkgconfig
+ unset MACHINE
+ export AR=ar
+ AR=ar
+ export PATCH_GET=0
+ PATCH_GET=0
+ export libdir=/Volumes/OE/stuff/build/tmp/cross/lib
+ libdir=/Volumes/OE/stuff/build/tmp/cross/lib
+ export 
'CXXFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include 
-Os'
+ 
CXXFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include -Os
+ export NM=nm
+ NM=nm
+ export 
MANIFEST=/Volumes/OE/stuff/org.openembedded.dev/packages/binutils/binutils-2.17.50.0.5/manifest
+ 
MANIFEST=/Volumes/OE/stuff/org.openembedded.dev/packages/binutils/binutils-2.17.50.0.5/manifest
+ export 'CC_FOR_BUILD=ccache gcc'
+ CC_FOR_BUILD=ccache gcc
+ export BUILD_STRIP=strip
+ BUILD_STRIP=strip
+ export RANLIB_FOR_TARGET=arm-angstrom-linux-gnueabi-ranlib
+ RANLIB_FOR_TARGET=arm-angstrom-linux-gnueabi-ranlib
+ export AS=as
+ AS=as
+ export BUILD_RANLIB=ranlib
+ BUILD_RANLIB=ranlib
+ export sysconfdir=/Volumes/OE/stuff/build/tmp/cross/etc
+ sysconfdir=/Volumes/OE/stuff/build/tmp/cross/etc
+ export 
BUILD_CPPFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include
+ 
BUILD_CPPFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include
+ cd 
/Volumes/OE/stuff/build/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-cross-2.17.50.0.5-r1/binutils-2.17.50.0.5/build.i386-darwin.arm-angstrom-linux-gnueabi
+ do_configure
/Volumes/OE/stuff/build/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-cross-2.17.50.0.5-r1/temp/run.do_configure.6190: 
line 757: do_configure: command not found
ERROR: function do_configure failed
ERROR: log data follows 
(/Volumes/OE/stuff/build/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-cross-2.17.50.0.5-r1/temp/log.do_configure.6190)
| + export localstatedir=/Volumes/OE/stuff/build/tmp/cross/var
| + localstatedir=/Volumes/OE/stuff/build/tmp/cross/var
| + export prefix=/Volumes/OE/stuff/build/tmp/cross
| + prefix=/Volumes/OE/stuff/build/tmp/cross
| + export 'CPP=gcc -E'
| + CPP=gcc -E
| + export mandir=/Volumes/OE/stuff/build/tmp/cross/share/man
| + mandir=/Volumes/OE/stuff/build/tmp/cross/share/man
| + export STRIP=strip
| + STRIP=strip
| + export 
STAGING_SIPDIR=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/share/sip
| + STAGING_SIPDIR=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/share/sip
| + export 'BUILD_CC=ccache gcc'
| + BUILD_CC=ccache gcc
| + export 
'BUILD_CXXFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include 
-Os -fpermissive'
| + 
BUILD_CXXFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include 
-Os -fpermissive
| + export OBJCOPY=objcopy
| + OBJCOPY=objcopy
| + export libexecdir=/Volumes/OE/stuff/build/tmp/cross/libexec
| + libexecdir=/Volumes/OE/stuff/build/tmp/cross/libexec
| + export QTDIR=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/qt2
| + QTDIR=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/qt2
| + export datadir=/Volumes/OE/stuff/build/tmp/cross/share
| + datadir=/Volumes/OE/stuff/build/tmp/cross/share
| + export 'BUILD_CXX=ccache g++'
| + BUILD_CXX=ccache g++
| + export LD=ld
| + LD=ld
| + export LD_FOR_TARGET=arm-angstrom-linux-gnueabi-ld
| + LD_FOR_TARGET=arm-angstrom-linux-gnueabi-ld
| + export 'EXTRA_OEMAKE=configure-build-libiberty all'
| + EXTRA_OEMAKE=configure-build-libiberty all
| + export LDFLAGS=-L/Volumes/OE/stuff/build/tmp/staging/i386-darwin/lib
| + LDFLAGS=-L/Volumes/OE/stuff/build/tmp/staging/i386-darwin/lib
| + export bindir=/Volumes/OE/stuff/build/tmp/cross/bin
| + bindir=/Volumes/OE/stuff/build/tmp/cross/bin
| + export 
'TARGET_CXXFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/arm-angstrom-linux-gnueabi/include 
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os 
-fpermissive'
| + 
TARGET_CXXFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/arm-angstrom-linux-gnueabi/include 
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os 
-fpermissive
| + export MAKE=make
| + MAKE=make
| + export CPP_FOR_BUILD=cpp
| + CPP_FOR_BUILD=cpp
| + export exec_prefix=/Volumes/OE/stuff/build/tmp/cross
| + exec_prefix=/Volumes/OE/stuff/build/tmp/cross
| + export OPIEDIR=/Volumes/OE/stuff/build/tmp/staging/i386-darwin
| + OPIEDIR=/Volumes/OE/stuff/build/tmp/staging/i386-darwin
| + export 
'BUILD_LDFLAGS=-L/Volumes/OE/stuff/build/tmp/staging/i386-darwin/lib 
-Wl,-rpath-link,/Volumes/OE/stuff/build/tmp/staging/i386-darwin/lib 
-Wl,-rpath,/Volumes/OE/stuff/build/tmp/staging/i386-darwin/lib -Wl,-O1'
| + BUILD_LDFLAGS=-L/Volumes/OE/stuff/build/tmp/staging/i386-darwin/lib 
-Wl,-rpath-link,/Volumes/OE/stuff/build/tmp/staging/i386-darwin/lib 
-Wl,-rpath,/Volumes/OE/stuff/build/tmp/staging/i386-darwin/lib -Wl,-O1
| + export 
STAGING_IDLDIR=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/share/idl
| + STAGING_IDLDIR=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/share/idl
| + export BUILD_LD=ld
| + BUILD_LD=ld
| + export oldincludedir=/Volumes/OE/stuff/build/tmp/cross/include
| + oldincludedir=/Volumes/OE/stuff/build/tmp/cross/include
| + export 'CCLD=ccache gcc'
| + CCLD=ccache gcc
| + export QPEDIR=/Volumes/OE/stuff/build/tmp/staging/i386-darwin
| + QPEDIR=/Volumes/OE/stuff/build/tmp/staging/i386-darwin
| + export BUILD_CCLD=gcc
| + BUILD_CCLD=gcc
| + export 
BBPATH=/Volumes/OE/stuff/org.openembedded.dev/packages/binutils:/Volumes/OE/stuff/org.openembedded.dev/packages/binutils:/Volumes/OE/stuff/org.openembedded.dev/packages/binutils:/Volumes/OE/stuff/org.openembedded.dev/packages/binutils:/Volumes/OE/stuff/org.openembedded.dev/conf/distro/include:/Volumes/OE/stuff/org.openembedded.dev/conf/distro/include:/Volumes/OE/stuff/org.openembedded.dev/conf/distro/include:/Volumes/OE/stuff/org.openembedded.dev/conf/distro/include:/Volumes/OE/stuff/org.openembedded.dev/conf/distro/include:/Volumes/OE/stuff/org.openembedded.dev/conf/distro/include:/Volumes/OE/stuff/build:/Volumes/OE/stuff/org.openembedded.dev
| + 
BBPATH=/Volumes/OE/stuff/org.openembedded.dev/packages/binutils:/Volumes/OE/stuff/org.openembedded.dev/packages/binutils:/Volumes/OE/stuff/org.openembedded.dev/packages/binutils:/Volumes/OE/stuff/org.openembedded.dev/packages/binutils:/Volumes/OE/stuff/org.openembedded.dev/conf/distro/include:/Volumes/OE/stuff/org.openembedded.dev/conf/distro/include:/Volumes/OE/stuff/org.openembedded.dev/conf/distro/include:/Volumes/OE/stuff/org.openembedded.dev/conf/distro/include:/Volumes/OE/stuff/org.openembedded.dev/conf/distro/include:/Volumes/OE/stuff/org.openembedded.dev/conf/distro/include:/Volumes/OE/stuff/build:/Volumes/OE/stuff/org.openembedded.dev
| + export base_libdir=/Volumes/OE/stuff/build/tmp/cross/lib
| + base_libdir=/Volumes/OE/stuff/build/tmp/cross/lib
| + export 
'TARGET_CFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/arm-angstrom-linux-gnueabi/include 
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os'
| + 
TARGET_CFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/arm-angstrom-linux-gnueabi/include 
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os
| + export base_bindir=/Volumes/OE/stuff/build/tmp/cross/bin
| + base_bindir=/Volumes/OE/stuff/build/tmp/cross/bin
| + export AR_FOR_TARGET=arm-angstrom-linux-gnueabi-ar
| + AR_FOR_TARGET=arm-angstrom-linux-gnueabi-ar
| + export 
'CFLAGS_FOR_BUILD=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include 
-Os'
| + 
CFLAGS_FOR_BUILD=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include 
-Os
| + export includedir=/Volumes/OE/stuff/build/tmp/cross/include
| + includedir=/Volumes/OE/stuff/build/tmp/cross/include
| + export servicedir=/Volumes/OE/stuff/build/tmp/cross/srv
| + servicedir=/Volumes/OE/stuff/build/tmp/cross/srv
| + export BUILD_CPP=cpp
| + BUILD_CPP=cpp
| + export AS_FOR_TARGET=arm-angstrom-linux-gnueabi-as
| + AS_FOR_TARGET=arm-angstrom-linux-gnueabi-as
| + export 
TARGET_CPPFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/arm-angstrom-linux-gnueabi/include
| + 
TARGET_CPPFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/arm-angstrom-linux-gnueabi/include
| + export sbindir=/Volumes/OE/stuff/build/tmp/cross/bin
| + sbindir=/Volumes/OE/stuff/build/tmp/cross/bin
| + export 
'CFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include -Os'
| + 
CFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include -Os
| + export BUILD_AR=ar
| + BUILD_AR=ar
| + export sharedstatedir=/Volumes/OE/stuff/build/tmp/cross/com
| + sharedstatedir=/Volumes/OE/stuff/build/tmp/cross/com
| + export 'F77=ccache g77'
| + F77=ccache g77
| + export OBJDUMP=objdump
| + OBJDUMP=objdump
| + export 'CC_FOR_HOST=ccache gcc'
| + CC_FOR_HOST=ccache gcc
| + export 
'BUILD_CFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include 
-Os'
| + 
BUILD_CFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include 
-Os
| + unset DISTRO
| + export 
QMAKE_MKSPEC_PATH=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/share/qmake
| + 
QMAKE_MKSPEC_PATH=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/share/qmake
| + export 
PKG_CONFIG_DIR=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/lib/pkgconfig
| + 
PKG_CONFIG_DIR=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/lib/pkgconfig
| + export palmtopdir=/Volumes/OE/stuff/build/tmp/cross/lib/opie
| + palmtopdir=/Volumes/OE/stuff/build/tmp/cross/lib/opie
| + export PKG_CONFIG_DISABLE_UNINSTALLED=yes
| + PKG_CONFIG_DISABLE_UNINSTALLED=yes
| + export infodir=/Volumes/OE/stuff/build/tmp/cross/share/info
| + infodir=/Volumes/OE/stuff/build/tmp/cross/share/info
| + export base_prefix=/Volumes/OE/stuff/build/tmp/cross
| + base_prefix=/Volumes/OE/stuff/build/tmp/cross
| + export 'CC=ccache gcc'
| + CC=ccache gcc
| + export 
PATH=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/bin/i386-darwin:/Volumes/OE/stuff/build/tmp/staging/i386-darwin/bin:/Volumes/OE/stuff/build/tmp/cross/bin:/opt/local/bin/:/sw/bin:/Volumes/OE/stuff/bitbake/bin:/usr/local/bin/:/opt/local/bin:/opt/local/sbin:/sw/bin:/sw/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/X11R6/bin
| + 
PATH=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/bin/i386-darwin:/Volumes/OE/stuff/build/tmp/staging/i386-darwin/bin:/Volumes/OE/stuff/build/tmp/cross/bin:/opt/local/bin/:/sw/bin:/Volumes/OE/stuff/bitbake/bin:/usr/local/bin/:/opt/local/bin:/opt/local/sbin:/sw/bin:/sw/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/X11R6/bin
| + export 'BUILD_F77=ccache g77'
| + BUILD_F77=ccache g77
| + export RANLIB=ranlib
| + RANLIB=ranlib
| + export 
'TARGET_LDFLAGS=-L/Volumes/OE/stuff/build/tmp/staging/arm-angstrom-linux-gnueabi/lib 
-Wl,-rpath-link,/Volumes/OE/stuff/build/tmp/staging/arm-angstrom-linux-gnueabi/lib 
-Wl,-O1'
| + 
TARGET_LDFLAGS=-L/Volumes/OE/stuff/build/tmp/staging/arm-angstrom-linux-gnueabi/lib 
-Wl,-rpath-link,/Volumes/OE/stuff/build/tmp/staging/arm-angstrom-linux-gnueabi/lib 
-Wl,-O1
| + export 'CXX_FOR_HOST=ccache gcc'
| + CXX_FOR_HOST=ccache gcc
| + export 
CPPFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include
| + CPPFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include
| + export docdir=/Volumes/OE/stuff/build/tmp/cross/share/doc
| + docdir=/Volumes/OE/stuff/build/tmp/cross/share/doc
| + export NM_FOR_TARGET=arm-angstrom-linux-gnueabi-nm
| + NM_FOR_TARGET=arm-angstrom-linux-gnueabi-nm
| + export palmqtdir=/Volumes/OE/stuff/build/tmp/cross/lib/opie
| + palmqtdir=/Volumes/OE/stuff/build/tmp/cross/lib/opie
| + export base_sbindir=/Volumes/OE/stuff/build/tmp/cross/bin
| + base_sbindir=/Volumes/OE/stuff/build/tmp/cross/bin
| + export 'CXX=ccache g++'
| + CXX=ccache g++
| + export 
PKG_CONFIG_PATH=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/lib/pkgconfig
| + 
PKG_CONFIG_PATH=/Volumes/OE/stuff/build/tmp/staging/i386-darwin/lib/pkgconfig
| + unset MACHINE
| + export AR=ar
| + AR=ar
| + export PATCH_GET=0
| + PATCH_GET=0
| + export libdir=/Volumes/OE/stuff/build/tmp/cross/lib
| + libdir=/Volumes/OE/stuff/build/tmp/cross/lib
| + export 
'CXXFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include 
-Os'
| + 
CXXFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include -Os
| + export NM=nm
| + NM=nm
| + export 
MANIFEST=/Volumes/OE/stuff/org.openembedded.dev/packages/binutils/binutils-2.17.50.0.5/manifest
| + 
MANIFEST=/Volumes/OE/stuff/org.openembedded.dev/packages/binutils/binutils-2.17.50.0.5/manifest
| + export 'CC_FOR_BUILD=ccache gcc'
| + CC_FOR_BUILD=ccache gcc
| + export BUILD_STRIP=strip
| + BUILD_STRIP=strip
| + export RANLIB_FOR_TARGET=arm-angstrom-linux-gnueabi-ranlib
| + RANLIB_FOR_TARGET=arm-angstrom-linux-gnueabi-ranlib
| + export AS=as
| + AS=as
| + export BUILD_RANLIB=ranlib
| + BUILD_RANLIB=ranlib
| + export sysconfdir=/Volumes/OE/stuff/build/tmp/cross/etc
| + sysconfdir=/Volumes/OE/stuff/build/tmp/cross/etc
| + export 
BUILD_CPPFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include
| + 
BUILD_CPPFLAGS=-isystem/Volumes/OE/stuff/build/tmp/staging/i386-darwin/include
| + cd 
/Volumes/OE/stuff/build/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-cross-2.17.50.0.5-r1/binutils-2.17.50.0.5/build.i386-darwin.arm-angstrom-linux-gnueabi
| + do_configure
| 
/Volumes/OE/stuff/build/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-cross-2.17.50.0.5-r1/temp/run.do_configure.6190: 
line 757: do_configure: command not found
NOTE: Task failed: 
/Volumes/OE/stuff/build/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-cross-2.17.50.0.5-r1/temp/log.do_configure.6190
NOTE: package binutils-cross-2.17.50.0.5-r1: task do_configure: failed
ERROR: TaskFailed event exception, aborting
NOTE: package binutils-cross-2.17.50.0.5: failed
ERROR: Build of 'binutils-cross' failed

Koen Kooi пишет:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Rod Whitby schreef:
>   
>> yakov.zaytsev@gmail.com wrote:
>>     
>>> ..binutils-cross-2.17.50.0.5-r1/temp/log.do_configure.8057 contains
>>>
>>> --
>>> /Volumes/OE/stuff/build/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-
>>> cross-2.17.50.0.5-r1/temp/run.do_configure.8057: line 782: do_configure:
>>> command not found
>>>       
>> You've been bitten by the "build crosses midnight GMT" bitbake bug.
>>
>> Rebuild the affected package using "make rebuild-package-binutils-cross"
>> if this occurs.  See Mickey's other email on the subject.
>>     
>
> you mean 'bitbake -c rebuild binutils-cross'? Please stop with those unhelpfull comments.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFGzW1FMkyGM64RGpERArIgAJ9DUEs1fP8yR4OyXW0MZ5rCdg3mPgCfX5MK
> lmpW4rkUJSNiYAiZpgIKdnI=
> =+zA4
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>   



