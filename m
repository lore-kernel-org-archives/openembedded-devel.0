Received: from asmtpout023.mac.com ([17.148.16.98])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1NZ4ZK-0000tW-Bf
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 16:40:09 +0100
MIME-version: 1.0
Received: from [87.201.169.25] by asmtp023.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KWR007NWCQS4J30@asmtp023.mac.com> for
	openembedded-devel@lists.openembedded.org; Sun,
	24 Jan 2010 07:37:45 -0800 (PST)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 phishscore=0 bulkscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx engine=5.0.0-0908210000 definitions=main-1001240062
From: Elvis Dowson <elvis.dowson@mac.com>
X-Priority: 1
In-reply-to: <687C35F4-E7DC-4898-907F-8C1CE8890887@mac.com>
Date: Sun, 24 Jan 2010 19:37:36 +0400
Message-id: <9210BA9D-8420-46C3-BDD6-CEE4E853B42F@mac.com>
References: <687C35F4-E7DC-4898-907F-8C1CE8890887@mac.com>
To: OpenEmbedded Developer <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.1077)
X-SA-Exim-Connect-IP: 17.148.16.98
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Build failure module-init-tools-cross_3.2.2.bb on Fedora 12 x86_64
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
X-List-Received-Date: Sun, 24 Jan 2010 15:40:10 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=us-ascii

Hi,

On Jan 24, 2010, at 7:29 PM, Elvis Dowson wrote:

> $ bitbake -DD -c rebuild module-init-tools-cross

Here is the correct output using the -DD option. 

ccache gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\" -I.   -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include  -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g -Wunused -Wall -MT modinfo.o -MD -MP -MF .deps/modinfo.Tpo -c -o modinfo.o modinfo.c
ccache gcc  -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g -Wunused -Wall -static -L/tool/overo-oe/tmp/staging/x86_64-linux/usr/lib -Wl,-rpath-link,/tool/overo-oe/tmp/staging/x86_64-linux/usr/lib -Wl,-rpath,/tool/overo-oe/tmp/staging/x86_64-linux/usr/lib -Wl,-O1 -o insmod.static insmod.o  
/usr/bin/ld: cannot find -lc
collect2: ld returned 1 exit status
make: *** [insmod.static] Error 1
make: *** Waiting for unfinished jobs....
mv -f .deps/depmod.Tpo .deps/depmod.Po
mv -f .deps/moduleops.Tpo .deps/moduleops.Po
modinfo.c: In function 'main':
modinfo.c:338: warning: 'infosize' may be used uninitialized in this function
mv -f .deps/modinfo.Tpo .deps/modinfo.Po
+ die 'oe_runmake failed'
+ oefatal 'oe_runmake failed'
+ echo FATAL: 'oe_runmake failed'
FATAL: oe_runmake failed
+ exit 1
ERROR: function do_compile failed
ERROR: log data follows (/tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/module-init-tools-cross-3.2.2-r5/temp/log.do_compile.27805)
| + export localstatedir=/tool/overo-oe/tmp/cross/armv7a/var
| + localstatedir=/tool/overo-oe/tmp/cross/armv7a/var
| + export prefix=/tool/overo-oe/tmp/cross/armv7a
| + prefix=/tool/overo-oe/tmp/cross/armv7a
| + export STRIP=strip
| + STRIP=strip
| + export STAGING_SIPDIR=/tool/overo-oe/tmp/staging/x86_64-linux/usr/share/sip
| + STAGING_SIPDIR=/tool/overo-oe/tmp/staging/x86_64-linux/usr/share/sip
| + export 'BUILD_CC=ccache gcc'
| + BUILD_CC='ccache gcc'
| + export PSTAGING_ACTIVE=1
| + PSTAGING_ACTIVE=1
| + export GTK_RC_FILES=/etc/gtk/gtkrc:/home/elvis/.gtkrc-1.2-gnome2
| + GTK_RC_FILES=/etc/gtk/gtkrc:/home/elvis/.gtkrc-1.2-gnome2
| + export libexecdir=/tool/overo-oe/tmp/cross/armv7a/libexec
| + libexecdir=/tool/overo-oe/tmp/cross/armv7a/libexec
| + export datadir=/tool/overo-oe/tmp/cross/armv7a/share
| + datadir=/tool/overo-oe/tmp/cross/armv7a/share
| + export 'BUILD_CXX=ccache g++'
| + BUILD_CXX='ccache g++'
| + export LD=ld
| + LD=ld
| + export 'EXTRA_OEMAKE=-j 8'
| + EXTRA_OEMAKE='-j 8'
| + export bindir=/tool/overo-oe/tmp/cross/armv7a/bin
| + bindir=/tool/overo-oe/tmp/cross/armv7a/bin
| + export TERM=xterm
| + TERM=xterm
| + export 'TARGET_CXXFLAGS=-isystem/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/tool/overo-oe/tmp/cross/armv7a/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3 -fpermissive'
| + TARGET_CXXFLAGS='-isystem/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/tool/overo-oe/tmp/cross/armv7a/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3 -fpermissive'
| + export includedir=/tool/overo-oe/tmp/cross/armv7a/include
| + includedir=/tool/overo-oe/tmp/cross/armv7a/include
| + export MANIFEST=/tool/overo-oe/org.openembedded.dev/recipes/module-init-tools/files/./manifest
| + MANIFEST=/tool/overo-oe/org.openembedded.dev/recipes/module-init-tools/files/./manifest
| + export 'BUILD_LDFLAGS=-L/tool/overo-oe/tmp/staging/x86_64-linux/usr/lib -Wl,-rpath-link,/tool/overo-oe/tmp/staging/x86_64-linux/usr/lib -Wl,-rpath,/tool/overo-oe/tmp/staging/x86_64-linux/usr/lib -Wl,-O1'
| + BUILD_LDFLAGS='-L/tool/overo-oe/tmp/staging/x86_64-linux/usr/lib -Wl,-rpath-link,/tool/overo-oe/tmp/staging/x86_64-linux/usr/lib -Wl,-rpath,/tool/overo-oe/tmp/staging/x86_64-linux/usr/lib -Wl,-O1'
| + export BUILD_LD=ld
| + BUILD_LD=ld
| + export 'SDK_CFLAGS=-isystem/tool/overo-oe/tmp/staging/x86_64-linux/tool/overo-oe/tmp/cross/armv7a/include -isystem/tool/overo-oe/tmp/staging/x86_64-linux/tool/overo-oe/tmp/cross/armv7a/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3'
| + SDK_CFLAGS='-isystem/tool/overo-oe/tmp/staging/x86_64-linux/tool/overo-oe/tmp/cross/armv7a/include -isystem/tool/overo-oe/tmp/staging/x86_64-linux/tool/overo-oe/tmp/cross/armv7a/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3'
| + export oldincludedir=/tool/overo-oe/tmp/cross/armv7a/include
| + oldincludedir=/tool/overo-oe/tmp/cross/armv7a/include
| + export LANG=en_US.UTF-8
| + LANG=en_US.UTF-8
| + export BUILD_CCLD=gcc
| + BUILD_CCLD=gcc
| + export USER=elvis
| + USER=elvis
| + export XDG_DATA_DIRS=/tool/overo-oe/tmp/staging/x86_64-linux/tool/overo-oe/tmp/cross/armv7a/share
| + XDG_DATA_DIRS=/tool/overo-oe/tmp/staging/x86_64-linux/tool/overo-oe/tmp/cross/armv7a/share
| + export DBUS_SESSION_BUS_ADDRESS=unix:abstract=/tmp/dbus-p3mNrvl7uY,guid=9e2668a2b3f91001a28d7e2f4b5b59a3
| + DBUS_SESSION_BUS_ADDRESS=unix:abstract=/tmp/dbus-p3mNrvl7uY,guid=9e2668a2b3f91001a28d7e2f4b5b59a3
| + export XAUTHORITY=/var/run/gdm/auth-for-elvis-thM9qx/database
| + XAUTHORITY=/var/run/gdm/auth-for-elvis-thM9qx/database
| + export QMAKE_MKSPEC_PATH=/tool/overo-oe/tmp/staging/x86_64-linux/usr/share/qmake
| + QMAKE_MKSPEC_PATH=/tool/overo-oe/tmp/staging/x86_64-linux/usr/share/qmake
| + export palmtopdir=/tool/overo-oe/tmp/cross/armv7a/lib/opie
| + palmtopdir=/tool/overo-oe/tmp/cross/armv7a/lib/opie
| + export 'SDK_CPPFLAGS=-isystem/tool/overo-oe/tmp/staging/x86_64-linux/tool/overo-oe/tmp/cross/armv7a/include -isystem/tool/overo-oe/tmp/staging/x86_64-linux/tool/overo-oe/tmp/cross/armv7a/include'
| + SDK_CPPFLAGS='-isystem/tool/overo-oe/tmp/staging/x86_64-linux/tool/overo-oe/tmp/cross/armv7a/include -isystem/tool/overo-oe/tmp/staging/x86_64-linux/tool/overo-oe/tmp/cross/armv7a/include'
| + export 'CC=ccache gcc'
| + CC='ccache gcc'
| + export GNOME_KEYRING_SOCKET=/tmp/keyring-aNAZ4b/socket
| + GNOME_KEYRING_SOCKET=/tmp/keyring-aNAZ4b/socket
| + export CPPFLAGS=-isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include
| + CPPFLAGS=-isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include
| + export RANLIB=ranlib
| + RANLIB=ranlib
| + export base_sbindir=/tool/overo-oe/tmp/cross/armv7a/bin
| + base_sbindir=/tool/overo-oe/tmp/cross/armv7a/bin
| + export 'CXX=ccache g++'
| + CXX='ccache g++'
| + export BUILD_RANLIB=ranlib
| + BUILD_RANLIB=ranlib
| + export COLORTERM=gnome-terminal
| + COLORTERM=gnome-terminal
| + export mandir=/tool/overo-oe/tmp/cross/armv7a/share/man
| + mandir=/tool/overo-oe/tmp/cross/armv7a/share/man
| + export USERBRANCH=/tool/overo-oe/user.collection
| + USERBRANCH=/tool/overo-oe/user.collection
| + export OBJCOPY=objcopy
| + OBJCOPY=objcopy
| + export servicedir=/tool/overo-oe/tmp/cross/armv7a/srv
| + servicedir=/tool/overo-oe/tmp/cross/armv7a/srv
| + export 'SDK_LDFLAGS=-L/tool/overo-oe/tmp/staging/x86_64-linux/tool/overo-oe/tmp/cross/armv7a/lib -Wl,-rpath-link,/tool/overo-oe/tmp/staging/x86_64-linux/tool/overo-oe/tmp/cross/armv7a/lib -Wl,-O1'
| + SDK_LDFLAGS='-L/tool/overo-oe/tmp/staging/x86_64-linux/tool/overo-oe/tmp/cross/armv7a/lib -Wl,-rpath-link,/tool/overo-oe/tmp/staging/x86_64-linux/tool/overo-oe/tmp/cross/armv7a/lib -Wl,-O1'
| + export PKG_CONFIG_DIR=/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/tool/overo-oe/tmp/cross/armv7a/lib/pkgconfig
| + PKG_CONFIG_DIR=/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/tool/overo-oe/tmp/cross/armv7a/lib/pkgconfig
| + export 'BB_ENV_EXTRAWHITE=MACHINE DISTRO ANGSTROM_MODE OVEROTOP OEBRANCH USERBRANCH TITOOLSDIR'
| + BB_ENV_EXTRAWHITE='MACHINE DISTRO ANGSTROM_MODE OVEROTOP OEBRANCH USERBRANCH TITOOLSDIR'
| + export sysconfdir=/tool/overo-oe/tmp/cross/armv7a/etc
| + sysconfdir=/tool/overo-oe/tmp/cross/armv7a/etc
| + export 'CCLD=ccache gcc'
| + CCLD='ccache gcc'
| + export base_bindir=/tool/overo-oe/tmp/cross/armv7a/bin
| + base_bindir=/tool/overo-oe/tmp/cross/armv7a/bin
| + export sbindir=/tool/overo-oe/tmp/cross/armv7a/bin
| + sbindir=/tool/overo-oe/tmp/cross/armv7a/bin
| + export 'CFLAGS=-isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g'
| + CFLAGS='-isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g'
| + export PKG_CONFIG_DISABLE_UNINSTALLED=yes
| + PKG_CONFIG_DISABLE_UNINSTALLED=yes
| + export OPIEDIR=/tool/overo-oe/tmp/staging/x86_64-linux
| + OPIEDIR=/tool/overo-oe/tmp/staging/x86_64-linux
| + export 'BUILD_F77=ccache g77'
| + BUILD_F77='ccache g77'
| + export PWD=/tool/overo-oe
| + PWD=/tool/overo-oe
| + export _=/tool/overo-oe/bitbake/bin/bitbake
| + _=/tool/overo-oe/bitbake/bin/bitbake
| + export AS=as
| + AS=as
| + export PATCH_GET=0
| + PATCH_GET=0
| + export 'CXXFLAGS=-isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g'
| + CXXFLAGS='-isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g'
| + export DISPLAY=:0.0
| + DISPLAY=:0.0
| + export NM=nm
| + NM=nm
| + export 'F77=ccache g77'
| + F77='ccache g77'
| + export GNOME_KEYRING_PID=1795
| + GNOME_KEYRING_PID=1795
| + export SSH_AUTH_SOCK=/tmp/keyring-aNAZ4b/socket.ssh
| + SSH_AUTH_SOCK=/tmp/keyring-aNAZ4b/socket.ssh
| + export QTDIR=/tool/overo-oe/tmp/staging/x86_64-linux/qt2
| + QTDIR=/tool/overo-oe/tmp/staging/x86_64-linux/qt2
| + export 'LDFLAGS=-L/tool/overo-oe/tmp/staging/x86_64-linux/usr/lib -Wl,-rpath-link,/tool/overo-oe/tmp/staging/x86_64-linux/usr/lib -Wl,-rpath,/tool/overo-oe/tmp/staging/x86_64-linux/usr/lib -Wl,-O1'
| + LDFLAGS='-L/tool/overo-oe/tmp/staging/x86_64-linux/usr/lib -Wl,-rpath-link,/tool/overo-oe/tmp/staging/x86_64-linux/usr/lib -Wl,-rpath,/tool/overo-oe/tmp/staging/x86_64-linux/usr/lib -Wl,-O1'
| + export MAKE=make
| + MAKE=make
| + unset TARGET_ARCH
| + export 'SHELLCMDS=bash --rcfile '
| + SHELLCMDS='bash --rcfile '
| + export QPEDIR=/tool/overo-oe/tmp/staging/x86_64-linux
| + QPEDIR=/tool/overo-oe/tmp/staging/x86_64-linux
| + export TITOOLSDIR=/tool/overo-oe/ti
| + TITOOLSDIR=/tool/overo-oe/ti
| + export BBPATH=/tool/overo-oe/build:/tool/overo-oe/user.collection:/tool/overo-oe/org.openembedded.dev
| + BBPATH=/tool/overo-oe/build:/tool/overo-oe/user.collection:/tool/overo-oe/org.openembedded.dev
| + export BUILD_CPP=cpp
| + BUILD_CPP=cpp
| + export 'SDK_CXXFLAGS=-isystem/tool/overo-oe/tmp/staging/x86_64-linux/tool/overo-oe/tmp/cross/armv7a/include -isystem/tool/overo-oe/tmp/staging/x86_64-linux/tool/overo-oe/tmp/cross/armv7a/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3 -fpermissive'
| + SDK_CXXFLAGS='-isystem/tool/overo-oe/tmp/staging/x86_64-linux/tool/overo-oe/tmp/cross/armv7a/include -isystem/tool/overo-oe/tmp/staging/x86_64-linux/tool/overo-oe/tmp/cross/armv7a/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3 -fpermissive'
| + export 'BUILD_CFLAGS=-isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g'
| + BUILD_CFLAGS='-isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g'
| + export docdir=/tool/overo-oe/tmp/cross/armv7a/share/doc
| + docdir=/tool/overo-oe/tmp/cross/armv7a/share/doc
| + export infodir=/tool/overo-oe/tmp/cross/armv7a/share/info
| + infodir=/tool/overo-oe/tmp/cross/armv7a/share/info
| + export base_prefix=/tool/overo-oe/tmp/cross/armv7a
| + base_prefix=/tool/overo-oe/tmp/cross/armv7a
| + export 'TARGET_LDFLAGS=-L/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/tool/overo-oe/tmp/cross/armv7a/lib -Wl,-rpath-link,/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/tool/overo-oe/tmp/cross/armv7a/lib -Wl,-O1 -Wl,--hash-style=gnu'
| + TARGET_LDFLAGS='-L/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/tool/overo-oe/tmp/cross/armv7a/lib -Wl,-rpath-link,/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/tool/overo-oe/tmp/cross/armv7a/lib -Wl,-O1 -Wl,--hash-style=gnu'
| + export PKG_CONFIG_SYSROOT_DIR=/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi
| + PKG_CONFIG_SYSROOT_DIR=/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi
| + export PKG_CONFIG_PATH=/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/tool/overo-oe/tmp/cross/armv7a/lib/pkgconfig:/tool/overo-oe/tmp/staging/x86_64-linux/tool/overo-oe/tmp/cross/armv7a/share/pkgconfig
| + PKG_CONFIG_PATH=/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/tool/overo-oe/tmp/cross/armv7a/lib/pkgconfig:/tool/overo-oe/tmp/staging/x86_64-linux/tool/overo-oe/tmp/cross/armv7a/share/pkgconfig
| + export AR=ar
| + AR=ar
| + export BUILD_CPPFLAGS=-isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include
| + BUILD_CPPFLAGS=-isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include
| + export 'CPP=gcc -E'
| + CPP='gcc -E'
| + export 'CONFIG_SITE=/tool/overo-oe/org.openembedded.dev/site/endian-little /tool/overo-oe/org.openembedded.dev/site/common-linux /tool/overo-oe/org.openembedded.dev/site/common-glibc /tool/overo-oe/org.openembedded.dev/site/x86_64-linux /tool/overo-oe/org.openembedded.dev/site/common /tool/overo-oe/org.openembedded.dev/site/common'
| + CONFIG_SITE='/tool/overo-oe/org.openembedded.dev/site/endian-little /tool/overo-oe/org.openembedded.dev/site/common-linux /tool/overo-oe/org.openembedded.dev/site/common-glibc /tool/overo-oe/org.openembedded.dev/site/x86_64-linux /tool/overo-oe/org.openembedded.dev/site/common /tool/overo-oe/org.openembedded.dev/site/common'
| + export 'BUILD_CXXFLAGS=-isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g -fpermissive'
| + BUILD_CXXFLAGS='-isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g -fpermissive'
| + export SESSION_MANAGER=local/unix:@/tmp/.ICE-unix/1802,unix/unix:/tmp/.ICE-unix/1802
| + SESSION_MANAGER=local/unix:@/tmp/.ICE-unix/1802,unix/unix:/tmp/.ICE-unix/1802
| + export HOME=/home/elvis
| + HOME=/home/elvis
| + export USERNAME=elvis
| + USERNAME=elvis
| + export TARGET_CPPFLAGS=-isystem/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/tool/overo-oe/tmp/cross/armv7a/include
| + TARGET_CPPFLAGS=-isystem/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/tool/overo-oe/tmp/cross/armv7a/include
| + export DESKTOP_SESSION=gnome
| + DESKTOP_SESSION=gnome
| + export exec_prefix=/tool/overo-oe/tmp/cross/armv7a
| + exec_prefix=/tool/overo-oe/tmp/cross/armv7a
| + export base_libdir=/tool/overo-oe/tmp/cross/armv7a/lib
| + base_libdir=/tool/overo-oe/tmp/cross/armv7a/lib
| + export STAGING_IDLDIR=/tool/overo-oe/tmp/staging/x86_64-linux/tool/overo-oe/tmp/cross/armv7a/share/idl
| + STAGING_IDLDIR=/tool/overo-oe/tmp/staging/x86_64-linux/tool/overo-oe/tmp/cross/armv7a/share/idl
| + export OEBRANCH=/tool/overo-oe/org.openembedded.dev
| + OEBRANCH=/tool/overo-oe/org.openembedded.dev
| + export LOGNAME=elvis
| + LOGNAME=elvis
| + export PATH=/tool/overo-oe/tmp/staging/x86_64-linux/usr/bin/armv7a-linux:/tool/overo-oe/tmp/staging/x86_64-linux/usr/bin/armv7a-angstrom-linux-gnueabi:/tool/overo-oe/tmp/staging/x86_64-linux/usr/sbin:/tool/overo-oe/tmp/staging/x86_64-linux/usr/bin:/tool/overo-oe/tmp/cross/armv7a//bin:/tool/overo-oe/tmp/staging/x86_64-linux/sbin:/tool/overo-oe/tmp/staging/x86_64-linux/bin:/tool/script:/tool/android/out/host/linux-x86_64/bin:/tool/overo-oe/bitbake/bin:/tool/overo-oe/tmp/cross/armv7a/bin:/tool/script:/tool/android/out/host/linux-x86_64/bin:/tool/overo-oe/bitbake/bin:/tool/overo-oe/tmp/cross/armv7a/bin:/usr/lib64/qt-3.3/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/usr/lib64/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/elvis/bin
| + PATH=/tool/overo-oe/tmp/staging/x86_64-linux/usr/bin/armv7a-linux:/tool/overo-oe/tmp/staging/x86_64-linux/usr/bin/armv7a-angstrom-linux-gnueabi:/tool/overo-oe/tmp/staging/x86_64-linux/usr/sbin:/tool/overo-oe/tmp/staging/x86_64-linux/usr/bin:/tool/overo-oe/tmp/cross/armv7a//bin:/tool/overo-oe/tmp/staging/x86_64-linux/sbin:/tool/overo-oe/tmp/staging/x86_64-linux/bin:/tool/script:/tool/android/out/host/linux-x86_64/bin:/tool/overo-oe/bitbake/bin:/tool/overo-oe/tmp/cross/armv7a/bin:/tool/script:/tool/android/out/host/linux-x86_64/bin:/tool/overo-oe/bitbake/bin:/tool/overo-oe/tmp/cross/armv7a/bin:/usr/lib64/qt-3.3/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/usr/lib64/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/elvis/bin
| + export 'TARGET_CFLAGS=-isystem/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/tool/overo-oe/tmp/cross/armv7a/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3'
| + TARGET_CFLAGS='-isystem/tool/overo-oe/tmp/staging/armv7a-angstrom-linux-gnueabi/tool/overo-oe/tmp/cross/armv7a/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3'
| + unset MACHINE
| + export BUILD_AR=ar
| + BUILD_AR=ar
| + export sharedstatedir=/tool/overo-oe/tmp/cross/armv7a/com
| + sharedstatedir=/tool/overo-oe/tmp/cross/armv7a/com
| + export OBJDUMP=objdump
| + OBJDUMP=objdump
| + unset DISTRO
| + export libdir=/tool/overo-oe/tmp/cross/armv7a/lib
| + libdir=/tool/overo-oe/tmp/cross/armv7a/lib
| + export SHELL=/bin/bash
| + SHELL=/bin/bash
| + export palmqtdir=/tool/overo-oe/tmp/cross/armv7a/lib/opie
| + palmqtdir=/tool/overo-oe/tmp/cross/armv7a/lib/opie
| + export BUILD_STRIP=strip
| + BUILD_STRIP=strip
| + export XDG_SESSION_COOKIE=bbb897b3c1e2f19aa2d413234b596448-1264277923.86579-862250634
| + XDG_SESSION_COOKIE=bbb897b3c1e2f19aa2d413234b596448-1264277923.86579-862250634
| + export OVEROTOP=/tool/overo-oe
| + OVEROTOP=/tool/overo-oe
| + cd /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/module-init-tools-cross-3.2.2-r5/module-init-tools-3.2.2
| + do_compile
| + base_do_compile
| + '[' -e Makefile -o -e makefile ']'
| + oe_runmake
| + '[' xmake = x ']'
| + oenote make -j 8
| + echo NOTE: 'make -j 8'
| NOTE: make -j 8
| + make -j 8
| ccache gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\" -I.   -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include  -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g -Wunused -Wall -MT lsmod.o -MD -MP -MF .deps/lsmod.Tpo -c -o lsmod.o lsmod.c
| ccache gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\" -I.   -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include  -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g -Wunused -Wall -MT insmod.o -MD -MP -MF .deps/insmod.Tpo -c -o insmod.o insmod.c
| ccache gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\" -I.   -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include  -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g -Wunused -Wall -MT modprobe.o -MD -MP -MF .deps/modprobe.Tpo -c -o modprobe.o modprobe.c
| ccache gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\" -I.   -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include  -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g -Wunused -Wall -MT zlibsupport.o -MD -MP -MF .deps/zlibsupport.Tpo -c -o zlibsupport.o zlibsupport.c
| ccache gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\" -I.   -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include  -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g -Wunused -Wall -MT rmmod.o -MD -MP -MF .deps/rmmod.Tpo -c -o rmmod.o rmmod.c
| ccache gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\" -I.   -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include  -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g -Wunused -Wall -MT depmod.o -MD -MP -MF .deps/depmod.Tpo -c -o depmod.o depmod.c
| mv -f .deps/lsmod.Tpo .deps/lsmod.Po
| mv -f .deps/insmod.Tpo .deps/insmod.Po
| mv -f .deps/rmmod.Tpo .deps/rmmod.Po
| modprobe.c: In function 'do_command':
| modprobe.c:786: warning: field precision should have type 'int', but argument 3 has type 'long int'
| mv -f .deps/modprobe.Tpo .deps/modprobe.Po
| ccache gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\" -I.   -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include  -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g -Wunused -Wall -MT moduleops.o -MD -MP -MF .deps/moduleops.Tpo -c -o moduleops.o moduleops.c
| mv -f .deps/zlibsupport.Tpo .deps/zlibsupport.Po
| ccache gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\" -I.   -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include  -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g -Wunused -Wall -MT tables.o -MD -MP -MF .deps/tables.Tpo -c -o tables.o tables.c
| mv -f .deps/tables.Tpo .deps/tables.Po
| ccache gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE=\"module-init-tools\" -DVERSION=\"3.2.2\" -I.   -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include  -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g -Wunused -Wall -MT modinfo.o -MD -MP -MF .deps/modinfo.Tpo -c -o modinfo.o modinfo.c
| ccache gcc  -isystem/tool/overo-oe/tmp/staging/x86_64-linux/usr/include -O2 -g -Wunused -Wall -static -L/tool/overo-oe/tmp/staging/x86_64-linux/usr/lib -Wl,-rpath-link,/tool/overo-oe/tmp/staging/x86_64-linux/usr/lib -Wl,-rpath,/tool/overo-oe/tmp/staging/x86_64-linux/usr/lib -Wl,-O1 -o insmod.static insmod.o
| /usr/bin/ld: cannot find -lc
| collect2: ld returned 1 exit status
| make: *** [insmod.static] Error 1
| make: *** Waiting for unfinished jobs....
| mv -f .deps/depmod.Tpo .deps/depmod.Po
| mv -f .deps/moduleops.Tpo .deps/moduleops.Po
| modinfo.c: In function 'main':
| modinfo.c:338: warning: 'infosize' may be used uninitialized in this function
| mv -f .deps/modinfo.Tpo .deps/modinfo.Po
| + die 'oe_runmake failed'
| + oefatal 'oe_runmake failed'
| + echo FATAL: 'oe_runmake failed'
| FATAL: oe_runmake failed
| + exit 1
NOTE: Task failed: /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/module-init-tools-cross-3.2.2-r5/temp/log.do_compile.27805
ERROR: TaskFailed event exception, aborting
ERROR: Build of /tool/overo-oe/org.openembedded.dev/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb do_compile failed
ERROR: Task 9 (/tool/overo-oe/org.openembedded.dev/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 187 tasks of which 180 didn't need to be rerun and 1 failed.
ERROR: '/tool/overo-oe/org.openembedded.dev/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb' failed

Best regards,

Elvis Dowson







