Received: from [85.115.52.190] (helo=cluster-a.mailcontrol.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Matteo.Fortini@mta.it>) id 1MHJY6-0006kG-CS
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 17:29:10 +0200
Received: from rly13a.srv.mailcontrol.com (localhost.localdomain [127.0.0.1])
	by rly13a.srv.mailcontrol.com (MailControl) with ESMTP id
	n5IFHsjX007889 for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 16:18:29 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by rly13a.srv.mailcontrol.com (MailControl) id n5IFHRlA003538
	for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 16:17:27 +0100
Received: from mailserver.mta.int (mail.mta.it [89.96.171.250])
	by rly13a-eth0.srv.mailcontrol.com (envelope-sender
	<Matteo.Fortini@mta.it>) (MIMEDefang) with ESMTP id
	n5IFHPND003379; Thu, 18 Jun 2009 16:17:27 +0100 (BST)
Received: from mta-digicas.MTA.INT ([172.26.10.13]) by mailserver.mta.int with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 18 Jun 2009 17:17:25 +0200
Received: from [172.26.6.74] (172.26.6.74) by mta-digicas.mta.int
	(172.26.10.8) with Microsoft SMTP Server (TLS) id 8.1.336.0;
	Thu, 18 Jun 2009 17:17:25 +0200
Message-ID: <4A3A5A84.6090602@mta.it>
Date: Thu, 18 Jun 2009 17:17:24 +0200
From: Matteo Fortini <matteo.fortini@mta.it>
User-Agent: Thunderbird 2.0.0.21 (Windows/20090302)
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <4A365C10.8020307@mta.it>
	<c384c5ea0906150803v223fc517se185b7fbe8a4859e@mail.gmail.com>
	<4A3666E5.4040304@mta.it> <200906172309.40571.raj.khem@gmail.com>
In-Reply-To: <200906172309.40571.raj.khem@gmail.com>
X-OriginalArrivalTime: 18 Jun 2009 15:17:25.0855 (UTC)
	FILETIME=[E2F026F0:01C9F027]
X-Scanned-By: MailControl A-09-00-10 (www.mailcontrol.com) on 10.65.1.123
Cc: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
Subject: Re: nof/libgcc_s.so installed instead of libgcc_s.so on powerpc
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
X-List-Received-Date: Thu, 18 Jun 2009 15:29:10 -0000
Content-Type: multipart/mixed; boundary="------------010606050005080700050207"

--------------010606050005080700050207
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Here it is

Thx,
Matteo



Khem Raj ha scritto:
> On Monday 15 June 2009 08:21:09 am Matteo Fortini wrote:
>   
>> I'm building on i686 a cross compiler for the mpc5121.
>>
>> The machine description I'm using is:
>>
>> TARGET_ARCH = "powerpc"
>> TARGET_FPU = "hard"
>>     
>
> Seems like we are missing right multilib option. Can you post
> your complete gcc build log and configure options.
>
> Thx
>
> -Khem
> .
>
>   

-- 
 
 
#!/bin/sh -e
export localstatedir="/opt/OE/build/tmp.1/cross/ppce300c3/var"

export prefix="/opt/OE/build/tmp.1/cross/ppce300c3"

export CPP="gcc -E"

export mandir="/opt/OE/build/tmp.1/cross/ppce300c3/share/man"

export STRIP="strip"

export STAGING_SIPDIR="/opt/OE/build/tmp.1/staging/i686-linux/usr/share/sip"

export CONFIG_SITE="/opt/OE/org.cnh_fred.dev/site/endian-little /opt/OE/org.cnh_fred.dev/site/common-linux /opt/OE/org.cnh_fred.dev/site/common-glibc /opt/OE/org.cnh_fred.dev/site/ix86-common /opt/OE/org.cnh_fred.dev/site/common /opt/OE/org.cnh_fred.dev/site/common"

export BUILD_CXXFLAGS="-isystem/opt/OE/build/tmp.1/staging/i686-linux/usr/include -O2 -fpermissive"

export OBJCOPY="objcopy"

export AR="ar"

export AS="as"

export PSTAGING_ACTIVE="1"

export libexecdir="/opt/OE/build/tmp.1/cross/ppce300c3/libexec"

export RANLIB="ranlib"

export QTDIR="/opt/OE/build/tmp.1/staging/ppce300c3-linux/qt2"

export datadir="/opt/OE/build/tmp.1/cross/ppce300c3/share"

export BUILD_CXX="ccache g++"

export SDK_LDFLAGS="-L/opt/OE/build/tmp.1/staging/i686-linux/usr/lib -Wl,-rpath-link,/opt/OE/build/tmp.1/staging/i686-linux/usr/lib -Wl,-O1"

export LD="ld"

export LDFLAGS="-L/opt/OE/build/tmp.1/staging/i686-linux/usr/lib -Wl,-rpath-link,/opt/OE/build/tmp.1/staging/i686-linux/usr/lib -Wl,-rpath,/opt/OE/build/tmp.1/staging/i686-linux/usr/lib -Wl,-O1"

export TARGET_CXXFLAGS="-isystem/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -fpermissive"

export MAKE="make"

export includedir="/opt/OE/build/tmp.1/cross/ppce300c3/include"

export TARGET_CPPFLAGS="-isystem/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include"

export BUILD_CC="ccache gcc"

export BUILD_LDFLAGS="-L/opt/OE/build/tmp.1/staging/i686-linux/usr/lib -Wl,-rpath-link,/opt/OE/build/tmp.1/staging/i686-linux/usr/lib -Wl,-rpath,/opt/OE/build/tmp.1/staging/i686-linux/usr/lib -Wl,-O1"

unset TARGET_ARCH

export CXXFLAGS="-isystem/opt/OE/build/tmp.1/staging/i686-linux/usr/include -O2"

export STAGING_IDLDIR="/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/share/idl"

export BUILD_F77="ccache g77"

export bindir="/opt/OE/build/tmp.1/cross/ppce300c3/bin"

export OBJDUMP="objdump"

export BUILD_LD="ld"

export exec_prefix="/opt/OE/build/tmp.1/cross/ppce300c3"

export oldincludedir="/opt/OE/build/tmp.1/cross/ppce300c3/include"

export CCLD="ccache gcc"

export SHELLCMDS="bash --rcfile $TERMRCFILE"

export QPEDIR="/opt/OE/build/tmp.1/staging/ppce300c3-linux"

export BUILD_CCLD="gcc"

export base_libdir="/opt/OE/build/tmp.1/cross/ppce300c3/lib"

export PATH="/opt/OE/build/tmp.1/staging/i686-linux/usr/bin/ppce300c3-linux:/opt/OE/build/tmp.1/staging/i686-linux/usr/bin/ppce300c3-linux:/opt/OE/build/tmp.1/staging/i686-linux/usr/sbin:/opt/OE/build/tmp.1/staging/i686-linux/usr/bin:/opt/OE/build/tmp.1/cross/ppce300c3/bin:/opt/OE/build/tmp.1/staging/i686-linux/sbin:/opt/OE/build/tmp.1/staging/i686-linux/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"

export TARGET_CFLAGS="-isystem/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2"

export base_bindir="/opt/OE/build/tmp.1/cross/ppce300c3/bin"

export servicedir="/opt/OE/build/tmp.1/cross/ppce300c3/srv"

export BUILD_CPP="cpp"

export SDK_CXXFLAGS="-isystem/opt/OE/build/tmp.1/staging/i686-linux/usr/include -isystem/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -fpermissive"

export sbindir="/opt/OE/build/tmp.1/cross/ppce300c3/bin"

export SDK_CFLAGS="-isystem/opt/OE/build/tmp.1/staging/i686-linux/usr/include -isystem/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2"

export BUILD_AR="ar"

export sharedstatedir="/opt/OE/build/tmp.1/cross/ppce300c3/com"

export F77="ccache g77"

export XDG_DATA_DIRS="/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/share"

export BUILD_CFLAGS="-isystem/opt/OE/build/tmp.1/staging/i686-linux/usr/include -O2"

export QMAKE_MKSPEC_PATH="/opt/OE/build/tmp.1/staging/i686-linux/usr/share/qmake"

export PKG_CONFIG_DIR="/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib/pkgconfig"

export infodir="/opt/OE/build/tmp.1/cross/ppce300c3/share/info"

export libdir="/opt/OE/build/tmp.1/cross/ppce300c3/lib"

export OPIEDIR="/opt/OE/build/tmp.1/staging/ppce300c3-linux"

export base_prefix="/opt/OE/build/tmp.1/cross/ppce300c3"

export CC="ccache gcc"

export TARGET_LDFLAGS="-L/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib -Wl,-rpath-link,/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib -Wl,-O1 -Wl,--hash-style=gnu"

export docdir="/opt/OE/build/tmp.1/cross/ppce300c3/share/doc"

export palmqtdir="/opt/OE/build/tmp.1/cross/ppce300c3/lib/opie"

unset DISTRO

export base_sbindir="/opt/OE/build/tmp.1/cross/ppce300c3/bin"

export CXX="ccache g++"

export PKG_CONFIG_DISABLE_UNINSTALLED="yes"

export PKG_CONFIG_SYSROOT_DIR="/opt/OE/build/tmp.1/staging/ppce300c3-linux"

export PKG_CONFIG_PATH="/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib/pkgconfig:/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/share/pkgconfig"

unset MACHINE

export palmtopdir="/opt/OE/build/tmp.1/cross/ppce300c3/lib/opie"

export PATCH_GET="0"

export MANIFEST="/opt/OE/org.cnh_fred.dev/recipes/gcc/gcc-4.2.4/manifest"

export SDK_CPPFLAGS="-isystem/opt/OE/build/tmp.1/staging/i686-linux/usr/include -isystem/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include"

export BUILD_STRIP="strip"

export CFLAGS="-isystem/opt/OE/build/tmp.1/staging/i686-linux/usr/include -O2"

export BUILD_RANLIB="ranlib"

export sysconfdir="/opt/OE/build/tmp.1/cross/ppce300c3/etc"

export BUILD_CPPFLAGS="-isystem/opt/OE/build/tmp.1/staging/i686-linux/usr/include"

do_fetchall() {
	base_do_fetchall

}

base_do_checkuriall() {
	:

}

populate_staging_preamble() {
	if [ "$PSTAGING_ACTIVE" = "1" ]; then
		stage-manager -p /opt/OE/build/tmp.1/staging -c /opt/OE/build/tmp.1/deploy/pstage/stamp-cache-staging -u || true
		stage-manager -p /opt/OE/build/tmp.1/cross/ppce300c3 -c /opt/OE/build/tmp.1/deploy/pstage/stamp-cache-cross -u || true
	fi

}

base_do_install() {
	:

}

do_stage() {
	oe_runmake install
	for d in info man share/doc share/locale ; do
		rm -rf /opt/OE/build/tmp.1/cross/ppce300c3/$d
	done

	# Fix a few include links so cross builds are happier
	if [ ! -e /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include/c++ ]; then
		mkdir -p /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include
		mkdir -p /opt/OE/build/tmp.1/cross/ppce300c3/powerpc-linux/include/c++
		ln -sf /opt/OE/build/tmp.1/cross/ppce300c3/powerpc-linux/include/c++ \
			/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include/
	fi

	# We use libiberty from binutils
	rm -f /opt/OE/build/tmp.1/cross/ppce300c3/lib/libiberty.a

	# We probably don't need these
	rmdir /opt/OE/build/tmp.1/cross/ppce300c3/include || :

	# We don't really need to keep this around
	# rm -rf /opt/OE/build/tmp.1/cross/ppce300c3/share but leave java there
	for d in share/man share/info;
	do
		rm -rf /opt/OE/build/tmp.1/cross/ppce300c3/$d
	done

	#fix up libsupc++ and libstdc++ la files
	for d in lib lib/nof; do
		sed -i "s|dependency_libs\s*=\s*.*|dependency_libs='-L/opt/OE/build/tmp.1/cross/ppce300c3/powerpc-linux/$d -lgcc_s -lc -lm '|" /opt/OE/build/tmp.1/cross/ppce300c3/powerpc-linux/$d/libsupc++.la || true
		sed -i "s|dependency_libs\s*=\s*.*|dependency_libs='-L/opt/OE/build/tmp.1/cross/ppce300c3/powerpc-linux/$d -lgcc_s -lc -lm '|" /opt/OE/build/tmp.1/cross/ppce300c3/powerpc-linux/$d/libstdc++.la || true
	done

}

base_do_package() {
	:

}

autotools_do_install() {
	oe_runmake 'DESTDIR=/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image' install

}

oe_machinstall() {
	# Purpose: Install machine dependent files, if available
	#          If not available, check if there is a default
	#          If no default, just touch the destination
	# Example:
	#                $1  $2   $3         $4
	# oe_machinstall -m 0644 fstab /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/etc/fstab
	#
	# TODO: Check argument number?
	#
	filename=`basename $3`
	dirname=`dirname $3`

	for o in `echo task-compile:local:mpc5121:fred:linux:powerpc:build-linux:fail-fast:pn-gcc-cross | tr ':' ' '`; do
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

package_stagefile_shell() {
	if [ "$PSTAGING_ACTIVE" = "1" ]; then
		srcfile=$1
		destfile=`echo $srcfile | sed s#/opt/OE/build/tmp.1#/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg#`
		destdir=`dirname $destfile`
		mkdir -p $destdir
		cp -dp $srcfile $destfile
	fi

}

die() {
	oefatal "$*"

}

base_do_buildall() {
	:

}

do_configure() {
	# Setup these vars for cross building only
	# ... because foo_FOR_TARGET apparently gets misinterpreted inside the
	# gcc build stuff when the build is producing a cross compiler - i.e.
	# when the 'current' target is the 'host' system, and the host is not
	# the target (because the build is actually making a cross compiler!)
	if [ "i686-linux" != "i686-linux" ]; then
		export CC_FOR_TARGET="ccache gcc "
		export GCC_FOR_TARGET="ccache gcc "
		export CXX_FOR_TARGET="ccache g++ "
		export AS_FOR_TARGET="as"
		export LD_FOR_TARGET="ld"
		export NM_FOR_TARGET="nm"
		export AR_FOR_TARGET="ar"
		export GFORTRAN_FOR_TARGET="gfortran"
		export RANLIB_FOR_TARGET="ranlib"
	fi
	export CC_FOR_BUILD="ccache gcc "
	export CXX_FOR_BUILD="ccache g++ "
	export CFLAGS_FOR_BUILD="-isystem/opt/OE/build/tmp.1/staging/i686-linux/usr/include -O2"
	export CPPFLAGS_FOR_BUILD="-isystem/opt/OE/build/tmp.1/staging/i686-linux/usr/include"
	export CXXFLAGS_FOR_BUILD="-isystem/opt/OE/build/tmp.1/staging/i686-linux/usr/include -O2 -fpermissive"
	export LDFLAGS_FOR_BUILD="-L/opt/OE/build/tmp.1/staging/i686-linux/usr/lib -Wl,-rpath-link,/opt/OE/build/tmp.1/staging/i686-linux/usr/lib -Wl,-rpath,/opt/OE/build/tmp.1/staging/i686-linux/usr/lib -Wl,-O1"
	export ARCH_FLAGS_FOR_TARGET="-mcpu=e300c3 -isystem/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include"
	(cd /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4 && gnu-configize) || die "failure running gnu-configize"

	# splice our idea of where the headers live into gcc's world
	echo "NATIVE_SYSTEM_HEADER_DIR = /usr/include" > /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp/t-oe
	sed 's%^tmake_file=.*$%& /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp/t-oe%' < /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4/gcc/Makefile.in >/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4/gcc/Makefile.in.new
	mv /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4/gcc/Makefile.in.new /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4/gcc/Makefile.in

	echo "#define STANDARD_INCLUDE_DIR \"/usr/include\"" >> /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4/gcc/defaults.h

	oe_runconf

}

oe_runconf() {
	if [ -x /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4/configure ] ; then
		cfgcmd="/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4/configure \
		    --build=i686-linux \
		    --host=i686-linux \
		    --target=powerpc-linux \
		    --prefix=/opt/OE/build/tmp.1/cross/ppce300c3 \
		    --exec_prefix=/opt/OE/build/tmp.1/cross/ppce300c3 \
		    --bindir=/opt/OE/build/tmp.1/cross/ppce300c3/bin \
		    --sbindir=/opt/OE/build/tmp.1/cross/ppce300c3/bin \
		    --libexecdir=/opt/OE/build/tmp.1/cross/ppce300c3/libexec \
		    --datadir=/opt/OE/build/tmp.1/cross/ppce300c3/share \
		    --sysconfdir=/opt/OE/build/tmp.1/cross/ppce300c3/etc \
		    --sharedstatedir=/opt/OE/build/tmp.1/cross/ppce300c3/com \
		    --localstatedir=/opt/OE/build/tmp.1/cross/ppce300c3/var \
		    --libdir=/opt/OE/build/tmp.1/cross/ppce300c3/lib \
		    --includedir=/opt/OE/build/tmp.1/cross/ppce300c3/include \
		    --oldincludedir=/opt/OE/build/tmp.1/cross/ppce300c3/include \
		    --infodir=/opt/OE/build/tmp.1/cross/ppce300c3/share/info \
		    --mandir=/opt/OE/build/tmp.1/cross/ppce300c3/share/man \
			                 --with-gnu-ld                 --enable-shared                 --enable-target-optspace                 --enable-languages=c,c++,objc                 --enable-threads=posix                 --enable-multilib                 --enable-c99                 --enable-long-long                 --enable-symvers=gnu                 --enable-libstdcxx-pch                 --program-prefix=powerpc-linux-                 --enable-libssp --disable-bootstrap --enable-libgomp --disable-libmudflap                                  --with-local-prefix=/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr 		      --with-gxx-include-dir=/opt/OE/build/tmp.1/staging/ppce300c3-linux//usr/include/c++                       --with-sysroot=/opt/OE/build/tmp.1/staging/ppce300c3-linux                       --with-build-sysroot=/opt/OE/build/tmp.1/staging/ppce300c3-linux --disable-libunwind-exceptions --with-mpfr=/opt/OE/build/tmp.1/staging/i686-linux/usr --enable-__cxa_atexit \
		    $@"
		oenote "Running $cfgcmd..."
		$cfgcmd || oefatal "oe_runconf failed"
	else
		oefatal "no configure script found"
	fi

}

base_do_compile() {
	if [ -e Makefile -o -e makefile ]; then
		oe_runmake || die "make failed"
	else
		oenote "nothing to compile"
	fi

}

oewarn() {
	echo "WARNING:" "$*"

}

autotools_stage_includes() {
	if [ "${INHIBIT_AUTO_STAGE_INCLUDES}" != "1" ]
	then
		rm -rf /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging
		mkdir -p /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging
		make DESTDIR="/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging" install
		cp -pPR /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/include/* /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include
		rm -rf /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging
	fi

}

oe_libinstall() {
	# Purpose: Install a library, in all its forms
	# Example
	#
	# oe_libinstall libltdl /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib/
	# oe_libinstall -C src/libblah libblah /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image//opt/OE/build/tmp.1/cross/ppce300c3/lib/
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
	if echo "$destpath/" | egrep '^/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib/' >/dev/null
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
				     -e '/^dependency_libs=/s,/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5[[:alnum:]/\._+-]*/\([[:alnum:]\._+-]*\),/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib/\1,g' \
				     -e "/^dependency_libs=/s,\([[:space:]']\)/opt/OE/build/tmp.1/cross/ppce300c3/lib,\1/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib,g" \
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
			sonamelink=`readelf -d $libfile |grep 'Library soname:' |sed -e 's/.*\[\(.*\)\].*/\1/'`
			solink=`echo $baselibfile | sed -e 's/\.so\..*/.so/'`
			if [ -n "$sonamelink" -a x"$baselibfile" != x"$sonamelink" ]; then
				__runcmd ln -sf $baselibfile $destpath/$sonamelink
			fi
			__runcmd ln -sf $baselibfile $destpath/$solink
		fi
	fi

	__runcmd cd "$olddir"

}

base_do_configure() {
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
	sonamelink=`readelf -d $1 |grep 'Library soname:' |sed -e 's/.*\[\(.*\)\].*/\1/'`
	solink=`echo $libname | sed -e 's/\.so\..*/.so/'`
	ln -sf $libname $2/$sonamelink
	ln -sf $libname $2/$solink

}

do_install() {
	oe_runmake 'DESTDIR=/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image' install

	# Move libgcc_s into /lib
        mkdir -p /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/lib
        if [ -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/lib/libgcc_s.so.? ]; then
                # Already in the right location
                :
        elif [ -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/lib/libgcc_s.so.? ]; then
                mv -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/lib/libgcc_s.so* /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/lib || true

        elif [  -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/*/lib/nof/libgcc_s.so.? ]; then
                mv -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/*/lib/nof/libgcc_s.so* /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/lib
        else
                mv -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/*/lib/libgcc_s.so* /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/lib || true
        fi



	# Move libstdc++ and libg2c into libdir (resetting our prefix to /usr
        mkdir -p /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/usr/lib

        if [ -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/*/lib/nof/libstdc++.so ]; then

           mv -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/*/lib/nof/libstdc++.so* /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/usr/lib || true
           mv -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/*/lib/nof/libg2c.so* /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/usr/lib || true
           mv -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/*/lib/nof/libgfortran*.so* /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/usr/lib || true
           mv -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/*/lib/nof/libssp*.so* /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/usr/lib || true

        else
           mv -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/*/lib/libstdc++.so* /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/usr/lib || true
           mv -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/*/lib/libg2c.so* /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/usr/lib || true
           mv -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/*/lib/libgfortran*.so* /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/usr/lib || true
           mv -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/*/lib/libssp*.so* /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/usr/lib || true
        fi



       # Manually run the target stripper since we won't get it run by
       # the packaging.
       if [ "x" != "x1" ]; then
               powerpc-linux-strip /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/usr/lib/libstdc++.so.*
               powerpc-linux-strip /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/usr/lib/libg2c.so.* || true
               powerpc-linux-strip /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/lib/libgcc_s.so.* || true
               powerpc-linux-strip /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/usr/lib/libgfortran*.so* || true
	fi

       # Link gfortran to g77 to satisfy not-so-smart configure or hard coded g77
       # gfortran is fully backwards compatible. This is a safe and practical solution.
       if [ -f /opt/OE/build/tmp.1/cross/ppce300c3/bin/powerpc-linux-gfortran ]; then
              currdir="$PWD"
              cd /opt/OE/build/tmp.1/cross/ppce300c3/bin/
              ln -sf powerpc-linux-gfortran powerpc-linux-g77 || true
              cd /opt/OE/build/tmp.1/cross/ppce300c3/powerpc-linux/bin/
              ln -sf gfortran g77 || true
              cd $currdir
       fi
        for i in `find /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image -name "*.la"` ; do \
                sed -i -e '/^dependency_libs=/s,/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5[[:alnum:]/\._+-]*/\([[:alnum:]\._+-]*\),/opt/OE/build/tmp.1/cross/ppce300c3/lib/\1,g' $i
                sed -i -e s:/opt/OE/build/tmp.1/cross/ppce300c3/i686-linux::g $i
                sed -i -e s:/opt/OE/build/tmp.1/cross/ppce300c3::g $i
                sed -i -e s:/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib:/opt/OE/build/tmp.1/cross/ppce300c3/lib:g $i
                sed -i -e s:/opt/OE/build/tmp.1/staging/ppce300c3-linux::g $i
                sed -i -e s:/opt/OE/build/tmp.1/staging::g $i
                sed -i -e s:/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4::g $i
                sed -i -e s:/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp::g $i
                sed -i -e s:/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image::g $i
        done

}

oenote() {
	echo "NOTE:" "$*"

}

package_update_index_ipk() {
	set -x

	ipkgarchs="all any noarch powerpc  ppce300c3 mpc5121"

	if [ ! -z "${DEPLOY_KEEP_PACKAGES}" ]; then
		return
	fi

	touch /opt/OE/build/tmp.1/deploy/ipk/Packages
	ipkg-make-index -r /opt/OE/build/tmp.1/deploy/ipk/Packages -p /opt/OE/build/tmp.1/deploy/ipk/Packages -l /opt/OE/build/tmp.1/deploy/ipk/Packages.filelist -m /opt/OE/build/tmp.1/deploy/ipk

	for arch in $ipkgarchs; do
		if [ -e /opt/OE/build/tmp.1/deploy/ipk/$arch/ ] ; then
			touch /opt/OE/build/tmp.1/deploy/ipk/$arch/Packages
			ipkg-make-index -r /opt/OE/build/tmp.1/deploy/ipk/$arch/Packages -p /opt/OE/build/tmp.1/deploy/ipk/$arch/Packages -l /opt/OE/build/tmp.1/deploy/ipk/$arch/Packages.filelist -m /opt/OE/build/tmp.1/deploy/ipk/$arch/
		fi
		if [ -e /opt/OE/build/tmp.1/deploy/ipk/i686-$arch-sdk/ ] ; then
			touch /opt/OE/build/tmp.1/deploy/ipk/i686-$arch-sdk/Packages
			ipkg-make-index -r /opt/OE/build/tmp.1/deploy/ipk/i686-$arch-sdk/Packages -p /opt/OE/build/tmp.1/deploy/ipk/i686-$arch-sdk/Packages -l /opt/OE/build/tmp.1/deploy/ipk/i686-$arch-sdk/Packages.filelist -m /opt/OE/build/tmp.1/deploy/ipk/i686-$arch-sdk/
		fi
		if [ -e /opt/OE/build/tmp.1/deploy/ipk/i686-linux-sdk-$arch/ ] ; then
			touch /opt/OE/build/tmp.1/deploy/ipk/i686-linux-sdk-$arch/Packages
			ipkg-make-index -r /opt/OE/build/tmp.1/deploy/ipk/i686-linux-sdk-$arch/Packages -p /opt/OE/build/tmp.1/deploy/ipk/i686-linux-sdk-$arch/Packages -l /opt/OE/build/tmp.1/deploy/ipk/i686-linux-sdk-$arch/Packages.filelist -m /opt/OE/build/tmp.1/deploy/ipk/i686-linux-sdk-$arch/
		fi
	done

}

do_package_write() {
	:

}

package_generate_ipkg_conf() {
	mkdir -p /opt/OE/build/tmp.1/staging/i686-linux/etc/
	echo "src oe file:/opt/OE/build/tmp.1/deploy/ipk" > /opt/OE/build/tmp.1/staging/i686-linux/etc/opkg.conf
	echo "src oe file:/opt/OE/build/tmp.1/deploy/ipk" > /opt/OE/build/tmp.1/staging/i686-linux/etc/opkg-sdk.conf
	echo "src oe file:/opt/OE/build/tmp.1/deploy/ipk" > /opt/OE/build/tmp.1/staging/i686-linux/etc/opkg-canadian-sdk.conf
	ipkgarchs="all any noarch powerpc  ppce300c3 mpc5121"
	priority=1
	for arch in $ipkgarchs; do
		echo "arch $arch $priority" >> /opt/OE/build/tmp.1/staging/i686-linux/etc/opkg.conf
		echo "arch i686-$arch-sdk $priority" >> /opt/OE/build/tmp.1/staging/i686-linux/etc/opkg-sdk.conf
		echo "arch i686-linux-sdk-$arch $priority" >> /opt/OE/build/tmp.1/staging/i686-linux/etc/opkg-canadian-sdk.conf
		priority=$(expr $priority + 5)
		if [ -e /opt/OE/build/tmp.1/deploy/ipk/$arch/Packages ] ; then
		        echo "src oe-$arch file:/opt/OE/build/tmp.1/deploy/ipk/$arch" >> /opt/OE/build/tmp.1/staging/i686-linux/etc/opkg.conf
		fi
		if [ -e /opt/OE/build/tmp.1/deploy/ipk/i686-$arch-sdk/Packages ] ; then
		        echo "src oe-i686-$arch-sdk file:/opt/OE/build/tmp.1/deploy/ipk/i686-$arch-sdk" >> /opt/OE/build/tmp.1/staging/i686-linux/etc/opkg-sdk.conf
		fi
		if [ -e /opt/OE/build/tmp.1/deploy/ipk/i686-linux-sdk-$arch/Packages ] ; then
		        echo "src oe-i686-linux-sdk-$arch file:/opt/OE/build/tmp.1/deploy/ipk/i686-linux-sdk-$arch" >> /opt/OE/build/tmp.1/staging/i686-linux/etc/opkg-canadian-sdk.conf
		fi
	done

}

base_do_fetchall() {
	:

}

staging_packager() {

	mkdir -p /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg/CONTROL
	mkdir -p /opt/OE/build/tmp.1/deploy/pstage/fred/2/.1/-opt-OE-build-tmp.1

	echo "Package: staging-gcc-cross-ppce300c3-linux"         >  /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg/CONTROL/control
	echo "Version: 4.2.4-r5"    >> /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg/CONTROL/control
	echo "Description: The GNU cc and gcc C compilers."      >> /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg/CONTROL/control
	echo "Section: devel"              >> /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg/CONTROL/control
	echo "Priority: Optional"               >> /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg/CONTROL/control
	echo "Maintainer: OpenEmbedded Team <openembedded-devel@lists.openembedded.org>"        >> /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg/CONTROL/control
	echo "Architecture: i686-linux"  >> /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg/CONTROL/control

	# Protect against empty SRC_URI
	if [ "ftp://ftp.gnu.org/gnu/gcc/gcc-4.2.4/gcc-4.2.4.tar.bz2 	file://100-uclibc-conf.patch;patch=1 	file://103-uclibc-conf-noupstream.patch;patch=1 	file://200-uclibc-locale.patch;patch=1 	file://203-uclibc-locale-no__x.patch;patch=1 	file://204-uclibc-locale-wchar_fix.patch;patch=1 	file://205-uclibc-locale-update.patch;patch=1 	file://300-libstdc++-pic.patch;patch=1 	file://301-missing-execinfo_h.patch;patch=1 	file://302-c99-snprintf.patch;patch=1 	file://303-c99-complex-ugly-hack.patch;patch=1 	file://304-index_macro.patch;patch=1 	file://305-libmudflap-susv3-legacy.patch;patch=1 	file://306-libstdc++-namespace.patch;patch=1 	file://307-locale_facets.patch;patch=1 	file://402-libbackend_dep_gcov-iov.h.patch;patch=1 	file://602-sdk-libstdc++-includes.patch;patch=1 	file://740-sh-pr24836.patch;patch=1 	file://800-arm-bigendian.patch;patch=1 	file://801-arm-bigendian-eabi.patch;patch=1 	file://904-flatten-switch-stmt-00.patch;patch=1 	file://arm-nolibfloat.patch;patch=1 	file://arm-softfloat.patch;patch=1 	file://gcc41-configure.in.patch;patch=1 	file://arm-thumb.patch;patch=1 	file://arm-thumb-cache.patch;patch=1 	file://ldflags.patch;patch=1 	file://zecke-xgcc-cpp.patch;patch=1 	file://unbreak-armv4t.patch;patch=1 	file://fix-ICE-in-arm_unwind_emit_set.diff;patch=1 	file://cache-amnesia.patch;patch=1 	file://gfortran.patch;patch=1 	file://gcc-4.0.2-e300c2c3.patch;patch=1 	file://fortran-static-linking.patch;patch=1 	file://intermask-bigendian.patch;patch=1  file://zecke-no-host-includes.patch;patch=1 " != "" ] ; then
		echo "Source: ftp://ftp.gnu.org/gnu/gcc/gcc-4.2.4/gcc-4.2.4.tar.bz2 	file://100-uclibc-conf.patch;patch=1 	file://103-uclibc-conf-noupstream.patch;patch=1 	file://200-uclibc-locale.patch;patch=1 	file://203-uclibc-locale-no__x.patch;patch=1 	file://204-uclibc-locale-wchar_fix.patch;patch=1 	file://205-uclibc-locale-update.patch;patch=1 	file://300-libstdc++-pic.patch;patch=1 	file://301-missing-execinfo_h.patch;patch=1 	file://302-c99-snprintf.patch;patch=1 	file://303-c99-complex-ugly-hack.patch;patch=1 	file://304-index_macro.patch;patch=1 	file://305-libmudflap-susv3-legacy.patch;patch=1 	file://306-libstdc++-namespace.patch;patch=1 	file://307-locale_facets.patch;patch=1 	file://402-libbackend_dep_gcov-iov.h.patch;patch=1 	file://602-sdk-libstdc++-includes.patch;patch=1 	file://740-sh-pr24836.patch;patch=1 	file://800-arm-bigendian.patch;patch=1 	file://801-arm-bigendian-eabi.patch;patch=1 	file://904-flatten-switch-stmt-00.patch;patch=1 	file://arm-nolibfloat.patch;patch=1 	file://arm-softfloat.patch;patch=1 	file://gcc41-configure.in.patch;patch=1 	file://arm-thumb.patch;patch=1 	file://arm-thumb-cache.patch;patch=1 	file://ldflags.patch;patch=1 	file://zecke-xgcc-cpp.patch;patch=1 	file://unbreak-armv4t.patch;patch=1 	file://fix-ICE-in-arm_unwind_emit_set.diff;patch=1 	file://cache-amnesia.patch;patch=1 	file://gfortran.patch;patch=1 	file://gcc-4.0.2-e300c2c3.patch;patch=1 	file://fortran-static-linking.patch;patch=1 	file://intermask-bigendian.patch;patch=1  file://zecke-no-host-includes.patch;patch=1 "               >> /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg/CONTROL/control
	else
		echo "Source: OpenEmbedded"               >> /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg/CONTROL/control
	fi

	stage-manager-ipkg-build -o 0 -g 0 /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg /opt/OE/build/tmp.1/deploy/pstage/fred/2/.1/-opt-OE-build-tmp.1

}

autotools_do_configure() {
	case gcc-cross in
	autoconf*)
	;;
	automake*)
	;;
	*)
		# WARNING: gross hack follows:
		# An autotools built package generally needs these scripts, however only
		# automake or libtoolize actually install the current versions of them.
		# This is a problem in builds that do not use libtool or automake, in the case
		# where we -need- the latest version of these scripts.  e.g. running a build
		# for a package whose autotools are old, on an x86_64 machine, which the old
		# config.sub does not support.  Work around this by installing them manually
		# regardless.
		( for ac in `find /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4 -name configure.in -o -name configure.ac`; do
			rm -f `dirname $ac`/configure
			done )
		if [ -e /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4/configure.in -o -e /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4/configure.ac ]; then
			olddir=`pwd`
			cd /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4
			if [ x"default" = xdefault ]; then
				acpaths=
				for i in `find /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4 -maxdepth 2 -name \*.m4|grep -v 'aclocal.m4'| \
					grep -v 'acinclude.m4' | sed -e 's,\(.*/\).*$,\1,'|sort -u`; do
					acpaths="$acpaths -I $i"
				done
			else
				acpaths="default"
			fi
			AUTOV=`automake --version |head -n 1 |sed "s/.* //;s/\.[0-9]\+$//"`
			automake --version
			echo "AUTOV is $AUTOV"
			install -d /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/share/aclocal
			install -d /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/share/aclocal-$AUTOV
			acpaths="$acpaths -I/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/share/aclocal-$AUTOV -I /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/share/aclocal"
			# autoreconf is too shy to overwrite aclocal.m4 if it doesn't look
			# like it was auto-generated.  Work around this by blowing it away
			# by hand, unless the package specifically asked not to run aclocal.
			if ! echo --exclude=autopoint | grep -q "aclocal"; then
				rm -f aclocal.m4
			fi
			if [ -e configure.in ]; then
			  CONFIGURE_AC=configure.in
			else
			  CONFIGURE_AC=configure.ac
			fi
			if grep "^AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
			  if grep "sed.*POTFILES" $CONFIGURE_AC >/dev/null; then
			    : do nothing -- we still have an old unmodified configure.ac
			  else
			    oenote Executing glib-gettextize --force --copy
			    echo "no" | glib-gettextize --force --copy
			  fi
			fi
			if grep "^[AI][CT]_PROG_INTLTOOL" $CONFIGURE_AC >/dev/null; then
			  oenote Executing intltoolize --copy --force --automake
			  intltoolize --copy --force --automake
			fi
			oenote Executing autoreconf --verbose --install --force --exclude=autopoint $acpaths
			mkdir -p m4
			autoreconf -Wcross --verbose --install --force --exclude=autopoint $acpaths || oefatal "autoreconf execution failed."
			cd $olddir
		fi
	;;
	esac
	if [ -e /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4/configure ]; then
		oe_runconf $@
	else
		oenote "nothing to configure"
	fi

}

base_do_stage() {
	:

}

autotools_stage_dir() {
	from="$1"
	to="$2"
	# This will remove empty directories so we can ignore them
	rmdir "$from" 2> /dev/null || true
	if [ -d "$from" ]; then
		mkdir -p "$to"
		cp -fpPR "$from"/* "$to"
	fi

}

autotools_stage_all() {
	if [ "${INHIBIT_AUTO_STAGE}" = "1" ]
	then
		return
	fi
	rm -rf /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging
	mkdir -p /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging
	oe_runmake DESTDIR="/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging" install
	autotools_stage_dir /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/include /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include
	if [ "i686-linux" = "i686-linux" ]; then
		autotools_stage_dir /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/bin /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/bin
		autotools_stage_dir /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/bin /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/sbin
		autotools_stage_dir /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/bin /opt/OE/build/tmp.1/staging/ppce300c3-linux/bin
		autotools_stage_dir /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/bin /opt/OE/build/tmp.1/staging/ppce300c3-linux/sbin
		autotools_stage_dir /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/libexec /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/libexec
		if [ "/opt/OE/build/tmp.1/cross/ppce300c3/lib" != "/opt/OE/build/tmp.1/cross/ppce300c3/lib" ]; then
			# python puts its files in here, make sure they are staged as well
			autotools_stage_dir /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/lib /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib
		fi
	fi
	if [ -d /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/lib ]
	then
		olddir=`pwd`
		cd /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/lib
		las=$(find . -name \*.la -type f)
		cd $olddir
		echo "Found la files: $las"
		for i in $las
		do
			sed -e 's/^installed=yes$/installed=no/' \
			    -e '/^dependency_libs=/s,/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5[[:alnum:]/\._+-]*/\([[:alnum:]\._+-]*.la\),/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib/\1,g' \
			    -e '/^dependency_libs=/s,/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5[[:alnum:]/\._+-]*/\([[:alnum:]\._+-]*\),/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib,g' \
			    -e "/^dependency_libs=/s,\([[:space:]']\)/opt/OE/build/tmp.1/cross/ppce300c3/lib,\1/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib,g" \
			    -i /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/lib/$i
		done
		autotools_stage_dir /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/lib /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib
	fi
	# Ok, this is nasty. pkgconfig.bbclass is usually used to install .pc files,
	# however some packages rely on the presence of .pc files to enable/disable
	# their configurataions in which case we better should not install everything
	# unconditionally, but rather depend on the actual results of make install.
	# The good news though: a) there are not many packages doing this and
	# b) packaged staging will fix that anyways. :M:
	if [ "${AUTOTOOLS_STAGE_PKGCONFIG}" = "1" ]
	then
		if [ -e /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/lib/pkgconfig/ ] ; then
			echo "cp -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/lib/pkgconfig/*.pc /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib/pkgconfig/"
			cp -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/lib/pkgconfig/*.pc /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib/pkgconfig/
		fi
	fi
	rm -rf /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/share/man || true
	rm -rf /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/share/info || true
	autotools_stage_dir /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/share /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/share
	rm -rf /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging

}

ldconfig_postinst_fragment() {
if [ x"$D" = "x" ]; then
	if [ -e /etc/ld.so.conf ] ; then
		[ -x /sbin/ldconfig ] && /sbin/ldconfig
	fi
fi

}

do_compile() {
	export CC="ccache gcc "
	export AR_FOR_TARGET="powerpc-linux-ar"
	export RANLIB_FOR_TARGET="powerpc-linux-ranlib"
	export LD_FOR_TARGET="powerpc-linux-ld"
	export NM_FOR_TARGET="powerpc-linux-nm"
	export CC_FOR_TARGET="ccache  powerpc-linux-gcc -mcpu=e300c3"
	base_do_compile

}

staging_helper() {
	# Assemble appropriate opkg.conf
	conffile=/opt/OE/build/tmp.1/deploy/pstage/opkg.conf
	mkdir -p /opt/OE/build/tmp.1/deploy/pstage/pstaging_lists
	if [ ! -e $conffile ]; then
		ipkgarchs="i686-linux"
		priority=1
		for arch in $ipkgarchs; do
			echo "arch $arch $priority" >> $conffile
			priority=$(expr $priority + 5)
		done
		echo "dest root /" >> $conffile
	fi
	if [ ! -e /opt/OE/build/tmp.1/usr/lib/opkg/info/ ]; then
		mkdir -p /opt/OE/build/tmp.1/usr/lib/opkg/info/
	fi
 	if [ ! -e /opt/OE/build/tmp.1/usr/lib/ipkg/ ]; then
		cd /opt/OE/build/tmp.1/usr/lib/
		ln -sf opkg/ ipkg
	fi

}

populate_staging_postamble() {
	if [ "$PSTAGING_ACTIVE" = "1" ]; then
		# list the packages currently installed in staging
		# stage-manager-ipkg -f /opt/OE/build/tmp.1/deploy/pstage/opkg.conf -o /opt/OE/build/tmp.1 list_installed | awk '{print $1}' > /opt/OE/build/tmp.1/deploy/pstage/installed-list

		# exitcode == 5 is ok, it means the files change
		set +e
		stage-manager -p /opt/OE/build/tmp.1/staging -c /opt/OE/build/tmp.1/deploy/pstage/stamp-cache-staging -u -d /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg/staging
		exitcode=$?
		if [ "$exitcode" != "5" -a "$exitcode" != "0" ]; then
			exit $exitcode
		fi
		stage-manager -p /opt/OE/build/tmp.1/cross/ppce300c3 -c /opt/OE/build/tmp.1/deploy/pstage/stamp-cache-cross -u -d /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg/cross
		if [ "$exitcode" != "5" -a "$exitcode" != "0" ]; then
			exit $exitcode
		fi
		set -e
	fi

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

oe_runmake() {
	if [ x"$MAKE" = x ]; then MAKE=make; fi
	oenote make -j 6  ARCH_FLAGS_FOR_TARGET='-mcpu=e300c3 -isystem/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include' "$@"
	make -j 6  ARCH_FLAGS_FOR_TARGET='-mcpu=e300c3 -isystem/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include' "$@" || die "oe_runmake failed"

}

do_package_stage_all() {
	:

}

staging_package_installer() {
	#stage-manager-ipkg -f /opt/OE/build/tmp.1/deploy/pstage/opkg.conf -force-depends -o /opt/OE/build/tmp.1 install /opt/OE/build/tmp.1/deploy/pstage/fred/2/.1/-opt-OE-build-tmp.1/staging-gcc-cross-ppce300c3-linux_4.2.4-r5_i686-linux.ipk

	STATUSFILE=/opt/OE/build/tmp.1/usr/lib/opkg/status
	echo "Package: staging-gcc-cross-ppce300c3-linux"        >> $STATUSFILE
	echo "Version: 4.2.4-r5"   >> $STATUSFILE
	echo "Status: install user installed"  >> $STATUSFILE
	echo "Architecture: i686-linux" >> $STATUSFILE
	echo "" >> $STATUSFILE

	CTRLFILE=/opt/OE/build/tmp.1/usr/lib/opkg/info/staging-gcc-cross-ppce300c3-linux.control
	echo "Package: staging-gcc-cross-ppce300c3-linux"        > $CTRLFILE
	echo "Version: 4.2.4-r5"   >> $CTRLFILE
	echo "Architecture: i686-linux" >> $CTRLFILE

	cd /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg
	find -type f | grep -v ./CONTROL | sed -e 's/^\.//' > /opt/OE/build/tmp.1/usr/lib/opkg/info/staging-gcc-cross-ppce300c3-linux.list

}

oefatal() {
	echo "FATAL:" "$*"
	exit 1

}

MIRRORS() {
ftp://ftp.gnu.org/gnu/gcc/releases/    ftp://gcc.gnu.org/pub/gcc/releases/
ftp://ftp.gnu.org/gnu/gcc/	http://mirrors.rcn.net/pub/sourceware/gcc/releases/
ftp://ftp.gnu.org/gnu/gcc/releases/    http://gcc.get-software.com/releases/
ftp://ftp.gnu.org/gnu/gcc/	http://gcc.get-software.com/releases/
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
ftp://ftp.gnu.org/gnu	ftp://ftp.matrix.com.br/pub/gnu
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


}

cd /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4/build.i686-linux.powerpc-linux
do_compile
#!/bin/sh -e
export localstatedir="/opt/OE/build/tmp.1/cross/ppce300c3/var"

export prefix="/opt/OE/build/tmp.1/cross/ppce300c3"

export CPP="gcc -E"

export mandir="/opt/OE/build/tmp.1/cross/ppce300c3/share/man"

export STRIP="strip"

export STAGING_SIPDIR="/opt/OE/build/tmp.1/staging/i686-linux/usr/share/sip"

export CONFIG_SITE="/opt/OE/org.cnh_fred.dev/site/endian-little /opt/OE/org.cnh_fred.dev/site/common-linux /opt/OE/org.cnh_fred.dev/site/common-glibc /opt/OE/org.cnh_fred.dev/site/ix86-common /opt/OE/org.cnh_fred.dev/site/common /opt/OE/org.cnh_fred.dev/site/common"

export BUILD_CXXFLAGS="-isystem/opt/OE/build/tmp.1/staging/i686-linux/usr/include -O2 -fpermissive"

export OBJCOPY="objcopy"

export AR="ar"

export AS="as"

export PSTAGING_ACTIVE="1"

export libexecdir="/opt/OE/build/tmp.1/cross/ppce300c3/libexec"

export RANLIB="ranlib"

export QTDIR="/opt/OE/build/tmp.1/staging/ppce300c3-linux/qt2"

export datadir="/opt/OE/build/tmp.1/cross/ppce300c3/share"

export BUILD_CXX="ccache g++"

export SDK_LDFLAGS="-L/opt/OE/build/tmp.1/staging/i686-linux/usr/lib -Wl,-rpath-link,/opt/OE/build/tmp.1/staging/i686-linux/usr/lib -Wl,-O1"

export LD="ld"

export LDFLAGS="-L/opt/OE/build/tmp.1/staging/i686-linux/usr/lib -Wl,-rpath-link,/opt/OE/build/tmp.1/staging/i686-linux/usr/lib -Wl,-rpath,/opt/OE/build/tmp.1/staging/i686-linux/usr/lib -Wl,-O1"

export TARGET_CXXFLAGS="-isystem/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -fpermissive"

export MAKE="make"

export includedir="/opt/OE/build/tmp.1/cross/ppce300c3/include"

export TARGET_CPPFLAGS="-isystem/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include"

export BUILD_CC="ccache gcc"

export BUILD_LDFLAGS="-L/opt/OE/build/tmp.1/staging/i686-linux/usr/lib -Wl,-rpath-link,/opt/OE/build/tmp.1/staging/i686-linux/usr/lib -Wl,-rpath,/opt/OE/build/tmp.1/staging/i686-linux/usr/lib -Wl,-O1"

unset TARGET_ARCH

export CXXFLAGS="-isystem/opt/OE/build/tmp.1/staging/i686-linux/usr/include -O2"

export STAGING_IDLDIR="/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/share/idl"

export BUILD_F77="ccache g77"

export bindir="/opt/OE/build/tmp.1/cross/ppce300c3/bin"

export OBJDUMP="objdump"

export BUILD_LD="ld"

export exec_prefix="/opt/OE/build/tmp.1/cross/ppce300c3"

export oldincludedir="/opt/OE/build/tmp.1/cross/ppce300c3/include"

export CCLD="ccache gcc"

export SHELLCMDS="bash --rcfile $TERMRCFILE"

export QPEDIR="/opt/OE/build/tmp.1/staging/ppce300c3-linux"

export BUILD_CCLD="gcc"

export base_libdir="/opt/OE/build/tmp.1/cross/ppce300c3/lib"

export PATH="/opt/OE/build/tmp.1/staging/i686-linux/usr/bin/ppce300c3-linux:/opt/OE/build/tmp.1/staging/i686-linux/usr/bin/ppce300c3-linux:/opt/OE/build/tmp.1/staging/i686-linux/usr/sbin:/opt/OE/build/tmp.1/staging/i686-linux/usr/bin:/opt/OE/build/tmp.1/cross/ppce300c3/bin:/opt/OE/build/tmp.1/staging/i686-linux/sbin:/opt/OE/build/tmp.1/staging/i686-linux/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"

export TARGET_CFLAGS="-isystem/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2"

export base_bindir="/opt/OE/build/tmp.1/cross/ppce300c3/bin"

export servicedir="/opt/OE/build/tmp.1/cross/ppce300c3/srv"

export BUILD_CPP="cpp"

export SDK_CXXFLAGS="-isystem/opt/OE/build/tmp.1/staging/i686-linux/usr/include -isystem/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -fpermissive"

export sbindir="/opt/OE/build/tmp.1/cross/ppce300c3/bin"

export SDK_CFLAGS="-isystem/opt/OE/build/tmp.1/staging/i686-linux/usr/include -isystem/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2"

export BUILD_AR="ar"

export sharedstatedir="/opt/OE/build/tmp.1/cross/ppce300c3/com"

export F77="ccache g77"

export XDG_DATA_DIRS="/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/share"

export BUILD_CFLAGS="-isystem/opt/OE/build/tmp.1/staging/i686-linux/usr/include -O2"

export QMAKE_MKSPEC_PATH="/opt/OE/build/tmp.1/staging/i686-linux/usr/share/qmake"

export PKG_CONFIG_DIR="/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib/pkgconfig"

export infodir="/opt/OE/build/tmp.1/cross/ppce300c3/share/info"

export libdir="/opt/OE/build/tmp.1/cross/ppce300c3/lib"

export OPIEDIR="/opt/OE/build/tmp.1/staging/ppce300c3-linux"

export base_prefix="/opt/OE/build/tmp.1/cross/ppce300c3"

export CC="ccache gcc"

export TARGET_LDFLAGS="-L/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib -Wl,-rpath-link,/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib -Wl,-O1 -Wl,--hash-style=gnu"

export docdir="/opt/OE/build/tmp.1/cross/ppce300c3/share/doc"

export palmqtdir="/opt/OE/build/tmp.1/cross/ppce300c3/lib/opie"

unset DISTRO

export base_sbindir="/opt/OE/build/tmp.1/cross/ppce300c3/bin"

export CXX="ccache g++"

export PKG_CONFIG_DISABLE_UNINSTALLED="yes"

export PKG_CONFIG_SYSROOT_DIR="/opt/OE/build/tmp.1/staging/ppce300c3-linux"

export PKG_CONFIG_PATH="/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib/pkgconfig:/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/share/pkgconfig"

unset MACHINE

export palmtopdir="/opt/OE/build/tmp.1/cross/ppce300c3/lib/opie"

export PATCH_GET="0"

export MANIFEST="/opt/OE/org.cnh_fred.dev/recipes/gcc/gcc-4.2.4/manifest"

export SDK_CPPFLAGS="-isystem/opt/OE/build/tmp.1/staging/i686-linux/usr/include -isystem/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include"

export BUILD_STRIP="strip"

export CFLAGS="-isystem/opt/OE/build/tmp.1/staging/i686-linux/usr/include -O2"

export BUILD_RANLIB="ranlib"

export sysconfdir="/opt/OE/build/tmp.1/cross/ppce300c3/etc"

export BUILD_CPPFLAGS="-isystem/opt/OE/build/tmp.1/staging/i686-linux/usr/include"

do_fetchall() {
	base_do_fetchall

}

base_do_checkuriall() {
	:

}

populate_staging_preamble() {
	if [ "$PSTAGING_ACTIVE" = "1" ]; then
		stage-manager -p /opt/OE/build/tmp.1/staging -c /opt/OE/build/tmp.1/deploy/pstage/stamp-cache-staging -u || true
		stage-manager -p /opt/OE/build/tmp.1/cross/ppce300c3 -c /opt/OE/build/tmp.1/deploy/pstage/stamp-cache-cross -u || true
	fi

}

base_do_install() {
	:

}

do_stage() {
	oe_runmake install
	for d in info man share/doc share/locale ; do
		rm -rf /opt/OE/build/tmp.1/cross/ppce300c3/$d
	done

	# Fix a few include links so cross builds are happier
	if [ ! -e /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include/c++ ]; then
		mkdir -p /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include
		mkdir -p /opt/OE/build/tmp.1/cross/ppce300c3/powerpc-linux/include/c++
		ln -sf /opt/OE/build/tmp.1/cross/ppce300c3/powerpc-linux/include/c++ \
			/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include/
	fi

	# We use libiberty from binutils
	rm -f /opt/OE/build/tmp.1/cross/ppce300c3/lib/libiberty.a

	# We probably don't need these
	rmdir /opt/OE/build/tmp.1/cross/ppce300c3/include || :

	# We don't really need to keep this around
	# rm -rf /opt/OE/build/tmp.1/cross/ppce300c3/share but leave java there
	for d in share/man share/info;
	do
		rm -rf /opt/OE/build/tmp.1/cross/ppce300c3/$d
	done

	#fix up libsupc++ and libstdc++ la files
	for d in lib lib/nof; do
		sed -i "s|dependency_libs\s*=\s*.*|dependency_libs='-L/opt/OE/build/tmp.1/cross/ppce300c3/powerpc-linux/$d -lgcc_s -lc -lm '|" /opt/OE/build/tmp.1/cross/ppce300c3/powerpc-linux/$d/libsupc++.la || true
		sed -i "s|dependency_libs\s*=\s*.*|dependency_libs='-L/opt/OE/build/tmp.1/cross/ppce300c3/powerpc-linux/$d -lgcc_s -lc -lm '|" /opt/OE/build/tmp.1/cross/ppce300c3/powerpc-linux/$d/libstdc++.la || true
	done

}

base_do_package() {
	:

}

autotools_do_install() {
	oe_runmake 'DESTDIR=/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image' install

}

oe_machinstall() {
	# Purpose: Install machine dependent files, if available
	#          If not available, check if there is a default
	#          If no default, just touch the destination
	# Example:
	#                $1  $2   $3         $4
	# oe_machinstall -m 0644 fstab /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/etc/fstab
	#
	# TODO: Check argument number?
	#
	filename=`basename $3`
	dirname=`dirname $3`

	for o in `echo task-configure:local:mpc5121:fred:linux:powerpc:build-linux:fail-fast:pn-gcc-cross | tr ':' ' '`; do
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

package_stagefile_shell() {
	if [ "$PSTAGING_ACTIVE" = "1" ]; then
		srcfile=$1
		destfile=`echo $srcfile | sed s#/opt/OE/build/tmp.1#/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg#`
		destdir=`dirname $destfile`
		mkdir -p $destdir
		cp -dp $srcfile $destfile
	fi

}

die() {
	oefatal "$*"

}

base_do_buildall() {
	:

}

do_configure() {
	# Setup these vars for cross building only
	# ... because foo_FOR_TARGET apparently gets misinterpreted inside the
	# gcc build stuff when the build is producing a cross compiler - i.e.
	# when the 'current' target is the 'host' system, and the host is not
	# the target (because the build is actually making a cross compiler!)
	if [ "i686-linux" != "i686-linux" ]; then
		export CC_FOR_TARGET="ccache gcc "
		export GCC_FOR_TARGET="ccache gcc "
		export CXX_FOR_TARGET="ccache g++ "
		export AS_FOR_TARGET="as"
		export LD_FOR_TARGET="ld"
		export NM_FOR_TARGET="nm"
		export AR_FOR_TARGET="ar"
		export GFORTRAN_FOR_TARGET="gfortran"
		export RANLIB_FOR_TARGET="ranlib"
	fi
	export CC_FOR_BUILD="ccache gcc "
	export CXX_FOR_BUILD="ccache g++ "
	export CFLAGS_FOR_BUILD="-isystem/opt/OE/build/tmp.1/staging/i686-linux/usr/include -O2"
	export CPPFLAGS_FOR_BUILD="-isystem/opt/OE/build/tmp.1/staging/i686-linux/usr/include"
	export CXXFLAGS_FOR_BUILD="-isystem/opt/OE/build/tmp.1/staging/i686-linux/usr/include -O2 -fpermissive"
	export LDFLAGS_FOR_BUILD="-L/opt/OE/build/tmp.1/staging/i686-linux/usr/lib -Wl,-rpath-link,/opt/OE/build/tmp.1/staging/i686-linux/usr/lib -Wl,-rpath,/opt/OE/build/tmp.1/staging/i686-linux/usr/lib -Wl,-O1"
	export ARCH_FLAGS_FOR_TARGET="-mcpu=e300c3 -isystem/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include"
	(cd /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4 && gnu-configize) || die "failure running gnu-configize"

	# splice our idea of where the headers live into gcc's world
	echo "NATIVE_SYSTEM_HEADER_DIR = /usr/include" > /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp/t-oe
	sed 's%^tmake_file=.*$%& /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp/t-oe%' < /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4/gcc/Makefile.in >/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4/gcc/Makefile.in.new
	mv /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4/gcc/Makefile.in.new /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4/gcc/Makefile.in

	echo "#define STANDARD_INCLUDE_DIR \"/usr/include\"" >> /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4/gcc/defaults.h

	oe_runconf

}

oe_runconf() {
	if [ -x /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4/configure ] ; then
		cfgcmd="/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4/configure \
		    --build=i686-linux \
		    --host=i686-linux \
		    --target=powerpc-linux \
		    --prefix=/opt/OE/build/tmp.1/cross/ppce300c3 \
		    --exec_prefix=/opt/OE/build/tmp.1/cross/ppce300c3 \
		    --bindir=/opt/OE/build/tmp.1/cross/ppce300c3/bin \
		    --sbindir=/opt/OE/build/tmp.1/cross/ppce300c3/bin \
		    --libexecdir=/opt/OE/build/tmp.1/cross/ppce300c3/libexec \
		    --datadir=/opt/OE/build/tmp.1/cross/ppce300c3/share \
		    --sysconfdir=/opt/OE/build/tmp.1/cross/ppce300c3/etc \
		    --sharedstatedir=/opt/OE/build/tmp.1/cross/ppce300c3/com \
		    --localstatedir=/opt/OE/build/tmp.1/cross/ppce300c3/var \
		    --libdir=/opt/OE/build/tmp.1/cross/ppce300c3/lib \
		    --includedir=/opt/OE/build/tmp.1/cross/ppce300c3/include \
		    --oldincludedir=/opt/OE/build/tmp.1/cross/ppce300c3/include \
		    --infodir=/opt/OE/build/tmp.1/cross/ppce300c3/share/info \
		    --mandir=/opt/OE/build/tmp.1/cross/ppce300c3/share/man \
			                 --with-gnu-ld                 --enable-shared                 --enable-target-optspace                 --enable-languages=c,c++,objc                 --enable-threads=posix                 --enable-multilib                 --enable-c99                 --enable-long-long                 --enable-symvers=gnu                 --enable-libstdcxx-pch                 --program-prefix=powerpc-linux-                 --enable-libssp --disable-bootstrap --enable-libgomp --disable-libmudflap                                  --with-local-prefix=/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr 		      --with-gxx-include-dir=/opt/OE/build/tmp.1/staging/ppce300c3-linux//usr/include/c++                       --with-sysroot=/opt/OE/build/tmp.1/staging/ppce300c3-linux                       --with-build-sysroot=/opt/OE/build/tmp.1/staging/ppce300c3-linux --disable-libunwind-exceptions --with-mpfr=/opt/OE/build/tmp.1/staging/i686-linux/usr --enable-__cxa_atexit \
		    $@"
		oenote "Running $cfgcmd..."
		$cfgcmd || oefatal "oe_runconf failed"
	else
		oefatal "no configure script found"
	fi

}

base_do_compile() {
	if [ -e Makefile -o -e makefile ]; then
		oe_runmake || die "make failed"
	else
		oenote "nothing to compile"
	fi

}

oewarn() {
	echo "WARNING:" "$*"

}

autotools_stage_includes() {
	if [ "${INHIBIT_AUTO_STAGE_INCLUDES}" != "1" ]
	then
		rm -rf /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging
		mkdir -p /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging
		make DESTDIR="/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging" install
		cp -pPR /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/include/* /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include
		rm -rf /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging
	fi

}

oe_libinstall() {
	# Purpose: Install a library, in all its forms
	# Example
	#
	# oe_libinstall libltdl /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib/
	# oe_libinstall -C src/libblah libblah /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image//opt/OE/build/tmp.1/cross/ppce300c3/lib/
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
	if echo "$destpath/" | egrep '^/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib/' >/dev/null
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
				     -e '/^dependency_libs=/s,/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5[[:alnum:]/\._+-]*/\([[:alnum:]\._+-]*\),/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib/\1,g' \
				     -e "/^dependency_libs=/s,\([[:space:]']\)/opt/OE/build/tmp.1/cross/ppce300c3/lib,\1/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib,g" \
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
			sonamelink=`readelf -d $libfile |grep 'Library soname:' |sed -e 's/.*\[\(.*\)\].*/\1/'`
			solink=`echo $baselibfile | sed -e 's/\.so\..*/.so/'`
			if [ -n "$sonamelink" -a x"$baselibfile" != x"$sonamelink" ]; then
				__runcmd ln -sf $baselibfile $destpath/$sonamelink
			fi
			__runcmd ln -sf $baselibfile $destpath/$solink
		fi
	fi

	__runcmd cd "$olddir"

}

base_do_configure() {
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
	sonamelink=`readelf -d $1 |grep 'Library soname:' |sed -e 's/.*\[\(.*\)\].*/\1/'`
	solink=`echo $libname | sed -e 's/\.so\..*/.so/'`
	ln -sf $libname $2/$sonamelink
	ln -sf $libname $2/$solink

}

do_install() {
	oe_runmake 'DESTDIR=/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image' install

	# Move libgcc_s into /lib
        mkdir -p /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/lib
        if [ -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/lib/libgcc_s.so.? ]; then
                # Already in the right location
                :
        elif [ -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/lib/libgcc_s.so.? ]; then
                mv -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/lib/libgcc_s.so* /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/lib || true

        elif [  -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/*/lib/nof/libgcc_s.so.? ]; then
                mv -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/*/lib/nof/libgcc_s.so* /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/lib
        else
                mv -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/*/lib/libgcc_s.so* /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/lib || true
        fi



	# Move libstdc++ and libg2c into libdir (resetting our prefix to /usr
        mkdir -p /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/usr/lib

        if [ -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/*/lib/nof/libstdc++.so ]; then

           mv -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/*/lib/nof/libstdc++.so* /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/usr/lib || true
           mv -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/*/lib/nof/libg2c.so* /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/usr/lib || true
           mv -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/*/lib/nof/libgfortran*.so* /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/usr/lib || true
           mv -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/*/lib/nof/libssp*.so* /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/usr/lib || true

        else
           mv -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/*/lib/libstdc++.so* /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/usr/lib || true
           mv -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/*/lib/libg2c.so* /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/usr/lib || true
           mv -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/*/lib/libgfortran*.so* /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/usr/lib || true
           mv -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/opt/OE/build/tmp.1/cross/ppce300c3/*/lib/libssp*.so* /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/usr/lib || true
        fi



       # Manually run the target stripper since we won't get it run by
       # the packaging.
       if [ "x" != "x1" ]; then
               powerpc-linux-strip /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/usr/lib/libstdc++.so.*
               powerpc-linux-strip /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/usr/lib/libg2c.so.* || true
               powerpc-linux-strip /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/lib/libgcc_s.so.* || true
               powerpc-linux-strip /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image/usr/lib/libgfortran*.so* || true
	fi

       # Link gfortran to g77 to satisfy not-so-smart configure or hard coded g77
       # gfortran is fully backwards compatible. This is a safe and practical solution.
       if [ -f /opt/OE/build/tmp.1/cross/ppce300c3/bin/powerpc-linux-gfortran ]; then
              currdir="$PWD"
              cd /opt/OE/build/tmp.1/cross/ppce300c3/bin/
              ln -sf powerpc-linux-gfortran powerpc-linux-g77 || true
              cd /opt/OE/build/tmp.1/cross/ppce300c3/powerpc-linux/bin/
              ln -sf gfortran g77 || true
              cd $currdir
       fi
        for i in `find /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image -name "*.la"` ; do \
                sed -i -e '/^dependency_libs=/s,/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5[[:alnum:]/\._+-]*/\([[:alnum:]\._+-]*\),/opt/OE/build/tmp.1/cross/ppce300c3/lib/\1,g' $i
                sed -i -e s:/opt/OE/build/tmp.1/cross/ppce300c3/i686-linux::g $i
                sed -i -e s:/opt/OE/build/tmp.1/cross/ppce300c3::g $i
                sed -i -e s:/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib:/opt/OE/build/tmp.1/cross/ppce300c3/lib:g $i
                sed -i -e s:/opt/OE/build/tmp.1/staging/ppce300c3-linux::g $i
                sed -i -e s:/opt/OE/build/tmp.1/staging::g $i
                sed -i -e s:/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4::g $i
                sed -i -e s:/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp::g $i
                sed -i -e s:/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/image::g $i
        done

}

oenote() {
	echo "NOTE:" "$*"

}

package_update_index_ipk() {
	set -x

	ipkgarchs="all any noarch powerpc  ppce300c3 mpc5121"

	if [ ! -z "${DEPLOY_KEEP_PACKAGES}" ]; then
		return
	fi

	touch /opt/OE/build/tmp.1/deploy/ipk/Packages
	ipkg-make-index -r /opt/OE/build/tmp.1/deploy/ipk/Packages -p /opt/OE/build/tmp.1/deploy/ipk/Packages -l /opt/OE/build/tmp.1/deploy/ipk/Packages.filelist -m /opt/OE/build/tmp.1/deploy/ipk

	for arch in $ipkgarchs; do
		if [ -e /opt/OE/build/tmp.1/deploy/ipk/$arch/ ] ; then
			touch /opt/OE/build/tmp.1/deploy/ipk/$arch/Packages
			ipkg-make-index -r /opt/OE/build/tmp.1/deploy/ipk/$arch/Packages -p /opt/OE/build/tmp.1/deploy/ipk/$arch/Packages -l /opt/OE/build/tmp.1/deploy/ipk/$arch/Packages.filelist -m /opt/OE/build/tmp.1/deploy/ipk/$arch/
		fi
		if [ -e /opt/OE/build/tmp.1/deploy/ipk/i686-$arch-sdk/ ] ; then
			touch /opt/OE/build/tmp.1/deploy/ipk/i686-$arch-sdk/Packages
			ipkg-make-index -r /opt/OE/build/tmp.1/deploy/ipk/i686-$arch-sdk/Packages -p /opt/OE/build/tmp.1/deploy/ipk/i686-$arch-sdk/Packages -l /opt/OE/build/tmp.1/deploy/ipk/i686-$arch-sdk/Packages.filelist -m /opt/OE/build/tmp.1/deploy/ipk/i686-$arch-sdk/
		fi
		if [ -e /opt/OE/build/tmp.1/deploy/ipk/i686-linux-sdk-$arch/ ] ; then
			touch /opt/OE/build/tmp.1/deploy/ipk/i686-linux-sdk-$arch/Packages
			ipkg-make-index -r /opt/OE/build/tmp.1/deploy/ipk/i686-linux-sdk-$arch/Packages -p /opt/OE/build/tmp.1/deploy/ipk/i686-linux-sdk-$arch/Packages -l /opt/OE/build/tmp.1/deploy/ipk/i686-linux-sdk-$arch/Packages.filelist -m /opt/OE/build/tmp.1/deploy/ipk/i686-linux-sdk-$arch/
		fi
	done

}

do_package_write() {
	:

}

package_generate_ipkg_conf() {
	mkdir -p /opt/OE/build/tmp.1/staging/i686-linux/etc/
	echo "src oe file:/opt/OE/build/tmp.1/deploy/ipk" > /opt/OE/build/tmp.1/staging/i686-linux/etc/opkg.conf
	echo "src oe file:/opt/OE/build/tmp.1/deploy/ipk" > /opt/OE/build/tmp.1/staging/i686-linux/etc/opkg-sdk.conf
	echo "src oe file:/opt/OE/build/tmp.1/deploy/ipk" > /opt/OE/build/tmp.1/staging/i686-linux/etc/opkg-canadian-sdk.conf
	ipkgarchs="all any noarch powerpc  ppce300c3 mpc5121"
	priority=1
	for arch in $ipkgarchs; do
		echo "arch $arch $priority" >> /opt/OE/build/tmp.1/staging/i686-linux/etc/opkg.conf
		echo "arch i686-$arch-sdk $priority" >> /opt/OE/build/tmp.1/staging/i686-linux/etc/opkg-sdk.conf
		echo "arch i686-linux-sdk-$arch $priority" >> /opt/OE/build/tmp.1/staging/i686-linux/etc/opkg-canadian-sdk.conf
		priority=$(expr $priority + 5)
		if [ -e /opt/OE/build/tmp.1/deploy/ipk/$arch/Packages ] ; then
		        echo "src oe-$arch file:/opt/OE/build/tmp.1/deploy/ipk/$arch" >> /opt/OE/build/tmp.1/staging/i686-linux/etc/opkg.conf
		fi
		if [ -e /opt/OE/build/tmp.1/deploy/ipk/i686-$arch-sdk/Packages ] ; then
		        echo "src oe-i686-$arch-sdk file:/opt/OE/build/tmp.1/deploy/ipk/i686-$arch-sdk" >> /opt/OE/build/tmp.1/staging/i686-linux/etc/opkg-sdk.conf
		fi
		if [ -e /opt/OE/build/tmp.1/deploy/ipk/i686-linux-sdk-$arch/Packages ] ; then
		        echo "src oe-i686-linux-sdk-$arch file:/opt/OE/build/tmp.1/deploy/ipk/i686-linux-sdk-$arch" >> /opt/OE/build/tmp.1/staging/i686-linux/etc/opkg-canadian-sdk.conf
		fi
	done

}

base_do_fetchall() {
	:

}

staging_packager() {

	mkdir -p /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg/CONTROL
	mkdir -p /opt/OE/build/tmp.1/deploy/pstage/fred/2/.1/-opt-OE-build-tmp.1

	echo "Package: staging-gcc-cross-ppce300c3-linux"         >  /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg/CONTROL/control
	echo "Version: 4.2.4-r5"    >> /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg/CONTROL/control
	echo "Description: The GNU cc and gcc C compilers."      >> /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg/CONTROL/control
	echo "Section: devel"              >> /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg/CONTROL/control
	echo "Priority: Optional"               >> /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg/CONTROL/control
	echo "Maintainer: OpenEmbedded Team <openembedded-devel@lists.openembedded.org>"        >> /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg/CONTROL/control
	echo "Architecture: i686-linux"  >> /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg/CONTROL/control

	# Protect against empty SRC_URI
	if [ "ftp://ftp.gnu.org/gnu/gcc/gcc-4.2.4/gcc-4.2.4.tar.bz2 	file://100-uclibc-conf.patch;patch=1 	file://103-uclibc-conf-noupstream.patch;patch=1 	file://200-uclibc-locale.patch;patch=1 	file://203-uclibc-locale-no__x.patch;patch=1 	file://204-uclibc-locale-wchar_fix.patch;patch=1 	file://205-uclibc-locale-update.patch;patch=1 	file://300-libstdc++-pic.patch;patch=1 	file://301-missing-execinfo_h.patch;patch=1 	file://302-c99-snprintf.patch;patch=1 	file://303-c99-complex-ugly-hack.patch;patch=1 	file://304-index_macro.patch;patch=1 	file://305-libmudflap-susv3-legacy.patch;patch=1 	file://306-libstdc++-namespace.patch;patch=1 	file://307-locale_facets.patch;patch=1 	file://402-libbackend_dep_gcov-iov.h.patch;patch=1 	file://602-sdk-libstdc++-includes.patch;patch=1 	file://740-sh-pr24836.patch;patch=1 	file://800-arm-bigendian.patch;patch=1 	file://801-arm-bigendian-eabi.patch;patch=1 	file://904-flatten-switch-stmt-00.patch;patch=1 	file://arm-nolibfloat.patch;patch=1 	file://arm-softfloat.patch;patch=1 	file://gcc41-configure.in.patch;patch=1 	file://arm-thumb.patch;patch=1 	file://arm-thumb-cache.patch;patch=1 	file://ldflags.patch;patch=1 	file://zecke-xgcc-cpp.patch;patch=1 	file://unbreak-armv4t.patch;patch=1 	file://fix-ICE-in-arm_unwind_emit_set.diff;patch=1 	file://cache-amnesia.patch;patch=1 	file://gfortran.patch;patch=1 	file://gcc-4.0.2-e300c2c3.patch;patch=1 	file://fortran-static-linking.patch;patch=1 	file://intermask-bigendian.patch;patch=1  file://zecke-no-host-includes.patch;patch=1 " != "" ] ; then
		echo "Source: ftp://ftp.gnu.org/gnu/gcc/gcc-4.2.4/gcc-4.2.4.tar.bz2 	file://100-uclibc-conf.patch;patch=1 	file://103-uclibc-conf-noupstream.patch;patch=1 	file://200-uclibc-locale.patch;patch=1 	file://203-uclibc-locale-no__x.patch;patch=1 	file://204-uclibc-locale-wchar_fix.patch;patch=1 	file://205-uclibc-locale-update.patch;patch=1 	file://300-libstdc++-pic.patch;patch=1 	file://301-missing-execinfo_h.patch;patch=1 	file://302-c99-snprintf.patch;patch=1 	file://303-c99-complex-ugly-hack.patch;patch=1 	file://304-index_macro.patch;patch=1 	file://305-libmudflap-susv3-legacy.patch;patch=1 	file://306-libstdc++-namespace.patch;patch=1 	file://307-locale_facets.patch;patch=1 	file://402-libbackend_dep_gcov-iov.h.patch;patch=1 	file://602-sdk-libstdc++-includes.patch;patch=1 	file://740-sh-pr24836.patch;patch=1 	file://800-arm-bigendian.patch;patch=1 	file://801-arm-bigendian-eabi.patch;patch=1 	file://904-flatten-switch-stmt-00.patch;patch=1 	file://arm-nolibfloat.patch;patch=1 	file://arm-softfloat.patch;patch=1 	file://gcc41-configure.in.patch;patch=1 	file://arm-thumb.patch;patch=1 	file://arm-thumb-cache.patch;patch=1 	file://ldflags.patch;patch=1 	file://zecke-xgcc-cpp.patch;patch=1 	file://unbreak-armv4t.patch;patch=1 	file://fix-ICE-in-arm_unwind_emit_set.diff;patch=1 	file://cache-amnesia.patch;patch=1 	file://gfortran.patch;patch=1 	file://gcc-4.0.2-e300c2c3.patch;patch=1 	file://fortran-static-linking.patch;patch=1 	file://intermask-bigendian.patch;patch=1  file://zecke-no-host-includes.patch;patch=1 "               >> /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg/CONTROL/control
	else
		echo "Source: OpenEmbedded"               >> /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg/CONTROL/control
	fi

	stage-manager-ipkg-build -o 0 -g 0 /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg /opt/OE/build/tmp.1/deploy/pstage/fred/2/.1/-opt-OE-build-tmp.1

}

autotools_do_configure() {
	case gcc-cross in
	autoconf*)
	;;
	automake*)
	;;
	*)
		# WARNING: gross hack follows:
		# An autotools built package generally needs these scripts, however only
		# automake or libtoolize actually install the current versions of them.
		# This is a problem in builds that do not use libtool or automake, in the case
		# where we -need- the latest version of these scripts.  e.g. running a build
		# for a package whose autotools are old, on an x86_64 machine, which the old
		# config.sub does not support.  Work around this by installing them manually
		# regardless.
		( for ac in `find /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4 -name configure.in -o -name configure.ac`; do
			rm -f `dirname $ac`/configure
			done )
		if [ -e /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4/configure.in -o -e /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4/configure.ac ]; then
			olddir=`pwd`
			cd /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4
			if [ x"default" = xdefault ]; then
				acpaths=
				for i in `find /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4 -maxdepth 2 -name \*.m4|grep -v 'aclocal.m4'| \
					grep -v 'acinclude.m4' | sed -e 's,\(.*/\).*$,\1,'|sort -u`; do
					acpaths="$acpaths -I $i"
				done
			else
				acpaths="default"
			fi
			AUTOV=`automake --version |head -n 1 |sed "s/.* //;s/\.[0-9]\+$//"`
			automake --version
			echo "AUTOV is $AUTOV"
			install -d /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/share/aclocal
			install -d /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/share/aclocal-$AUTOV
			acpaths="$acpaths -I/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/share/aclocal-$AUTOV -I /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/share/aclocal"
			# autoreconf is too shy to overwrite aclocal.m4 if it doesn't look
			# like it was auto-generated.  Work around this by blowing it away
			# by hand, unless the package specifically asked not to run aclocal.
			if ! echo --exclude=autopoint | grep -q "aclocal"; then
				rm -f aclocal.m4
			fi
			if [ -e configure.in ]; then
			  CONFIGURE_AC=configure.in
			else
			  CONFIGURE_AC=configure.ac
			fi
			if grep "^AM_GLIB_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
			  if grep "sed.*POTFILES" $CONFIGURE_AC >/dev/null; then
			    : do nothing -- we still have an old unmodified configure.ac
			  else
			    oenote Executing glib-gettextize --force --copy
			    echo "no" | glib-gettextize --force --copy
			  fi
			fi
			if grep "^[AI][CT]_PROG_INTLTOOL" $CONFIGURE_AC >/dev/null; then
			  oenote Executing intltoolize --copy --force --automake
			  intltoolize --copy --force --automake
			fi
			oenote Executing autoreconf --verbose --install --force --exclude=autopoint $acpaths
			mkdir -p m4
			autoreconf -Wcross --verbose --install --force --exclude=autopoint $acpaths || oefatal "autoreconf execution failed."
			cd $olddir
		fi
	;;
	esac
	if [ -e /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4/configure ]; then
		oe_runconf $@
	else
		oenote "nothing to configure"
	fi

}

base_do_stage() {
	:

}

autotools_stage_dir() {
	from="$1"
	to="$2"
	# This will remove empty directories so we can ignore them
	rmdir "$from" 2> /dev/null || true
	if [ -d "$from" ]; then
		mkdir -p "$to"
		cp -fpPR "$from"/* "$to"
	fi

}

autotools_stage_all() {
	if [ "${INHIBIT_AUTO_STAGE}" = "1" ]
	then
		return
	fi
	rm -rf /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging
	mkdir -p /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging
	oe_runmake DESTDIR="/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging" install
	autotools_stage_dir /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/include /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include
	if [ "i686-linux" = "i686-linux" ]; then
		autotools_stage_dir /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/bin /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/bin
		autotools_stage_dir /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/bin /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/sbin
		autotools_stage_dir /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/bin /opt/OE/build/tmp.1/staging/ppce300c3-linux/bin
		autotools_stage_dir /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/bin /opt/OE/build/tmp.1/staging/ppce300c3-linux/sbin
		autotools_stage_dir /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/libexec /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/libexec
		if [ "/opt/OE/build/tmp.1/cross/ppce300c3/lib" != "/opt/OE/build/tmp.1/cross/ppce300c3/lib" ]; then
			# python puts its files in here, make sure they are staged as well
			autotools_stage_dir /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/lib /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib
		fi
	fi
	if [ -d /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/lib ]
	then
		olddir=`pwd`
		cd /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/lib
		las=$(find . -name \*.la -type f)
		cd $olddir
		echo "Found la files: $las"
		for i in $las
		do
			sed -e 's/^installed=yes$/installed=no/' \
			    -e '/^dependency_libs=/s,/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5[[:alnum:]/\._+-]*/\([[:alnum:]\._+-]*.la\),/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib/\1,g' \
			    -e '/^dependency_libs=/s,/opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5[[:alnum:]/\._+-]*/\([[:alnum:]\._+-]*\),/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib,g' \
			    -e "/^dependency_libs=/s,\([[:space:]']\)/opt/OE/build/tmp.1/cross/ppce300c3/lib,\1/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib,g" \
			    -i /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/lib/$i
		done
		autotools_stage_dir /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/lib /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib
	fi
	# Ok, this is nasty. pkgconfig.bbclass is usually used to install .pc files,
	# however some packages rely on the presence of .pc files to enable/disable
	# their configurataions in which case we better should not install everything
	# unconditionally, but rather depend on the actual results of make install.
	# The good news though: a) there are not many packages doing this and
	# b) packaged staging will fix that anyways. :M:
	if [ "${AUTOTOOLS_STAGE_PKGCONFIG}" = "1" ]
	then
		if [ -e /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/lib/pkgconfig/ ] ; then
			echo "cp -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/lib/pkgconfig/*.pc /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib/pkgconfig/"
			cp -f /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/lib/pkgconfig/*.pc /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/lib/pkgconfig/
		fi
	fi
	rm -rf /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/share/man || true
	rm -rf /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/share/info || true
	autotools_stage_dir /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging//opt/OE/build/tmp.1/cross/ppce300c3/share /opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/share
	rm -rf /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/temp-staging

}

ldconfig_postinst_fragment() {
if [ x"$D" = "x" ]; then
	if [ -e /etc/ld.so.conf ] ; then
		[ -x /sbin/ldconfig ] && /sbin/ldconfig
	fi
fi

}

do_compile() {
	export CC="ccache gcc "
	export AR_FOR_TARGET="powerpc-linux-ar"
	export RANLIB_FOR_TARGET="powerpc-linux-ranlib"
	export LD_FOR_TARGET="powerpc-linux-ld"
	export NM_FOR_TARGET="powerpc-linux-nm"
	export CC_FOR_TARGET="ccache  powerpc-linux-gcc -mcpu=e300c3"
	base_do_compile

}

staging_helper() {
	# Assemble appropriate opkg.conf
	conffile=/opt/OE/build/tmp.1/deploy/pstage/opkg.conf
	mkdir -p /opt/OE/build/tmp.1/deploy/pstage/pstaging_lists
	if [ ! -e $conffile ]; then
		ipkgarchs="i686-linux"
		priority=1
		for arch in $ipkgarchs; do
			echo "arch $arch $priority" >> $conffile
			priority=$(expr $priority + 5)
		done
		echo "dest root /" >> $conffile
	fi
	if [ ! -e /opt/OE/build/tmp.1/usr/lib/opkg/info/ ]; then
		mkdir -p /opt/OE/build/tmp.1/usr/lib/opkg/info/
	fi
 	if [ ! -e /opt/OE/build/tmp.1/usr/lib/ipkg/ ]; then
		cd /opt/OE/build/tmp.1/usr/lib/
		ln -sf opkg/ ipkg
	fi

}

populate_staging_postamble() {
	if [ "$PSTAGING_ACTIVE" = "1" ]; then
		# list the packages currently installed in staging
		# stage-manager-ipkg -f /opt/OE/build/tmp.1/deploy/pstage/opkg.conf -o /opt/OE/build/tmp.1 list_installed | awk '{print $1}' > /opt/OE/build/tmp.1/deploy/pstage/installed-list

		# exitcode == 5 is ok, it means the files change
		set +e
		stage-manager -p /opt/OE/build/tmp.1/staging -c /opt/OE/build/tmp.1/deploy/pstage/stamp-cache-staging -u -d /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg/staging
		exitcode=$?
		if [ "$exitcode" != "5" -a "$exitcode" != "0" ]; then
			exit $exitcode
		fi
		stage-manager -p /opt/OE/build/tmp.1/cross/ppce300c3 -c /opt/OE/build/tmp.1/deploy/pstage/stamp-cache-cross -u -d /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg/cross
		if [ "$exitcode" != "5" -a "$exitcode" != "0" ]; then
			exit $exitcode
		fi
		set -e
	fi

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

oe_runmake() {
	if [ x"$MAKE" = x ]; then MAKE=make; fi
	oenote make  ARCH_FLAGS_FOR_TARGET='-mcpu=e300c3 -isystem/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include' "$@"
	make  ARCH_FLAGS_FOR_TARGET='-mcpu=e300c3 -isystem/opt/OE/build/tmp.1/staging/ppce300c3-linux/usr/include' "$@" || die "oe_runmake failed"

}

do_package_stage_all() {
	:

}

staging_package_installer() {
	#stage-manager-ipkg -f /opt/OE/build/tmp.1/deploy/pstage/opkg.conf -force-depends -o /opt/OE/build/tmp.1 install /opt/OE/build/tmp.1/deploy/pstage/fred/2/.1/-opt-OE-build-tmp.1/staging-gcc-cross-ppce300c3-linux_4.2.4-r5_i686-linux.ipk

	STATUSFILE=/opt/OE/build/tmp.1/usr/lib/opkg/status
	echo "Package: staging-gcc-cross-ppce300c3-linux"        >> $STATUSFILE
	echo "Version: 4.2.4-r5"   >> $STATUSFILE
	echo "Status: install user installed"  >> $STATUSFILE
	echo "Architecture: i686-linux" >> $STATUSFILE
	echo "" >> $STATUSFILE

	CTRLFILE=/opt/OE/build/tmp.1/usr/lib/opkg/info/staging-gcc-cross-ppce300c3-linux.control
	echo "Package: staging-gcc-cross-ppce300c3-linux"        > $CTRLFILE
	echo "Version: 4.2.4-r5"   >> $CTRLFILE
	echo "Architecture: i686-linux" >> $CTRLFILE

	cd /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/staging-pkg
	find -type f | grep -v ./CONTROL | sed -e 's/^\.//' > /opt/OE/build/tmp.1/usr/lib/opkg/info/staging-gcc-cross-ppce300c3-linux.list

}

oefatal() {
	echo "FATAL:" "$*"
	exit 1

}

MIRRORS() {
ftp://ftp.gnu.org/gnu/gcc/releases/    ftp://gcc.gnu.org/pub/gcc/releases/
ftp://ftp.gnu.org/gnu/gcc/	http://mirrors.rcn.net/pub/sourceware/gcc/releases/
ftp://ftp.gnu.org/gnu/gcc/releases/    http://gcc.get-software.com/releases/
ftp://ftp.gnu.org/gnu/gcc/	http://gcc.get-software.com/releases/
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
ftp://ftp.gnu.org/gnu	ftp://ftp.matrix.com.br/pub/gnu
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


}

cd /opt/OE/build/tmp.1/work/ppce300c3-linux/gcc-cross-4.2.4-r5/gcc-4.2.4/build.i686-linux.powerpc-linux
do_configure

--------------010606050005080700050207--
