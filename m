Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <slapinid@gmail.com>) id 1ROr1q-0008M2-JI
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 14:20:22 +0100
Received: by wyh5 with SMTP id 5so4100860wyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Nov 2011 05:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=QBUvO1TQ7C0rPEtZb56e5FklXY4c8++4t24YNZufIMs=;
	b=TjLxnfsodiiYLJqJ5oz5eiMI84ENMTWMBaFdK1hikOa8TdyASbgRfEquJyAGiWEaSd
	FfrQ4ZRIIqyJd0h/+Lr8hMMh8GGGemGt0zG2rv+4sE6iOlrg9qLGjcpHIfp5eO2QyocF
	A/tio+/zv5tGPV3DzCkLQ+lCv0p0oyRGkIIys=
MIME-Version: 1.0
Received: by 10.227.208.77 with SMTP id gb13mr8564887wbb.4.1321017244724; Fri,
	11 Nov 2011 05:14:04 -0800 (PST)
Received: by 10.216.3.3 with HTTP; Fri, 11 Nov 2011 05:14:04 -0800 (PST)
Date: Fri, 11 Nov 2011 16:14:04 +0300
Message-ID: <CAFZPMobAtbxhHfAae1eY6ykB=z=uU36SCn5zsxcWbJMAmrTxVg@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: trying to compile recent gpsd (one with scons) with OE
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
X-List-Received-Date: Fri, 11 Nov 2011 13:20:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi, all!

I try to fight scons with OE (actually OE-core, but I think this stuff
is unrelated).

Recipe:
DESCRIPTION = "A TCP/IP Daemon simplifying the communication with GPS devices"
SECTION = "console/network"
PRIORITY = "optional"
LICENSE = "GPL"
DEPENDS = "dbus-glib ncurses python"
PROVIDES = "virtual/gpsd"
INC_PR = "r18"

CCACHE=""
DEPENDS += "libusb1"
SRCREV = "2867071cd2aba0cdd4722eb5a86647eebad8c517"

SRC_URI = "\

git://git.sv.gnu.org/gpsd.git;protocol=git;branch=master \
                        file://0001-Fix-geostar-shows-zero-cootdinates.patch \
                        file://gpsd-default \
                        file://gpsd \
                        file://60-gpsd.rules"

S = "${WORKDIR}/git"

INITSCRIPT_NAME = "gpsd"
INITSCRIPT_PARAMS = "defaults 35"

EXTRA_OESCONS = "\
        dbus_export=true \
        arch=${TARGET_ARCH} \
        dbus=yes \
        python=yes \
        strip=no \
        "

inherit scons2 python-dir

PR = "${INC_PR}.8"

PARALLEL_MAKE = ""

INITSCRIPT_NAME = "gpsd"
INITSCRIPT_PARAMS = "defaults 35"

LDFLAGS += "-L${STAGING_LIBDIR} -lm"
export STAGING_INCDIR
export STAGING_LIBDIR
export PATH

TARGET_CC_ARCH += "${LDFLAGS}"

do_compile_prepend() {
    export CC=${CC}
    export BUILD_SYS="${BUILD_SYS}"
    export HOST_SYS="${HOST_SYS}"
        find ${S} -name "*.so" -exec rm -f {} \;
}

do_install_prepend() {
    export BUILD_SYS="${BUILD_SYS}"
    export HOST_SYS="${HOST_SYS}"
}

do_install_append() {
    install -d ${D}/${sysconfdir}/init.d
    install -m 0755 ${WORKDIR}/gpsd ${D}/${sysconfdir}/init.d/
    install -d ${D}/${sysconfdir}/default
    install -m 0644 ${WORKDIR}/gpsd-default
${D}/${sysconfdir}/default/gpsd.default

    #support for udev
    install -d ${D}/${sysconfdir}/udev/rules.d
    install -m 0644 ${WORKDIR}/60-gpsd.rules ${D}/${sysconfdir}/udev/rules.d
    install -d ${D}${base_libdir}/udev/
    install -m 0755 ${S}/gpsd.hotplug ${D}${base_libdir}/udev/
        sed -i -e 's@^prefix=.*@prefix=/usr@g'
${D}${libdir}/pkgconfdir/libgps.pc
        sed -i -e 's@^prefix=.*@prefix=/usr@g'
${D}${libdir}/pkgconfdir/libgpsd.pc
    install -d ${D}${PYTHON_SITEPACKAGES_DIR}/gps
    install -m 755 ${S}/gps/*.py ${D}${PYTHON_SITEPACKAGES_DIR}/gps
}

pkg_postinst_${PN}-conf() {
        update-alternatives --install ${sysconfdir}/default/gpsd
gpsd-defaults ${sysconfdir}/default/gpsd.default 10
}

pkg_postrm_${PN}-conf() {
        update-alternatives --remove gpsd-defaults
${sysconfdir}/default/gpsd.default
}

PACKAGES =+ "libgps libgpsd python-pygps-dbg python-pygps gpsd-udev
gpsd-conf gpsd-gpsctl gps-utils"

FILES_gpsd-dev += "${libdir}/pkgconfdir/libgpsd.pc
${libdir}/pkgconfdir/libgps.pc"

FILES_python-pygps-dbg += " ${libdir}/python*/site-packages/gps/.debug"

RDEPENDS_${PN} = "gpsd-gpsctl"
RRECOMMENDS_${PN} = "gpsd-conf gpsd-udev"

DESCRIPTION_gpsd-udev = "udev relevant files to use gpsd hotplugging"
FILES_gpsd-udev = "${base_libdir}/* ${sysconfdir}/udev/*"
RDEPENDS_gpsd-udev += "udev gpsd-conf"

DESCRIPTION_libgpsd = "C service library used for communicating with gpsd"
FILES_libgpsd = "${libdir}/libgpsd.so.*"

DESCRIPTION_libgps = "C service library used for communicating with gpsd"
FILES_libgps = "${libdir}/libgps.so.*"

DESCRIPTION_gpsd-conf = "gpsd configuration files and init scripts"
FILES_gpsd-conf = "${sysconfdir}"

DESCRIPTION_gpsd-gpsctl = "Tool for tweaking GPS modes"
FILES_gpsd-gpsctl = "${bindir}/gpsctl"

DESCRIPTION_gps-utils = "Utils used for simulating, monitoring,... a GPS"
FILES_gps-utils = "${bindir}/*"
RDEPENDS_gps-utils = "python-pygps"

DESCRIPTION_python-pygps = "Python bindings to gpsd"
FILES_python-pygps = "${PYTHON_SITEPACKAGES_DIR}"
RDEPENDS_python-pygps = "python-core python-curses gpsd python-json"

scons2.bbclass:
DEPENDS += "python-scons-native"

EXTRA_OESCONS ?= ""

export TARGET_LINK_HASH_STYLE

scons2_do_compile() {
    if [ "${SCONS_FIX_ENV}" = "1" ] ; then
        if grep "toolchain-from-env" ${S}/SConstruct ; then
            echo "Toolchain overrides already applied"
        else
           cat ${STAGING_DATADIR_NATIVE}/scons/toolchain-from-env.SConscript
>> ${S}/SConstruct
        fi
    fi

    ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} CXX="${CXX}"
PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} || \
    oefatal "scons build execution failed."
}

scons2_do_install() {
        install -d ${D}${prefix}
        ${STAGING_BINDIR_NATIVE}/scons PREFIX=${D}${prefix}
prefix=${D}${prefix} install ${EXTRA_OESCONS} || \
        oefatal "scons install execution failed."
}

EXPORT_FUNCTIONS do_compile do_install

Outcome:

ERROR: Function 'do_compile' failed (see
/home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/gpsd-git-r18.8/temp/log.do_compile.20570
for further information)
ERROR: Logfile of failure stored in:
/home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/gpsd-git-r18.8/temp/log.do_compile.20570
Log data follows:
| ERROR: Function 'do_compile' failed (see
/home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/gpsd-git-r18.8/temp/log.do_compile.20570
for further information)
| + cd /home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/gpsd-git-r18.8/git
| + do_compile
| + export BUILD_SYS=i686-linux
| + BUILD_SYS=i686-linux
| + export HOST_SYS=arm-angstrom-linux-gnueabi
| + HOST_SYS=arm-angstrom-linux-gnueabi
| + export 'CC=arm-angstrom-linux-gnueabi-gcc  -march=armv5te
-mno-thumb -mthumb-interwork  -mtune=arm926ej-s -Wl,-O1
-Wl,--hash-style=gnu -Wl,--as-needed
-L/home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/sysroots/crux/usr/lib
-lm -mthumb-interwork -mno-thumb
--sysroot=/home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/sysroots/crux'
| + CC='arm-angstrom-linux-gnueabi-gcc  -march=armv5te  -mno-thumb
-mthumb-interwork  -mtune=arm926ej-s -Wl,-O1 -Wl,--hash-style=gnu
-Wl,--as-needed
-L/home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/sysroots/crux/usr/lib
-lm -mthumb-interwork -mno-thumb
--sysroot=/home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/sysroots/crux'
| + find /home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/gpsd-git-r18.8/git
-name '*.so' -exec rm -f '{}' ';'
| + scons2_do_compile
| + '[' '' = 1 ']'
| + /home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin/scons
'CXX=arm-angstrom-linux-gnueabi-g++  -march=armv5te  -mno-thumb
-mthumb-interwork  -mtune=arm926ej-s -Wl,-O1 -Wl,--hash-style=gnu
-Wl,--as-needed
-L/home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/sysroots/crux/usr/lib
-lm -mthumb-interwork -mno-thumb
--sysroot=/home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/sysroots/crux'
PREFIX=/usr prefix=/usr dbus_export=true arch=arm dbus=yes python=yes
strip=no
| scons: Reading SConscript files ...
| Checking for chrpath... (cached) yes
| Checking whether the C++ compiler works(cached) yes
| Checking for ncurses... (cached) yes
| Checking for libusb-1.0... (cached) yes
| Checking for C library librt... (cached) yes
| Checking for dbus-1... (cached) yes
| Checking for bluez... (cached) yes
| Checking for C header file sys/timepps.h... (cached) no
| You do not have kernel PPS available.
| Checking for C function daemon()... (cached) yes
| Checking for C function strlcpy()... (cached) no
| Checking for C function strlcat()... (cached) no
| Checking for C function clock_gettime()... (cached) yes
| Checking for C library libbluetooth... (cached) yes
| Checking for C library libdbus-1... (cached) yes
| Checking that xsltproc can make man pages... (cached) yes
| Checking for QtNetwork... (cached) no
| Altered configuration variables:
| dbus_export = True (default False): enable DBUS export support
| strip = False (default True): build with stripping of binaries enabled
| prefix = /usr (default /usr/local): installation directory prefix
| scons: done reading SConscript files.
| scons: Building targets ...
| arm-angstrom-linux-gnueabi-gcc -march=armv5te -mno-thumb
-mthumb-interwork -mtune=arm926ej-s -Wl,-O1 -Wl,--hash-style=gnu
-Wl,--as-needed
-L/home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/sysroots/crux/usr/lib
-lm -mthumb-interwork -mno-thumb
--sysroot=/home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/sysroots/crux
-o driver_garmin.os -c -O2 -pipe -g -feliminate-unused-debug-types -O2
-fPIC -I/usr/include/libusb-1.0 driver_garmin.c
| driver_garmin.c:95:20: fatal error: libusb.h: No such file or directory
| compilation terminated.
| scons: *** [driver_garmin.os] Error 1
| scons: building terminated because of errors.
| + oefatal 'scons build execution failed.'
| /home/build1/slave/angstrom_build/build/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/gpsd-git-r18.8/temp/run.do_compile.20570:
line 104: oefatal: command not found
NOTE: package gpsd-git-r18.8: task do_compile: Failed
ERROR: Task 337
(/home/build1/slave/angstrom_build/build/sources/crux/recipes/gpsd/gpsd_git.bb,
do_compile) failed with exit code '1'
Waiting for 1 active tasks to finish:
0: iproute2-3.0.0-r0 do_compile (pid 20703)
Waiting for 2 active tasks to finish:
0: u-boot-crux-1_2011.10+r10+gitrea97184696c7539d51f5fc072124219acc4f937b-r10
do_configure (pid 20706)
1: iproute2-3.0.0-r0 do_compile (pid 20703)
NOTE: package u-boot-crux-1_2011.10+r10+gitrea97184696c7539d51f5fc072124219acc4f937b-r10:
task do_configure: Started
WARNING: u-boot-crux: Recipe file does not have license file
information (LIC_FILES_CHKSUM)
Waiting for 1 active tasks to finish:
0: iproute2-3.0.0-r0 do_compile (pid 20703)
NOTE: package u-boot-crux-1_2011.10+r10+gitrea97184696c7539d51f5fc072124219acc4f937b-r10:
task do_configure: Succeeded
NOTE: package iproute2-3.0.0-r0: task do_compile: Succeeded
ERROR: '/home/build1/slave/angstrom_build/build/sources/crux/recipes/gpsd/gpsd_git.bb'
failed
program finished with exit code 2
elapsedTime=174.306691


libusb.h is where it should be, --sysroot is there.
Other packages build wiithout problems.
Any ideas?

S.


