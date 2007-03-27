Received: from [62.70.27.18] (helo=esparsett.troll.no)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <lpotter@trolltech.com>) id 1HWI3i-0000ga-TL
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Mar 2007 22:14:23 +0200
Received: from esparsett.troll.no (localhost [127.0.0.1])
	by localhost (Postfix) with SMTP id 0AA3C60061
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2007 22:14:22 +0200 (CEST)
Received: from mail.trolltech.com.au (unknown [10.1.1.12])
	by esparsett.troll.no (Postfix) with ESMTP id BC4DC60032
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2007 22:14:20 +0200 (CEST)
Received: from [172.18.1.2] (unknown [172.18.1.2])
	by mail.trolltech.com.au (Postfix) with ESMTP id 22A452FBEE3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2007 06:14:18 +1000 (EST)
Message-ID: <46097B18.3050901@trolltech.com>
Date: Wed, 28 Mar 2007 06:14:16 +1000
From: Lorn Potter <lpotter@trolltech.com>
User-Agent: Thunderbird 2.0b1 (X11/20061206)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: org.openembedded.dev fixes
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
X-List-Received-Date: Tue, 27 Mar 2007 20:14:23 -0000
Content-Type: multipart/mixed; boundary="------------080400010809050206030907"

--------------080400010809050206030907
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

* file needs a version update to 4.19 (4.17 doesn't exist)
* tslib needs url update and svn.bb as well

files attached.


oh and linux-hotplug fails at this:

age/etc/hotplug.d/default/default.hotplug
| for F in etc/hotplug/{*.{agent,rc},hotplug.functions} ; do \
|           install $F 
/projects/Embedded/oe/build/tmp/work/armv5te-linux-gnueabi/linux-hotplug-20040920-r8/image/etc/hotplug 
; \
|           done
| install: cannot stat `etc/hotplug/{*.{agent,rc},hotplug.functions}': 
No such file or directory


This line seems to be the offending one:
  install -d 
/projects/Embedded/oe/build/tmp/work/armv5te-linux-gnueabi/linux-hotplug-20040920-r8/image/etc/hotplug/{usb,pci}

(on my machine, it creates one directory that is named: /{usb,pci}

Ideas how to fix?

-- 
Lorn 'ljp' Potter
Software Engineer, Systems Group, MES, Trolltech
DESCRIPTION = "File attempts to classify files depending \
on their contents and prints a description if a match is found."
SECTION = "console/utils"
LICENSE = "BSD-ADV"
DEPENDS = "file-native"

SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz"
S = "${WORKDIR}/file-${PV}"

inherit autotools 

do_configure_prepend() {
	sed -i -e 's,$(top_builddir)/src/file,file,' ${S}/magic/Makefile.am
}

do_stage() {
	autotools_stage_all
}
include file_${PV}.bb
inherit native

# avoid dependency loop
DEPENDS = ""
PR = "r1"

SRC_URI += "file://native-fix.diff;patch=1"
SECTION = "base"
DESCRIPTION = "tslib is a touchscreen access library."
#PV = ""
PR = "r1"

SRC_URI_OVERRIDES_PACKAGE_ARCH = "0"
PACKAGE_ARCH_tslib-conf = "${MACHINE_ARCH}"
PACKAGE_ARCH_mnci = "${MACHINE_ARCH}"
SRC_URI = "http://download.berlios.de/tslib/tslib-1.0.tar.bz2 \
	   file://ts.conf file://ts-2.6.conf \
	   file://ts.conf-h3600-2.4 file://ts.conf-simpad-2.4 \
           file://ts.conf-corgi-2.4 file://ts.conf-collie-2.4 \
	   file://tslib.sh"
SRC_URI_append_mnci += " file://devfs.patch;patch=1"
SRC_URI_append_mnci += " file://event1.patch;patch=1"
S = "${WORKDIR}/tslib-${PV}"
LICENSE = "LGPL"
CONFFILES_${PN} = "${sysconfdir}/ts.conf"

inherit autotools pkgconfig

PACKAGES = "tslib-conf libts libts-dev tslib-tests tslib-calibrate"
EXTRA_OECONF        = "--enable-shared"
EXTRA_OECONF_mnci   = "--enable-shared --disable-h3600 --enable-input --disable-corgi --disable-collie --disable-mk712 --disable-arctic2 --disable-ucb1x00 "
EXTRA_OECONF_beagle = "--enable-shared --enable-h3600 --disable-input --disable-corgi --disable-collie --disable-mk712 --disable-arctic2 --disable-ucb1x00 "

do_stage () {
autotools_stage_all
}

do_install_prepend () {
	install -m 0644 ${WORKDIR}/ts.conf ${S}/etc/ts.conf
}

do_install_append() {
	install -d ${D}${sysconfdir}/profile.d/
	install -m 0755 ${WORKDIR}/tslib.sh ${D}${sysconfdir}/profile.d/
	case ${MACHINE} in
	h3600 | h3900 | h1940 | h6300 | h2200 | ipaq-pxa270 | blueangel)
		install -d ${D}${datadir}/tslib
		for f in ts-2.6.conf ts.conf-h3600-2.4; do
			install -m 0644 ${WORKDIR}/$f ${D}${datadir}/tslib/
		done
		rm -f ${D}${sysconfdir}/ts.conf
		;;
	c7x0 | spitz | akita | tosa )
		install -d ${D}${datadir}/tslib
		for f in ts-2.6.conf ts.conf-corgi-2.4; do
			install -m 0644 ${WORKDIR}/$f ${D}${datadir}/tslib/
		done
		rm -f ${D}${sysconfdir}/ts.conf
		;;
	collie | poodle )
		install -d ${D}${datadir}/tslib
		for f in ts-2.6.conf ts.conf-collie-2.4; do
			install -m 0644 ${WORKDIR}/$f ${D}${datadir}/tslib/
		done
		rm -f ${D}${sysconfdir}/ts.conf
		;;

	simpad )
		install -d ${D}${datadir}/tslib
		for f in ts-2.6.conf ts.conf-simpad-2.4; do
			install -m 0644 ${WORKDIR}/$f ${D}${datadir}/tslib/
		done
		rm -f ${D}${sysconfdir}/ts.conf
		;;
	*)
		;;
	esac
}

RDEPENDS_libts = "tslib-conf"

FILES_tslib-conf = "${sysconfdir}/ts.conf ${sysconfdir}/profile.d/tslib.sh ${datadir}/tslib"
FILES_libts = "${libdir}/*.so.* ${libdir}/ts/*.so*"
FILES_libts-dev = "${FILES_tslib-dev}"
FILES_tslib-calibrate += "${bindir}/ts_calibrate"
FILES_tslib-tests = "${bindir}/ts_harvest ${bindir}/ts_print ${bindir}/ts_print_raw ${bindir}/ts_test"
SECTION = "base"
DESCRIPTION = "tslib is a touchscreen access library."
PV = "0.0+cvs${SRCDATE}"
PR = "r33"

SRC_URI_OVERRIDES_PACKAGE_ARCH = "0"
PACKAGE_ARCH_tslib-conf = "${MACHINE_ARCH}"
PACKAGE_ARCH_mnci = "${MACHINE_ARCH}"
SRC_URI = "svn://svn.berlios.de/tslib/trunk/tslib;module=tslib;proto=http \
	   file://ts.conf file://ts-2.6.conf \
	   file://ts.conf-h3600-2.4 file://ts.conf-simpad-2.4 \
           file://ts.conf-corgi-2.4 file://ts.conf-collie-2.4 \
	   file://tslib.sh"
SRC_URI_append_mnci += " file://devfs.patch;patch=1"
SRC_URI_append_mnci += " file://event1.patch;patch=1"
S = "${WORKDIR}/tslib"
LICENSE = "LGPL"
CONFFILES_${PN} = "${sysconfdir}/ts.conf"

inherit autotools pkgconfig

PACKAGES = "tslib-conf libts libts-dev tslib-tests tslib-calibrate"
EXTRA_OECONF        = "--enable-shared"
EXTRA_OECONF_mnci   = "--enable-shared --disable-h3600 --enable-input --disable-corgi --disable-collie --disable-mk712 --disable-arctic2 --disable-ucb1x00 "
EXTRA_OECONF_beagle = "--enable-shared --enable-h3600 --disable-input --disable-corgi --disable-collie --disable-mk712 --disable-arctic2 --disable-ucb1x00 "

do_stage () {
autotools_stage_all
}

do_install_prepend () {
	install -m 0644 ${WORKDIR}/ts.conf ${S}/etc/ts.conf
}

do_install_append() {
	install -d ${D}${sysconfdir}/profile.d/
	install -m 0755 ${WORKDIR}/tslib.sh ${D}${sysconfdir}/profile.d/
	case ${MACHINE} in
	h3600 | h3900 | h1940 | h6300 | h2200 | ipaq-pxa270 | blueangel)
		install -d ${D}${datadir}/tslib
		for f in ts-2.6.conf ts.conf-h3600-2.4; do
			install -m 0644 ${WORKDIR}/$f ${D}${datadir}/tslib/
		done
		rm -f ${D}${sysconfdir}/ts.conf
		;;
	c7x0 | spitz | akita | tosa )
		install -d ${D}${datadir}/tslib
		for f in ts-2.6.conf ts.conf-corgi-2.4; do
			install -m 0644 ${WORKDIR}/$f ${D}${datadir}/tslib/
		done
		rm -f ${D}${sysconfdir}/ts.conf
		;;
	collie | poodle )
		install -d ${D}${datadir}/tslib
		for f in ts-2.6.conf ts.conf-collie-2.4; do
			install -m 0644 ${WORKDIR}/$f ${D}${datadir}/tslib/
		done
		rm -f ${D}${sysconfdir}/ts.conf
		;;

	simpad )
		install -d ${D}${datadir}/tslib
		for f in ts-2.6.conf ts.conf-simpad-2.4; do
			install -m 0644 ${WORKDIR}/$f ${D}${datadir}/tslib/
		done
		rm -f ${D}${sysconfdir}/ts.conf
		;;
	*)
		;;
	esac
}

RDEPENDS_libts = "tslib-conf"

FILES_tslib-conf = "${sysconfdir}/ts.conf ${sysconfdir}/profile.d/tslib.sh ${datadir}/tslib"
FILES_libts = "${libdir}/*.so.* ${libdir}/ts/*.so*"
FILES_libts-dev = "${FILES_tslib-dev}"
FILES_tslib-calibrate += "${bindir}/ts_calibrate"
FILES_tslib-tests = "${bindir}/ts_harvest ${bindir}/ts_print ${bindir}/ts_print_raw ${bindir}/ts_test"

--------------080400010809050206030907--
