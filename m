Received: from us194mx009.tycoelectronics.net ([198.175.154.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay.snyder@tycoelectronics.com>) id 1OgiFt-0008Al-6p
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 20:00:15 +0200
Received: from [163.241.71.52] (163.241.71.52) by
	us194mx009.tycoelectronics.net (163.241.185.250) with Microsoft SMTP
	Server id 8.1.393.1; Wed, 4 Aug 2010 13:59:44 -0400
Message-ID: <4C59AA96.4050705@tycoelectronics.com>
Date: Wed, 4 Aug 2010 13:59:50 -0400
From: Jay Snyder <jay.snyder@tycoelectronics.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <mailman.123.1280931733.3621.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.123.1280931733.3621.openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 198.175.154.211
X-SA-Exim-Mail-From: jay.snyder@tycoelectronics.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: qt4-x11-free: build fails, "expansion of do_configure threw <type 'exceptions.AssertionError'>"
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
X-List-Received-Date: Wed, 04 Aug 2010 18:00:15 -0000
Content-Type: multipart/mixed; boundary="------------060106010000080708010505"

--------------060106010000080708010505
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Please see attached log file.

My qt4-x11-free build is failting with:
/home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/temp/run.do_configure.26049: 
line 1046: do_configure: command not found

Due to the run.do_configure file creation failing, and do_configure not 
being expanded correctly.

Thanks,
Jay

#!/bin/sh -e
export localstatedir="/var"

export OE_QMAKE_LDFLAGS="-L/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/lib -Wl,-rpath-link,/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/lib -Wl,-O1 -Wl,--hash-style=gnu"

export prefix="/usr"

unset STRIP

export STAGING_SIPDIR="/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/share/sip"

export BUILD_CC="/usr/bin/ccache gcc"

export OE_QMAKE_LIBDIR_QT="/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/lib"

export OE_QMAKE_RCC="/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/bin/rcc4"

export PSTAGING_ACTIVE="1"

export libexecdir="/usr/libexec"

export datadir="/usr/share"

export BUILD_CXX="/usr/bin/ccache g++"

export LD="i686-angstrom-linux-ld"

export EXTRA_OEMAKE="-e"

export bindir="/usr/bin"

export TARGET_CXXFLAGS="-isystem/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3 -fpermissive"

export includedir="/usr/include"

export BUILD_LDFLAGS="-L/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1"

export BUILD_LD="ld"

export SDK_CFLAGS="-isystem/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/include -isystem/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3"

export oldincludedir="/usr/include"

export LANG="en_US.UTF-8"

export BUILD_CCLD="gcc"

export XDG_DATA_DIRS="/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/share"

export XAUTHORITY="/home/oe/.Xauthority"

export QMAKESPEC="/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/share/qt4/mkspecs/linux-oe-g++"

export QMAKE_MKSPEC_PATH="/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/share/qmake"

export SDK_CPPFLAGS="-isystem/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/include -isystem/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/include"

export CC="/usr/bin/ccache i686-angstrom-linux-gcc -march=pentiumpro"

export CPPFLAGS="-isystem/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/include"

export OE_QMAKE_CXXFLAGS="-isystem/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3 -fpermissive -fvisibility-inlines-hidden"

export RANLIB="i686-angstrom-linux-ranlib"

export CXX="/usr/bin/ccache i686-angstrom-linux-g++ -march=pentiumpro"

export BUILD_RANLIB="ranlib"

export OE_QMAKE_QDBUSCPP2XML="/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/bin/qdbuscpp2xml4"

export TRASH_OFF="YES"

export mandir="/usr/share/man"

export OE_QMAKE_CFLAGS="-isystem/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3"

export OBJCOPY="i686-angstrom-linux-objcopy"

export servicedir="/srv"

export OE_QMAKE_CC="/usr/bin/ccache i686-angstrom-linux-gcc -march=pentiumpro"

export SDK_LDFLAGS="-L/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/lib -Wl,-O1"

export OE_QMAKE_LRELEASE="/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/bin/lrelease4"

export PKG_CONFIG_DIR="/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/lib/pkgconfig"

export BB_ENV_EXTRAWHITE="MACHINE DISTRO ANGSTROMLIBC"

export sysconfdir="/etc"

export CCLD="/usr/bin/ccache i686-angstrom-linux-gcc -march=pentiumpro"

export base_bindir="/bin"

export OE_QMAKE_QMAKE="/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/bin/qmake2"

export OE_QMAKE_LIBS_X11="-lXext -lX11 -lm"

export sbindir="/usr/sbin"

export CFLAGS="-isystem/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3"

export OE_QMAKE_UIC="/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/bin/uic4"

export PKG_CONFIG_DISABLE_UNINSTALLED="yes"

export OE_QMAKE_AR="i686-angstrom-linux-ar"

export BUILD_F77="/usr/bin/ccache g77"

export TARGET_LDFLAGS="-L/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/lib -Wl,-rpath-link,/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/lib -Wl,-O1 -Wl,--hash-style=gnu"

export PWD="/home/oe/build-2010-07-29"

export _="/home/oe/bitbake/bin/bitbake"

export PATCH_GET="0"

export CXXFLAGS="-isystem/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3 -fpermissive -fvisibility-inlines-hidden"

export DISPLAY=":0.0"

export NM="i686-angstrom-linux-nm"

export OE_QMAKE_MOC="/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/bin/moc4"

export F77="/usr/bin/ccache i686-angstrom-linux-g77 -march=pentiumpro"

export OE_QMAKE_INCDIR_QT="/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/include/qt4"

export USER="oe"

export QTDIR="/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/qt2"

export LDFLAGS="-L/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/lib -Wl,-rpath-link,/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/lib -Wl,-O1 -Wl,--hash-style=gnu"

export MAKE="make"

export OPIEDIR="/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux"

unset TARGET_ARCH

export OE_QMAKE_LIBS_QT="qt"

export SHELLCMDS="bash --rcfile $TERMRCFILE"

export QPEDIR="/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux"

export BBPATH="/home/oe/local:/home/oe/build-2010-07-29:/home/oe/2010-06-23/openembedded"

export BUILD_CPP="cpp"

export OE_QMAKE_STRIP="echo"

export QT_CONF_PATH="/home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/qt.conf"

export SDK_CXXFLAGS="-isystem/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/include -isystem/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3 -fpermissive"

export OE_QMAKE_QDBUSXML2CPP="/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/bin/qdbusxml2cpp4"

export BUILD_CFLAGS="-isystem/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/include -O2 -g"

export docdir="/usr/share/doc"

export infodir="/usr/share/info"

export TERM="xterm"

export OE_QMAKE_RPATH="-Wl,-rpath-link,"

export base_sbindir="/sbin"

export PKG_CONFIG_SYSROOT_DIR="/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux"

export PKG_CONFIG_PATH="/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/lib/pkgconfig:/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/share/pkgconfig"

export AS="i686-angstrom-linux-as"

export AR="i686-angstrom-linux-ar"

export BUILD_CPPFLAGS="-isystem/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/include"

export CPP="i686-angstrom-linux-gcc -E"

export BUILD_CXXFLAGS="-isystem/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/include -O2 -g -fpermissive"

export HOME="/home/oe/home"

export OE_QMAKE_UIC3="/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/bin/uic34"

export TARGET_CPPFLAGS="-isystem/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/include"

export OE_QMAKE_LINK="/usr/bin/ccache i686-angstrom-linux-g++ -march=pentiumpro"

export OE_QMAKE_CXX="/usr/bin/ccache i686-angstrom-linux-g++ -march=pentiumpro"

export base_libdir="/lib"

export STAGING_IDLDIR="/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/share/idl"

export LOGNAME="oe"

export PATH="/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/bin/i686-angstrom-linux:/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/bin/i686-angstrom-linux:/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/sbin:/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/bin:/home/oe/build-2010-07-29/tmp/cross/i686//bin:/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/sbin:/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/bin:/home/oe/bitbake/bin:/usr/kerberos/bin:/usr/lib/ccache:/usr/bin:/bin:/usr/local/bin:/home/oe/bin"

export TARGET_CFLAGS="-isystem/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3"

unset MACHINE

export OE_QMAKE_LUPDATE="/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/bin/lupdate4"

export BUILD_AR="ar"

export sharedstatedir="/com"

export OBJDUMP="i686-angstrom-linux-objdump"

unset DISTRO

export exec_prefix="/usr"

export libdir="/usr/lib"

export SHELL="/bin/bash"

export palmqtdir="/usr/lib/opie"

export palmtopdir="/usr/lib/opie"

export BUILD_STRIP="strip"

do_devshell() {
	devshell_do_devshell

}

do_fetchall() {
	:

}

do_recipe_sanity_all() {
    :

}

base_do_configure() {
	:

}

package_generate_ipkg_conf() {
	mkdir -p /home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/etc/
	echo "src oe file:/home/oe/build-2010-07-29/tmp/deploy/glibc/ipk" > /home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/etc/opkg.conf
	echo "src oe file:/home/oe/build-2010-07-29/tmp/deploy/glibc/ipk" > /home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/etc/opkg-sdk.conf
	echo "src oe file:/home/oe/build-2010-07-29/tmp/deploy/glibc/ipk" > /home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/etc/opkg-canadian-sdk.conf
	ipkgarchs="all any noarch i686  x86 i386 i486 i586 i686-generic"
	priority=1
	for arch in $ipkgarchs; do
		echo "arch $arch $priority" >> /home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/etc/opkg.conf
		echo "arch x86_64-$arch-sdk $priority" >> /home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/etc/opkg-sdk.conf
		echo "arch x86_64-linux-sdk-$arch $priority" >> /home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/etc/opkg-canadian-sdk.conf
		priority=$(expr $priority + 5)
		if [ -e /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/$arch/Packages ] ; then
		        echo "src oe-$arch file:/home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/$arch" >> /home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/etc/opkg.conf
		fi
		if [ -e /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/x86_64-$arch-sdk/Packages ] ; then
		        echo "src oe-x86_64-$arch-sdk file:/home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/x86_64-$arch-sdk" >> /home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/etc/opkg-sdk.conf
		fi
		if [ -e /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/x86_64-linux-sdk-$arch/Packages ] ; then
		        echo "src oe-x86_64-linux-sdk-$arch file:/home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/x86_64-linux-sdk-$arch" >> /home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/etc/opkg-canadian-sdk.conf
		fi
	done

}

sysroot_stage_libdir() {
	src="$1"
	dest="$2"

	olddir=`pwd`
	cd $src
	las=$(find . -name \*.la -type f)
	cd $olddir
	echo "Found la files: $las"
	for i in $las
	do
		sed -e 's/^installed=yes$/installed=no/' \
		    -e '/^dependency_libs=/s,/home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2[[:alnum:]/\._+-]*/\([[:alnum:]\._+-]*\),/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/lib/\1,g' \
		    -e "/^dependency_libs=/s,\([[:space:]']\)/usr/lib,\1/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/lib,g" \
		     \
		    -i $src/$i
	done
	sysroot_stage_dir $src $dest

}

do_package_update_index_ipk() {
	set -x

	ipkgarchs="all any noarch i686  x86 i386 i486 i586 i686-generic"

	if [ ! -z "${DEPLOY_KEEP_PACKAGES}" ]; then
		return
	fi

	mkdir -p /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk
	touch /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/Packages
	ipkg-make-index -r /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/Packages -p /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/Packages -l /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/Packages.filelist -m /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk

	for arch in $ipkgarchs; do
		if [ -e /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/$arch/ ] ; then
			touch /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/$arch/Packages
			ipkg-make-index -r /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/$arch/Packages -p /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/$arch/Packages -l /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/$arch/Packages.filelist -m /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/$arch/
		fi
		if [ -e /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/x86_64-$arch-sdk/ ] ; then
			touch /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/x86_64-$arch-sdk/Packages
			ipkg-make-index -r /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/x86_64-$arch-sdk/Packages -p /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/x86_64-$arch-sdk/Packages -l /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/x86_64-$arch-sdk/Packages.filelist -m /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/x86_64-$arch-sdk/
		fi
		if [ -e /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/x86_64-linux-sdk-$arch/ ] ; then
			touch /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/x86_64-linux-sdk-$arch/Packages
			ipkg-make-index -r /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/x86_64-linux-sdk-$arch/Packages -p /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/x86_64-linux-sdk-$arch/Packages -l /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/x86_64-linux-sdk-$arch/Packages.filelist -m /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk/x86_64-linux-sdk-$arch/
		fi
	done

}

die() {
	oefatal "$*"

}

base_do_install() {
	:

}

do_package_stage_all() {
	:

}

base_do_package() {
	:

}

oe_soinstall() {
	# Purpose: Install shared library file and
	#          create the necessary links
	# Example:
	#
	# oe_
	#
	#oenote installing shared library $1 to $2
	#
	libname=`basename $1`
	install -m 755 $1 $2/$libname
	sonamelink=`i686-angstrom-linux-readelf -d $1 |grep 'Library soname:' |sed -e 's/.*\[\(.*\)\].*/\1/'`
	solink=`echo $libname | sed -e 's/\.so\..*/.so/'`
	ln -sf $libname $2/$sonamelink
	ln -sf $libname $2/$solink

}

package_stagefile_shell() {
	if [ "$PSTAGING_ACTIVE" = "1" ]; then
		srcfile=$1
		destfile=`echo $srcfile | sed s#/home/oe/build-2010-07-29/tmp#/home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/staging-pkg#`
		destdir=`dirname $destfile`
		mkdir -p $destdir
		cp -dp $srcfile $destfile
	fi

}

devshell_do_devshell() {
	export TERMWINDOWTITLE="Bitbake Developer Shell"
	xterm -T "$TERMWINDOWTITLE"
	if [ $? -ne 0 ]; then
	    echo "Fatal: 'xterm -T "$TERMWINDOWTITLE"' not found. Check TERMCMD variable."
	    exit 1
	fi

}

oe_libinstall() {
	# Purpose: Install a library, in all its forms
	# Example
	#
	# oe_libinstall libltdl /home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/lib/
	# oe_libinstall -C src/libblah libblah /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/image//usr/lib/
	dir=""
	libtool=""
	silent=""
	require_static=""
	require_shared=""
	staging_install=""
	while [ "$#" -gt 0 ]; do
		case "$1" in
		-C)
			shift
			dir="$1"
			;;
		-s)
			silent=1
			;;
		-a)
			require_static=1
			;;
		-so)
			require_shared=1
			;;
		-*)
			oefatal "oe_libinstall: unknown option: $1"
			;;
		*)
			break;
			;;
		esac
		shift
	done

	libname="$1"
	shift
	destpath="$1"
	if [ -z "$destpath" ]; then
		oefatal "oe_libinstall: no destination path specified"
	fi
	if echo "$destpath/" | egrep '^/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/lib/' >/dev/null
	then
		staging_install=1
	fi

	__runcmd () {
		if [ -z "$silent" ]; then
			echo >&2 "oe_libinstall: $*"
		fi
		$*
	}

	if [ -z "$dir" ]; then
		dir=`pwd`
	fi

	dotlai=$libname.lai

	# Sanity check that the libname.lai is unique
	number_of_files=`(cd $dir; find . -name "$dotlai") | wc -l`
	if [ $number_of_files -gt 1 ]; then
		oefatal "oe_libinstall: $dotlai is not unique in $dir"
	fi


	dir=$dir`(cd $dir;find . -name "$dotlai") | sed "s/^\.//;s/\/$dotlai\$//;q"`
	olddir=`pwd`
	__runcmd cd $dir

	lafile=$libname.la

	# If such file doesn't exist, try to cut version suffix
	if [ ! -f "$lafile" ]; then
		libname1=`echo "$libname" | sed 's/-[0-9.]*$//'`
		lafile1=$libname.la
		if [ -f "$lafile1" ]; then
			libname=$libname1
			lafile=$lafile1
		fi
	fi

	if [ -f "$lafile" ]; then
		# libtool archive
		eval `cat $lafile|grep "^library_names="`
		libtool=1
	else
		library_names="$libname.so* $libname.dll.a"
	fi

	__runcmd install -d $destpath/
	dota=$libname.a
	if [ -f "$dota" -o -n "$require_static" ]; then
		__runcmd install -m 0644 $dota $destpath/
	fi
	if [ -f "$dotlai" -a -n "$libtool" ]; then
		if test -n "$staging_install"
		then
			# stop libtool using the final directory name for libraries
			# in staging:
			__runcmd rm -f $destpath/$libname.la
			__runcmd sed -e 's/^installed=yes$/installed=no/' \
				     -e '/^dependency_libs=/s,/home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2[[:alnum:]/\._+-]*/\([[:alnum:]\._+-]*\),/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/lib/\1,g' \
				     -e "/^dependency_libs=/s,\([[:space:]']\)/usr/lib,\1/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/lib,g" \
				     $dotlai >$destpath/$libname.la
		else
			__runcmd install -m 0644 $dotlai $destpath/$libname.la
		fi
	fi

	for name in $library_names; do
		files=`eval echo $name`
		for f in $files; do
			if [ ! -e "$f" ]; then
				if [ -n "$libtool" ]; then
					oefatal "oe_libinstall: $dir/$f not found."
				fi
			elif [ -L "$f" ]; then
				__runcmd cp -P "$f" $destpath/
			elif [ ! -L "$f" ]; then
				libfile="$f"
				__runcmd install -m 0755 $libfile $destpath/
			fi
		done
	done

	if [ -z "$libfile" ]; then
		if  [ -n "$require_shared" ]; then
			oefatal "oe_libinstall: unable to locate shared library"
		fi
	elif [ -z "$libtool" ]; then
		# special case hack for non-libtool .so.#.#.# links
		baselibfile=`basename "$libfile"`
		if (echo $baselibfile | grep -qE '^lib.*\.so\.[0-9.]*$'); then
			sonamelink=`i686-angstrom-linux-readelf -d $libfile |grep 'Library soname:' |sed -e 's/.*\[\(.*\)\].*/\1/'`
			solink=`echo $baselibfile | sed -e 's/\.so\..*/.so/'`
			if [ -n "$sonamelink" -a x"$baselibfile" != x"$sonamelink" ]; then
				__runcmd ln -sf $baselibfile $destpath/$sonamelink
			fi
			__runcmd ln -sf $baselibfile $destpath/$solink
		fi
	fi

	__runcmd cd "$olddir"

}

do_install() {
    oe_runmake install INSTALL_ROOT=/home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/image

    # These are host binaries, we should only use them in staging
    rm -rf /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/image//usr/bin/qmake

    # fix pkgconfig, libtool and prl files
    sed -i -e s#-L/home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/qt-everywhere-opensource-src-4.6.2/lib##g \
           -e s#-L/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/lib##g \
           -e 's#STAGING_LIBDIR}#libdir}'#g \
           -e s#-L/usr/lib##g \
           -e s#'$(OE_QMAKE_LIBS_X11)'#"-lXext -lX11 -lm"#g \
           -e s#" -Wl,-rpath-link,/home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/qt-everywhere-opensource-src-4.6.2/lib"##g \
           -e s#" -Wl,-rpath-link,/usr/lib"##g \
           -e 's#I/usr/include#Iincludedir}#g' \
           -e 's#Iin#I${in#g' \
           /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/image/usr/lib/*.la /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/image/usr/lib/*.prl /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/image/usr/lib/pkgconfig/*.pc

    sed -i -e s#" -Wl,-rpath-link,/home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/qt-everywhere-opensource-src-4.6.2/lib"##g \
            /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/image/usr/share/qt4/mkspecs/common/linux.conf

    # fix pkgconfig files
    sed -i -e s#"moc_location=.*$"#"moc_location=/usr/bin/moc4"# \
           -e s#"uic_location=.*$"#"uic_location=/usr/bin/uic4"# \
           /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/image/usr/lib/pkgconfig/*.pc
    for name in Qt3Support QtAssistantClient QtCLucene QtCore QtDBus QtDesigner QtDesignerComponents QtGui QtHelp QtNetwork QtOpenGL QtScript QtScriptTools QtSql QtSvg QtTest QtUiTools QtWebKit QtXml QtXmlPatterns phonon QtMultimedia QtOpenVG QtMediaServices; do
           sed -i -e /Requires/s#"${name}"#"${name}"#g /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/image/usr/lib/pkgconfig/*.pc
    done

	# QT abuses $includedir to point to its headers, which breaks pkgconfig sysroot, so manually fix it up here:
	for pc in /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/image/usr/lib/pkgconfig/*.pc ; do
		sed -i -e "s:prefix}include/qt4/$(basename $pc .pc):prefix}/include:" \
		       -e "s,Cflags: ,Cflags: -IP{includedir}/qt4/$(basename $pc .pc) ," \
		       -e 's:IP{:I${:g' $pc
	done

    install -d /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/image//usr/lib/fonts
    touch /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/image//usr/lib/fonts/fontdir
	install -d /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/image/usr/bin
	for i in rcc uic moc ; do
		install -m 0755 /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/qt-everywhere-opensource-src-4.6.2/bin/$i /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/image/usr/bin/
	done

	#Append an E to the qtdemo file
	if [ -n "" ] ; then
		mv /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/image/usr/bin/qtdemo /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/image/usr/bin/qtdemo
	fi

}

sysroot_stage_dirs() {
	from="$1"
	to="$2"

	sysroot_stage_dir $from/usr/include $to/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/include
	if [ "x86_64-linux" = "i686-angstrom-linux" ]; then
		sysroot_stage_dir $from/usr/bin $to/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/bin
		sysroot_stage_dir $from/usr/sbin $to/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/sbin
		sysroot_stage_dir $from/bin $to/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/bin
		sysroot_stage_dir $from/sbin $to/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/sbin
		sysroot_stage_dir $from/usr/libexec $to/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/libexec
		sysroot_stage_dir $from/etc $to/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/etc
		if [ "/usr/lib" != "/usr/lib" ]; then
			# python puts its files in here, make sure they are staged as well
			autotools_stage_dir $from//usr/lib $to/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/lib
		fi
	fi
	if [ -d $from/usr/lib ]
	then
		sysroot_stage_libdir $from//usr/lib $to/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/lib
	fi
	if [ -d $from/lib ]
	then
		sysroot_stage_libdir $from/lib $to/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/lib
	fi
	sysroot_stage_dir $from/usr/share $to/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/share
	sysroot_stage_dir $from/etc $to/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/etc

}

staging_package_installer() {
	#stage-manager-ipkg -f /home/oe/build-2010-07-29/tmp/pstage/opkg.conf -force-depends -o /home/oe/build-2010-07-29/tmp install /home/oe/build-2010-07-29/tmp/pstage/angstromglibc/staging-qt4-x11-free-i686-angstrom-linux_4.6.2-r18.2_i686-linux.ipk

	STATUSFILE=/home/oe/build-2010-07-29/tmp/usr/lib/opkg/status
	echo "Package: staging-qt4-x11-free-i686-angstrom-linux"        >> $STATUSFILE
	echo "Version: 4.6.2-r18.2"   >> $STATUSFILE
	echo "Status: install user installed"  >> $STATUSFILE
	echo "Architecture: i686-linux" >> $STATUSFILE
	echo "" >> $STATUSFILE

	CTRLFILE=/home/oe/build-2010-07-29/tmp/usr/lib/opkg/info/staging-qt4-x11-free-i686-angstrom-linux.control
	echo "Package: staging-qt4-x11-free-i686-angstrom-linux"        > $CTRLFILE
	echo "Version: 4.6.2-r18.2"   >> $CTRLFILE
	echo "Architecture: i686-linux" >> $CTRLFILE

	cd /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/staging-pkg
	find -type f | grep -v ./CONTROL | sed -e 's/^\.//' > /home/oe/build-2010-07-29/tmp/usr/lib/opkg/info/staging-qt4-x11-free-i686-angstrom-linux.list

}

oedebug() {
	test $# -ge 2 || {
		echo "Usage: oedebug level \"message\""
		exit 1
	}

	test ${OEDEBUG:-0} -ge $1 && {
		shift
		echo "DEBUG:" $*
	}

}

sysroot_stage_all() {
	sysroot_stage_dirs /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/image /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/sysroot-destdir/

}

oe_runmake() {
	oenote make -e "$@"
	make -e "$@" || die "oe_runmake failed"

}

populate_sysroot_preamble() {
	if [ "$PSTAGING_ACTIVE" = "1" ]; then
		stage-manager -p /home/oe/build-2010-07-29/tmp/sysroots -c /home/oe/build-2010-07-29/tmp/pstage/stamp-cache-staging -u || true
		stage-manager -p /home/oe/build-2010-07-29/tmp/cross/i686 -c /home/oe/build-2010-07-29/tmp/pstage/stamp-cache-cross -u || true
	fi

}

oe_machinstall() {
	# Purpose: Install machine dependent files, if available
	#          If not available, check if there is a default
	#          If no default, just touch the destination
	# Example:
	#                $1  $2   $3         $4
	# oe_machinstall -m 0644 fstab /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/image/etc/fstab
	#
	# TODO: Check argument number?
	#
	filename=`basename $3`
	dirname=`dirname $3`

	for o in `echo task-configure:local:i686-generic:angstrom:linux:i686:build-linux:fail-fast:pn-qt4-x11-free:i686:Unknown:libc-glibc | tr ':' ' '`; do
		if [ -e $dirname/$o/$filename ]; then
			oenote $dirname/$o/$filename present, installing to $4
			install $1 $2 $dirname/$o/$filename $4
			return
		fi
	done
#	oenote overrides specific file NOT present, trying default=$3...
	if [ -e $3 ]; then
		oenote $3 present, installing to $4
		install $1 $2 $3 $4
	else
		oenote $3 NOT present, touching empty $4
		touch $4
	fi

}

# expansion of do_configure threw <type 'exceptions.AssertionError'>
qmake_base_do_configure() {
	case /home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/share/qt4/mkspecs/linux-oe-g++ in
	*linux-oe-g++|*linux-uclibc-oe-g++|*linux-gnueabi-oe-g++|*linux-uclibceabi-oe-g++)
		;;
	*-oe-g++)
		die Unsupported target linux for oe-g++ qmake spec
		;;
	*)
		oenote Searching for qmake spec file
		paths="/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/share/qmake/qws/linux-i686-g++"
		paths="/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/share/qmake/linux-g++ $paths"

		if (echo "i686"|grep -q 'i.86'); then
			paths="/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/share/qmake/qws/linux-x86-g++ $paths"
		fi
		for i in $paths; do
			if test -e $i; then
				export QMAKESPEC=$i
				break
			fi
		done
		;;
	esac

	oenote "using qmake spec in /home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/share/qt4/mkspecs/linux-oe-g++, using profiles '${QMAKE_PROFILES}'"

	if [ -z "${QMAKE_PROFILES}" ]; then
		PROFILES="`ls *.pro`"
	else
		PROFILES="${QMAKE_PROFILES}"
	fi

	if [ -z "$PROFILES" ]; then
		die "QMAKE_PROFILES not set and no profiles found in $PWD"
        fi

	if [ ! -z "${EXTRA_QMAKEVARS_POST}" ]; then
		AFTER="-after"
		QMAKE_VARSUBST_POST="${EXTRA_QMAKEVARS_POST}"
		oenote "qmake postvar substitution: ${EXTRA_QMAKEVARS_POST}"
	fi

	if [ ! -z "${EXTRA_QMAKEVARS_PRE}" ]; then
		QMAKE_VARSUBST_PRE="${EXTRA_QMAKEVARS_PRE}"
		oenote "qmake prevar substitution: ${EXTRA_QMAKEVARS_PRE}"
	fi

#oenote "Calling '/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/bin/qmake2 -makefile -spec /home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/share/qt4/mkspecs/linux-oe-g++ -o Makefile $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST'"
	unset QMAKESPEC || true
	/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/bin/qmake2 -makefile -spec /home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/share/qt4/mkspecs/linux-oe-g++ -o Makefile $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST || die "Error calling /home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/bin/qmake2 on $PROFILES"

}

SRC_DISTRIBUTECOMMAND() {
    test -e "${SRC}.md5" && ln -sf "${SRC}.md5" .
    ln -sf "${SRC}" .

}

do_package_write() {
	:

}

sysroot_stage_dir() {
	src="$1"
	dest="$2"
	# This will remove empty directories so we can ignore them
	rmdir "$src" 2> /dev/null || true
	if [ -d "$src" ]; then
		mkdir -p "$dest"
		cp -fpPR "$src"/* "$dest"
	fi

}

do_testlab() {
if [ -e  /home/oe/build-2010-07-29/tmp/rootfs/qt4-x11-free/etc/opkg ] && [ "${ONLINE_PACKAGE_MANAGEMENT}" = "full" ] ; then

	IPKG_TMP_DIR="/home/oe/build-2010-07-29/tmp/rootfs/qt4-x11-free-tmp"
	IPKG_ARGS="-f /home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/etc/opkg.conf -o /home/oe/build-2010-07-29/tmp/rootfs/qt4-x11-free -t ${IPKG_TMP_DIR}"

	TESTLAB_DIR="/home/oe/build-2010-07-29/tmp/deploy/glibc/images/i686-generic/Angstrom-qt4-x11-free-glibc-ipk-2010.7-test-20100804-i686-generic-testlab"
        mkdir -p ${TESTLAB_DIR}/
        mkdir -p ${IPKG_TMP_DIR}/
	ls -laR /home/oe/build-2010-07-29/tmp/rootfs/qt4-x11-free > ${TESTLAB_DIR}/files-in-image.txt

	echo > ${TESTLAB_DIR}/installed-packages.txt
	echo -e "digraph depends {\n    node [shape=plaintext]" > ${TESTLAB_DIR}/depends.dot

	for pkg in $(opkg-cl ${IPKG_ARGS} list_installed | awk '{print $1}') ; do
		opkg-cl ${IPKG_ARGS} info $pkg | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" | awk '/^Package/ {printf $2"_"} /^Version/ {printf $2"_"} /^Archi/ {print $2".ipk"}'  >> ${TESTLAB_DIR}/installed-packages.txt

    		for depends in $(opkg-cl ${IPKG_ARGS} info $pkg | grep ^Depends) ; do
        		echo "$pkg OPP $depends;" | grep -v "(" | grep -v ")" | grep -v "$pkg OPP Depends" | sed -e 's:,::g' -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' |sed 's:OPP:->:g' >> ${TESTLAB_DIR}/depends.dot
    		done

		for recommends in $(opkg-cl ${IPKG_ARGS} info $pkg | grep ^Recom) ; do
        		echo "$pkg OPP $recommends [style=dotted];" | grep -v "(" | grep -v ")" | grep -v "$pkg OPP Recom" | sed -e 's:,::g' -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' |sed 's:OPP:->:g' >> ${TESTLAB_DIR}/depends.dot
    		done
	done

	echo "}" >>  ${TESTLAB_DIR}/depends.dot
	rm -rf ${IPKG_TMP_DIR}

	grep -v kernel_2 ${TESTLAB_DIR}/depends.dot | grep -v kernel_image > ${TESTLAB_DIR}/depends-nokernel.dot
	grep -v libc6 ${TESTLAB_DIR}/depends-nokernel.dot | grep -v libgcc > ${TESTLAB_DIR}/depends-nokernel-nolibc.dot
	grep -v update_ ${TESTLAB_DIR}/depends-nokernel-nolibc.dot > ${TESTLAB_DIR}/depends-nokernel-nolibc-noupdate.dot
        grep -v kernel_module ${TESTLAB_DIR}/depends-nokernel-nolibc-noupdate.dot > ${TESTLAB_DIR}/depends-nokernel-nolibc-noupdate-nomodules.dot

	#dot has some library troubles when run under fakeroot, uncomment at your own risk
	#dot -Tpng -o ${TESTLAB_DIR}/image-dependencies.png  ${TESTLAB_DIR}/depends.dot
	#dot -Tpng -o ${TESTLAB_DIR}/image-dependencies-nokernel-nolibc.png ${TESTLAB_DIR}/depends-nokernel-nolibc.dot
	#dot -Tpng -o ${TESTLAB_DIR}/image-dependencies-nokernel-nolibc-noupdate.png ${TESTLAB_DIR}/depends-nokernel-nolibc-noupdate.dot
	#dot -Tpng -o ${TESTLAB_DIR}/image-dependencies-nokernel-nolibc-noupdate-nomodules.png ${TESTLAB_DIR}/depends-nokernel-nolibc-noupdate-nomodules.dot

	for file in $(cat ${TESTLAB_DIR}/installed-packages.txt) ; do
     		du -k $(find /home/oe/build-2010-07-29/tmp/deploy/glibc/ipk -name "$file") | head -n1
	done | grep "\.ipk" | sed -e s:/home/oe/build-2010-07-29/tmp/deploy/glibc/ipk::g | sort -n -r | awk '{print $1 "\tKiB " $2}' > ${TESTLAB_DIR}/installed-package-sizes.txt
fi

}

ldconfig_postinst_fragment() {
if [ x"$D" = "x" ]; then
	if [ -e /etc/ld.so.conf ] ; then
		[ -x /sbin/ldconfig ] && /sbin/ldconfig
	fi
fi

}

staging_helper() {
	# Assemble appropriate opkg.conf
	conffile=/home/oe/build-2010-07-29/tmp/pstage/opkg.conf
	mkdir -p /home/oe/build-2010-07-29/tmp/pstage/pstaging_lists
	arch="i686-linux"
	if [ ! -e $conffile ]; then
		echo "arch $arch 1" > $conffile
		echo "dest root /" >> $conffile
	elif [ `grep -c " $arch " $conffile` -eq 0 ]; then
		priority=$(expr `grep -cE "^arch" $conffile` + 1)
		sed -i -e "/dest/iarch $arch $priority" $conffile
	fi
	if [ ! -e /home/oe/build-2010-07-29/tmp/usr/lib/opkg/info/ ]; then
		mkdir -p /home/oe/build-2010-07-29/tmp/usr/lib/opkg/info/
	fi
 	if [ ! -e /home/oe/build-2010-07-29/tmp/usr/lib/ipkg/ ]; then
		ln -sf opkg/ /home/oe/build-2010-07-29/tmp/usr/lib/ipkg || true
	fi

}

staging_packager() {

	mkdir -p /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/staging-pkg/CONTROL
	mkdir -p /home/oe/build-2010-07-29/tmp/pstage/angstromglibc

	echo "Package: staging-qt4-x11-free-i686-angstrom-linux"         >  /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/staging-pkg/CONTROL/control
	echo "Version: 4.6.2-r18.2"    >> /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/staging-pkg/CONTROL/control
	echo "Description: Qt is a versatile cross-platform application framework -- this is the X11 version."      >> /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/staging-pkg/CONTROL/control
	echo "Section: x11/libs"              >> /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/staging-pkg/CONTROL/control
	echo "Priority: Optional"               >> /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/staging-pkg/CONTROL/control
	echo "Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>"        >> /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/staging-pkg/CONTROL/control
	echo "Architecture: i686-linux"  >> /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/staging-pkg/CONTROL/control

	# Protect against empty SRC_URI
	srcuri="ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-4.6.2.tar.gz            file://0001-cross-compile.patch            file://0002-fix-resinit-declaration.patch            file://0004-no-qmake.patch            file://0006-freetype-host-includes.patch            file://0008-qt-lib-infix.patch            file://0009-support-2bpp.patch            file://0010-no-simpledecoration-example.patch            file://fix-config-tests.patch            file://qt-config.patch            file://g++.conf            file://linux.conf             file://qte.sh              file://hack-out-pg_config.patch"
	if [ "$srcuri" == "" ]; then
		srcuri="OpenEmbedded"
	fi
	echo "Source: $srcuri"               >> /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/staging-pkg/CONTROL/control

	# Deal with libtool not supporting sysroots
	# Need to remove hardcoded paths and fix these when we install the
	# staging packages.
	# Could someone please add sysroot support to libtool!
        for i in `find /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/staging-pkg \( -name "*.la" -o -name "*-config" \) -type f` ; do \
                sed -i -e s:/home/oe/build-2010-07-29/tmp/sysroots:FIXMESTAGINGDIR:g $i
                echo $i | sed -e 's:/home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/staging-pkg/::' >> /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/staging-pkg/sysroots/fixmepath
        done

	stage-manager-ipkg-build -o 0 -g 0 /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/staging-pkg /home/oe/build-2010-07-29/tmp/pstage/angstromglibc

}

do_compile() {
    # Fixup missing wsegl header in some SGX SDKs
    if ! [ -e /home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/include/wsegl.h ] ; then
        cp src/3rdparty/powervr/wsegl.h src/plugins/gfxdrivers/powervr/QWSWSEGL/
    fi

    unset CFLAGS CXXFLAGS
    oe_runmake QMAKE="/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/bin/qmake2 -after              INCPATH+=/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/include/freetype2 LIBS+=-L/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/lib"              QMAKESPEC="/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/share/qt4/mkspecs/linux-oe-g++" LINK="/usr/bin/ccache i686-angstrom-linux-g++ -march=pentiumpro -Wl,-rpath-link,/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/lib"              AR="i686-angstrom-linux-ar cqs"              MOC="/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/bin/moc4" UIC="/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/bin/uic4" MAKE="make -e"

}

oewarn() {
	echo "WARNING:" "$*"

}

oefatal() {
	echo "FATAL:" "$*"
	exit 1

}

oe_qmake_mkspecs() {
    mkdir -p mkspecs/linux-oe-g++
    for f in /home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/share/qmake/linux-oe-g++/*; do
        if [ -L $f ]; then
            lnk=`readlink $f`
            if [ -f mkspecs/linux-oe-g++/$lnk ]; then
                ln -s $lnk mkspecs/linux-oe-g++/`basename $f`
            else
                cp $f mkspecs/linux-oe-g++/
            fi
        else
            cp $f mkspecs/linux-oe-g++/
        fi
    done

}

base_do_compile() {
	if [ -e Makefile -o -e makefile ]; then
		oe_runmake || die "make failed"
	else
		oenote "nothing to compile"
	fi

}

do_buildall() {
	:

}

oenote() {
	echo "NOTE:" "$*"

}

MIRRORS() {
ftp://ftp.debian.org/debian/pool/main	http://snapshot.debian.net/archive/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.de.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.au.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.cl.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.hr.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.fi.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.hk.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.hu.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.ie.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.it.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.jp.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.no.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.pl.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.ro.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.si.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.es.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.se.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.tr.debian.org/debian/pool
ftp://ftp.gnu.org/gnu	ftp://mirrors.kernel.org/gnu
ftp://ftp.gnu.org/gnu	ftp://ftp.cs.ubc.ca/mirror2/gnu
ftp://ftp.gnu.org/gnu	ftp://sunsite.ust.hk/pub/gnu
ftp://ftp.gnu.org/gnu	ftp://ftp.ayamura.org/pub/gnu
http://kernel.org	http://www.kernel.org/pub
http://kernel.org	ftp://ftp.us.kernel.org/pub
http://kernel.org	ftp://ftp.uk.kernel.org/pub
http://kernel.org	ftp://ftp.hk.kernel.org/pub
http://kernel.org	ftp://ftp.au.kernel.org/pub
http://kernel.org	ftp://ftp.jp.kernel.org/pub
ftp://ftp.gnupg.org/gcrypt/     ftp://ftp.franken.de/pub/crypt/mirror/ftp.gnupg.org/gcrypt/
ftp://ftp.gnupg.org/gcrypt/     ftp://ftp.surfnet.nl/pub/security/gnupg/
ftp://ftp.gnupg.org/gcrypt/     http://gulus.USherbrooke.ca/pub/appl/GnuPG/
ftp://dante.ctan.org/tex-archive ftp://ftp.fu-berlin.de/tex/CTAN
ftp://dante.ctan.org/tex-archive http://sunsite.sut.ac.jp/pub/archives/ctan/
ftp://dante.ctan.org/tex-archive http://ctan.unsw.edu.au/
ftp://ftp.gnutls.org/pub/gnutls ftp://ftp.gnutls.org/pub/gnutls/
ftp://ftp.gnutls.org/pub/gnutls ftp://ftp.gnupg.org/gcrypt/gnutls/
ftp://ftp.gnutls.org/pub/gnutls http://www.mirrors.wiretapped.net/security/network-security/gnutls/
ftp://ftp.gnutls.org/pub/gnutls ftp://ftp.mirrors.wiretapped.net/pub/security/network-security/gnutls/
ftp://ftp.gnutls.org/pub/gnutls http://josefsson.org/gnutls/releases/
http://ftp.info-zip.org/pub/infozip/src/ http://mirror.switch.ch/ftp/mirror/infozip/src/
http://ftp.info-zip.org/pub/infozip/src/ ftp://sunsite.icm.edu.pl/pub/unix/archiving/info-zip/src/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.cerias.purdue.edu/pub/tools/unix/sysutils/lsof/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.tau.ac.il/pub/unix/admin/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.cert.dfn.de/pub/tools/admin/lsof/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.fu-berlin.de/pub/unix/tools/lsof/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.kaizo.org/pub/lsof/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.tu-darmstadt.de/pub/sysadmin/lsof/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.tux.org/pub/sites/vic.cc.purdue.edu/tools/unix/lsof/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://gd.tuwien.ac.at/utils/admin-tools/lsof/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://sunsite.ualberta.ca/pub/Mirror/lsof/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://the.wiretapped.net/pub/security/host-security/lsof/
http://www.apache.org/dist  http://archive.apache.org/dist
ftp://.*/.*     http://mirrors.openembedded.org/
https?$://.*/.* http://mirrors.openembedded.org/
ftp://.*/.*     http://sources.openembedded.org/
https?$://.*/.* http://sources.openembedded.org/

ftp://.*/.*	http://www.angstrom-distribution.org/unstable/sources/
https?$://.*/.*	http://www.angstrom-distribution.org/unstable/sources/

}

populate_sysroot_postamble() {
	if [ "$PSTAGING_ACTIVE" = "1" ]; then
		# list the packages currently installed in staging
		# stage-manager-ipkg -f /home/oe/build-2010-07-29/tmp/pstage/opkg.conf -o /home/oe/build-2010-07-29/tmp list_installed | awk '{print $1}' > /home/oe/build-2010-07-29/tmp/pstage/installed-list

		# exitcode == 5 is ok, it means the files change
		set +e
		stage-manager -p /home/oe/build-2010-07-29/tmp/sysroots -c /home/oe/build-2010-07-29/tmp/pstage/stamp-cache-staging -u -d /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/staging-pkg/sysroots
		exitcode=$?
		if [ "$exitcode" != "5" -a "$exitcode" != "0" ]; then
			exit $exitcode
		fi
		stage-manager -p /home/oe/build-2010-07-29/tmp/cross/i686 -c /home/oe/build-2010-07-29/tmp/pstage/stamp-cache-cross -u -d /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/staging-pkg/cross/i686
		if [ "$exitcode" != "5" -a "$exitcode" != "0" ]; then
			exit $exitcode
		fi
		set -e
	fi

}

do_checkuriall() {
	:

}

packagedstaging_fastpath() {
	if [ "$PSTAGING_ACTIVE" = "1" ]; then
		mkdir -p /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/staging-pkg/sysroots/
		mkdir -p /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/staging-pkg/cross/i686/
		cp -fpPR /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/sysroot-destdir///home/oe/build-2010-07-29/tmp/sysroots/* /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/staging-pkg/sysroots/ || /bin/true
		cp -fpPR /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/sysroot-destdir///home/oe/build-2010-07-29/tmp/cross/i686/* /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/staging-pkg/cross/i686/ || /bin/true
	fi

}

cd /home/oe/build-2010-07-29/tmp/work/i686-angstrom-linux/qt4-x11-free-4.6.2-r18.2/qt-everywhere-opensource-src-4.6.2
do_configure

--------------060106010000080708010505--
