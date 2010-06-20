Received: from mailslv1.informatik.hu-berlin.de ([141.20.20.51])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <oepen@informatik.hu-berlin.de>) id 1OQQTm-0002xX-Vu
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jun 2010 21:46:58 +0200
Received: from [192.168.1.105] (g231205239.adsl.alicedsl.de [92.231.205.239])
	(authenticated bits=0) by mailslv1.informatik.hu-berlin.de
	(8.14.2+Sun/8.14.2/INF-2.0-MA-SOLARIS-2.10-26) with ESMTP id
	o5KJTvZb012736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 20 Jun 2010 21:29:58 +0200 (CEST)
Message-ID: <4C1E6C35.5090706@informatik.hu-berlin.de>
Date: Sun, 20 Jun 2010 21:29:57 +0200
From: Dominik Oepen <oepen@informatik.hu-berlin.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100423 Lightning/1.0b2pre Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.0.1
OpenPGP: id=0AA90D54
X-Virus-Scanned: clamav-milter 0.96 at sigma
X-Virus-Status: Clean
X-SA-Exim-Connect-IP: 141.20.20.51
X-SA-Exim-Mail-From: oepen@informatik.hu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: New recipe for pcsc-lite 1.6.1 and ccid 1.3.13
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
X-List-Received-Date: Sun, 20 Jun 2010 19:47:05 -0000
X-Groupsio-MsgNum: 20297
Content-Type: multipart/mixed; boundary="------------010000040504040606070202"

--------------010000040504040606070202
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi,

thanks for developing OpenEmbedded.

I have updated the recipes for pcsc-lite and ccid to the latest
versions. I only had to edit the SRC_URI and checksums of the existing
recipes. The recipes were tested with SHR on the Openmoko Neo FreeRunner.

Best regards,
Dominik

--------------010000040504040606070202
Content-Type: text/plain;
 name="ccid_1.3.13.bb"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="ccid_1.3.13.bb"

DESCRIPTION = "Generic USB CCID smart card reader driver"
HOMEPAGE = "http://pcsclite.alioth.debian.org/ccid.html"
LICENSE = "GPL"
PR = "r0"

DEPENDS = "virtual/libusb0 pcsc-lite"
RDEPENDS = "pcsc-lite"

SRC_URI = "http://alioth.debian.org/download.php/3300/ccid-${PV}.tar.bz2"

inherit autotools

EXTRA_OECONF = "--enable-udev"

do_install_append () {
	install -d "${D}/etc/udev/rules.d"
	install -m 644 "${S}/src/pcscd_ccid.rules" "${D}/etc/udev/rules.d/85-pcscd_ccid.rules"
}

FILES_${PN} += "${libdir}/pcsc/"
FILES_${PN}-dbg += "${libdir}/pcsc/drivers/*/*/*/.debug"

SRC_URI[md5sum] = "275360cb253299b763e1122adf847265"
SRC_URI[sha256sum] = "f797b08874c1f9b2b4afe4ada8ef3400ce4da6bf965a24a6cf7f29d82cbf8c53"

--------------010000040504040606070202
Content-Type: text/plain;
 name="pcsc-lite_1.6.1.bb"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="pcsc-lite_1.6.1.bb"

DESCRIPTION = "PC/SC Lite smart card framework and applications"
HOMEPAGE = "http://pcsclite.alioth.debian.org/"
LICENSE = "BSD"

DEPENDS = "hal"
RDEPENDS_${PN} = "hal"

SRC_URI = "https://alioth.debian.org/frs/download.php/3298/pcsc-lite-${PV}.tar.bz2 \
           file://pcscd.init "

inherit autotools_stage update-rc.d

INITSCRIPT_NAME = "pcscd"
INITSCRIPT_PARAMS = "defaults"

EXTRA_OECONF = " \
	--enable-libhal \
	--disable-libusb \
	--enable-usbdropdir=${libdir}/pcsc/drivers \
	"

do_install() {
	oe_runmake DESTDIR="${D}" install
	install -d "${D}/etc/init.d"
	install -m 755 "${WORKDIR}/pcscd.init" "${D}/etc/init.d/pcscd"
}

PACKAGES =+ "libpcsclite"

FILES_libpcsclite = "${libdir}/libpcsclite.so.*"

SRC_URI[md5sum] = "ed023be61feebfafce12e86075912695"
SRC_URI[sha256sum] = "7094e8aefbf62f46fbcc2da11865a9730675cdceb0b3663f03a65ce65eedc91c"

--------------010000040504040606070202--
