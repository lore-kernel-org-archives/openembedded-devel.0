Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HJCS5-0006l4-IF
	for openembedded-devel@openembedded.org; Mon, 19 Feb 2007 18:37:25 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l1JHbIox030919 for <openembedded-devel@openembedded.org>;
	Mon, 19 Feb 2007 18:37:18 +0100
Message-ID: <45D9E04D.1050502@dominion.kabel.utwente.nl>
Date: Mon, 19 Feb 2007 18:37:17 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <9e4733910702190810q496633c3gd782939046599a02@mail.gmail.com>
In-Reply-To: <9e4733910702190810q496633c3gd782939046599a02@mail.gmail.com>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Adding Ralink rt2x00 CVS to openembedded
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
X-List-Received-Date: Mon, 19 Feb 2007 17:37:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jon Smirl schreef:
> Ralink makes 802.11 wireless adapters. The dscape version of this has
> not been merged into the main kernel yet so I need to use CVS to fetch
> it. The CVS repository builds modules for five different adapters
> simultaneously. How do I set the bitbake file up to make these
> independently installable?
> 
> This doesn't work, when I try to include rt73usb into the slugosbe
> image make says it can't find rt73usb.

Could you attach it to http://bugs.openembedded.org please?

regards,

Koen


> file: rt2570_cvs.bb
> 
> DESCRIPTION = "Driver for Ralink rt2570 USB 802.11g WiFi sticks"
> HOMEPAGE = "http://rt2x00.serialmonkey.com/"
> SECTION = "kernel/modules"
> LICENSE = "GPL"
> 
> SRC_URI = "cvs://anonymous@rt2400.cvs.sourceforge.net/cvsroot/rt2400;module=source/rt2x00;method=pserver"
> 
> inherit module
> 
> PV = "cvs${SRCDATE}"
> S = "${WORKDIR}/rt2x00/"
> 
> EXTRA_OEMAKE = "KERNDIR=${STAGING_KERNEL_DIR}"
> 
> NET_MODULES = "80211 crc-itu-t eeprom_93cx6 rc80211_simple rt2400pci
> rt2500pci rt2500usb rt61pci rt73usb"
> 
> do_install() {
>        install -d ${D}${base_libdir}/modules/${KERNEL_VERSION}/net
>        for i in ${NET_MODULES}
>        do
>                install -m 0644 $i${KERNEL_OBJECT_SUFFIX}
> ${D}${base_libdir}/modules/${KERNEL_VERSION}/net/
>        done
> }
> 
> PACKAGES = "rt2400pci rt2500pci rt2500usb rt61pci rt73usb ralink-base"
> FILES_ralink-base =
> "${D}${base_libdir}/modules/${KERNEL_VERSION}/net/80211${KERNEL_OBJECT_SUFFIX}"
> FILES_ralink-base +=
> "${D}${base_libdir}/modules/${KERNEL_VERSION}/net/crc-itu-t${KERNEL_OBJECT_SUFFIX}"
> FILES_ralink-base +=
> "${D}${base_libdir}/modules/${KERNEL_VERSION}/net/eeprom_93cx6${KERNEL_OBJECT_SUFFIX}"
> FILES_ralink-base +=
> "${D}${base_libdir}/modules/${KERNEL_VERSION}/net/rc80211_simple${KERNEL_OBJECT_SUFFIX}"
> 
> FILES_rt2400pci =
> "${D}${base_libdir}/modules/${KERNEL_VERSION}/net/rt2400pci${KERNEL_OBJECT_SUFFIX}"
> FILES_rt2500pci =
> "${D}${base_libdir}/modules/${KERNEL_VERSION}/net/rt2500pci${KERNEL_OBJECT_SUFFIX}"
> FILES_rt2500usb =
> "${D}${base_libdir}/modules/${KERNEL_VERSION}/net/rt2500usb${KERNEL_OBJECT_SUFFIX}"
> FILES_rt61pci =
> "${D}${base_libdir}/modules/${KERNEL_VERSION}/net/rt61pci${KERNEL_OBJECT_SUFFIX}"
> FILES_rt73usb =
> "${D}${base_libdir}/modules/${KERNEL_VERSION}/net/rt73usb${KERNEL_OBJECT_SUFFIX}"
> 
> RDEPENDS_ralink-base = "kernel-module-ecb kernel-module-arc4"
> RDEPENDS_rt2400pci  = "ralink-base (${PV})"
> RDEPENDS_rt2500pci  = "ralink-base (${PV})"
> RDEPENDS_rt2500usb = "ralink-base (${PV})"
> RDEPENDS_rt61pci  = "ralink-base (${PV})"
> RDEPENDS_rt73usb  = "ralink-base (${PV}) rt73-firmware"
> 
> 
> file: rt73-firmware_1.8.bb
> 
> DESCRIPTION = "Firmware for Ralink rt2570 USB 802.11g WiFi sticks"
> HOMEPAGE = "http://rt2x00.serialmonkey.com/"
> SECTION = "lib/firmware"
> LICENSE = "unknown"
> 
> SRC_URI = "http://www.ralinktech.com.tw/data/RT71W_Firmware_V1.8.zip"
> 
> PV = "R1.8"
> S = "${WORKDIR}"
> 
> do_install() {
>        install -d ${D}${base_libdir}/firmware/
>        install -m 0755 ${WORKDIR}/RT71W_Firmware_V1.8/rt73.bin
> ${D}${base_libdir}/firmware/rt73.bin
> }
> 
> PACKAGE_ARCH = "all"
> FILES_${PN} += "${base_libdir}/firmware/rt73.bin"
> 
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF2eBNMkyGM64RGpERArCNAKCzVOSZwYV4Ttf1iV2Am7nVecjsZACfTyNM
giRCb0LkTfLcDyiL6m1P1Ps=
=+O5c
-----END PGP SIGNATURE-----


