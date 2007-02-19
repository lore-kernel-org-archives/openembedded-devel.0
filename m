Received: from [66.249.90.178] (helo=ik-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <jonsmirl@gmail.com>) id 1HJB5r-0002eW-SW
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Feb 2007 17:10:23 +0100
Received: by ik-out-1112.google.com with SMTP id b32so91316ika
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Feb 2007 08:10:23 -0800 (PST)
Received: by 10.114.13.1 with SMTP id 1mr2958912wam.1171901421690;
	Mon, 19 Feb 2007 08:10:21 -0800 (PST)
Received: by 10.114.195.13 with HTTP; Mon, 19 Feb 2007 08:10:21 -0800 (PST)
Message-ID: <9e4733910702190810q496633c3gd782939046599a02@mail.gmail.com>
Date: Mon, 19 Feb 2007 11:10:21 -0500
From: "Jon Smirl" <jonsmirl@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Adding Ralink rt2x00 CVS to openembedded
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
X-List-Received-Date: Mon, 19 Feb 2007 16:10:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Ralink makes 802.11 wireless adapters. The dscape version of this has
not been merged into the main kernel yet so I need to use CVS to fetch
it. The CVS repository builds modules for five different adapters
simultaneously. How do I set the bitbake file up to make these
independently installable?

This doesn't work, when I try to include rt73usb into the slugosbe
image make says it can't find rt73usb.


file: rt2570_cvs.bb

DESCRIPTION = "Driver for Ralink rt2570 USB 802.11g WiFi sticks"
HOMEPAGE = "http://rt2x00.serialmonkey.com/"
SECTION = "kernel/modules"
LICENSE = "GPL"

SRC_URI = "cvs://anonymous@rt2400.cvs.sourceforge.net/cvsroot/rt2400;module=source/rt2x00;method=pserver"

inherit module

PV = "cvs${SRCDATE}"
S = "${WORKDIR}/rt2x00/"

EXTRA_OEMAKE = "KERNDIR=${STAGING_KERNEL_DIR}"

NET_MODULES = "80211 crc-itu-t eeprom_93cx6 rc80211_simple rt2400pci
rt2500pci rt2500usb rt61pci rt73usb"

do_install() {
       install -d ${D}${base_libdir}/modules/${KERNEL_VERSION}/net
       for i in ${NET_MODULES}
       do
               install -m 0644 $i${KERNEL_OBJECT_SUFFIX}
${D}${base_libdir}/modules/${KERNEL_VERSION}/net/
       done
}

PACKAGES = "rt2400pci rt2500pci rt2500usb rt61pci rt73usb ralink-base"
FILES_ralink-base =
"${D}${base_libdir}/modules/${KERNEL_VERSION}/net/80211${KERNEL_OBJECT_SUFFIX}"
FILES_ralink-base +=
"${D}${base_libdir}/modules/${KERNEL_VERSION}/net/crc-itu-t${KERNEL_OBJECT_SUFFIX}"
FILES_ralink-base +=
"${D}${base_libdir}/modules/${KERNEL_VERSION}/net/eeprom_93cx6${KERNEL_OBJECT_SUFFIX}"
FILES_ralink-base +=
"${D}${base_libdir}/modules/${KERNEL_VERSION}/net/rc80211_simple${KERNEL_OBJECT_SUFFIX}"

FILES_rt2400pci =
"${D}${base_libdir}/modules/${KERNEL_VERSION}/net/rt2400pci${KERNEL_OBJECT_SUFFIX}"
FILES_rt2500pci =
"${D}${base_libdir}/modules/${KERNEL_VERSION}/net/rt2500pci${KERNEL_OBJECT_SUFFIX}"
FILES_rt2500usb =
"${D}${base_libdir}/modules/${KERNEL_VERSION}/net/rt2500usb${KERNEL_OBJECT_SUFFIX}"
FILES_rt61pci =
"${D}${base_libdir}/modules/${KERNEL_VERSION}/net/rt61pci${KERNEL_OBJECT_SUFFIX}"
FILES_rt73usb =
"${D}${base_libdir}/modules/${KERNEL_VERSION}/net/rt73usb${KERNEL_OBJECT_SUFFIX}"

RDEPENDS_ralink-base = "kernel-module-ecb kernel-module-arc4"
RDEPENDS_rt2400pci  = "ralink-base (${PV})"
RDEPENDS_rt2500pci  = "ralink-base (${PV})"
RDEPENDS_rt2500usb = "ralink-base (${PV})"
RDEPENDS_rt61pci  = "ralink-base (${PV})"
RDEPENDS_rt73usb  = "ralink-base (${PV}) rt73-firmware"


file: rt73-firmware_1.8.bb

DESCRIPTION = "Firmware for Ralink rt2570 USB 802.11g WiFi sticks"
HOMEPAGE = "http://rt2x00.serialmonkey.com/"
SECTION = "lib/firmware"
LICENSE = "unknown"

SRC_URI = "http://www.ralinktech.com.tw/data/RT71W_Firmware_V1.8.zip"

PV = "R1.8"
S = "${WORKDIR}"

do_install() {
       install -d ${D}${base_libdir}/firmware/
       install -m 0755 ${WORKDIR}/RT71W_Firmware_V1.8/rt73.bin
${D}${base_libdir}/firmware/rt73.bin
}

PACKAGE_ARCH = "all"
FILES_${PN} += "${base_libdir}/firmware/rt73.bin"


-- 
Jon Smirl
jonsmirl@gmail.com


