Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1PoceN-0001o0-0R
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Feb 2011 15:10:08 +0100
Received: by fxm17 with SMTP id 17so4101339fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Feb 2011 06:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=jZEgZHkQ4QLJMFQzOWoIcWkqlVOAPa3TKEPYlrMp39E=;
	b=U/myqfaxdkUVetEe0O2L1ipbQFiNf6C78cyWZ4GQZtblLePUyJuw8z6XA1S8hYCjz5
	MwVkRO50T4XkcqRKQ1WBxW9wM63NNf6RftYKJ0MeLQGm0M7hNxgrtPJyLKm1czri/uoR
	oGt0nSxTqsnQ+aF2ZBvLxn41lUK2DSR200ZuU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=JHTJvoKCNzHCMJKYdaxRP47cR4CM6qVhn81urUawtFRAWIW/R3NdvW7h37kg72vdUV
	j3fVdYy7wJojOilC0vUTDN0FfRBnFlBJ56wkERpQCqFDrSd2sR6rv9lqKbxfwIqY6tnP
	xc9JQf2/j3euBYpopBhNwue049nSh8bHNfH9g=
Received: by 10.223.96.67 with SMTP id g3mr2267397fan.114.1297606138642;
	Sun, 13 Feb 2011 06:08:58 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id 5sm594086fak.23.2011.02.13.06.08.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 13 Feb 2011 06:08:57 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Feb 2011 15:08:52 +0100
Message-Id: <1297606132-19861-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] linux-firmware: split into bus specific packages.
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
X-List-Received-Date: Sun, 13 Feb 2011 14:10:08 -0000

The whole reposotiry is about 24MB in size and it's rarely needed
whole. It is now splitted into bus specific subpackages (and some
device-specific for devices on a bus like SPI or SBUS) all depended
on by the linux-firmware package.

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 recipes/linux-firmware/linux-firmware_git.bb |  144 +++++++++++++++++++++++++-
 1 files changed, 142 insertions(+), 2 deletions(-)

diff --git a/recipes/linux-firmware/linux-firmware_git.bb b/recipes/linux-firmware/linux-firmware_git.bb
index 7bff379..1b22c79 100644
--- a/recipes/linux-firmware/linux-firmware_git.bb
+++ b/recipes/linux-firmware/linux-firmware_git.bb
@@ -1,7 +1,8 @@
 DESCRIPTION = "Firmware files for use with Linux kernel"
 
+PR = "r1"
 PR_append = "+gitr${SRCREV}"
-SRCREV = "80a203275fc368db0a5f166c42dd35a4a22f2453"
+SRCREV = "2fab48391fda8a914b55c8ac265eb3b6ee10ace8"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/dwmw2/linux-firmware.git;protocol=git"
 
@@ -16,7 +17,146 @@ do_install() {
 	cp -RpP * ${D}/lib/firmware/
 }
 
-FILES_${PN} += "/lib/firmware/*"
+SUBPACKAGES = "${PN}-i2c \
+	${PN}-isa \
+	${PN}-pci \
+	${PN}-pcmcia \
+	${PN}-sdio \
+	${PN}-usb \
+	${PN}-agere \
+	${PN}-dsp56k \
+	${PN}-gspi8682 \
+	${PN}-gspi8686 \
+	${PN}-gspi8688 \
+	${PN}-myri-sbus \
+	${PN}-qlogicpti \
+	${PN}-wl12xx \
+	${PN}-yam"
+
+RDEPENDS += "${SUBPACKAGES}"
+PACKAGES += "${SUBPACKAGES}"
+
 PACKAGE_ARCH = "all"
 
+RDEPENDS_${PN}-pci += "${PN}-agere ${PN}-i2c"
+RDEPENDS_${PN}-pcmcia += "${PN}-agere"
+RDEPENDS_${PN}-sdio += "${PN}-gspi8686 ${PN}-wl12xx"
+RDEPENDS_${PN}-usb += "${PN}-agere ${PN}-i2c"
+
+
+FILES_${PN}-i2c = "/lib/firmware/dvb-fe-xc5000-1.6.114.fw \
+	/lib/firmware/lgs8g75.fw"
+
+FILES_${PN}-isa = "/lib/firmware/sb16 \
+	/lib/firmware/tr_smctr.bin \
+	/lib/firmware/yamaha/yss225_registers.bin"
+
+FILES_${PN}-pci = "/lib/firmware/3com \
+	/lib/firmware/RTL8192E \
+	/lib/firmware/acenic \
+	/lib/firmware/adaptec \
+	/lib/firmware/advansys \
+	/lib/firmware/atmsar11.fw \
+	/lib/firmware/av7110 \
+	/lib/firmware/bnx2 \
+	/lib/firmware/bnx2x*.fw \
+	/lib/firmware/brcm/bcm43xx*.fw \
+	/lib/firmware/cxgb3 \
+	/lib/firmware/e100 \
+	/lib/firmware/ess/maestro3_*.fw \
+	/lib/firmware/intelliport2.bin \
+	/lib/firmware/iwlwifi-*.ucode \
+	/lib/firmware/korg/k1212.dsp \
+	/lib/firmware/matrox \
+	/lib/firmware/mwl8335_duplex.fw \
+	/lib/firmware/mwl8k \
+	/lib/firmware/phanfw.bin \
+	/lib/firmware/ql2*_fw.bin \
+	/lib/firmware/qlogic/1040.bin \
+	/lib/firmware/qlogic/12160.bin \
+	/lib/firmware/qlogic/1280.bin \
+	/lib/firmware/qlogic/sd7220.fw \
+	/lib/firmware/r128 \
+	/lib/firmware/radeon \
+	/lib/firmware/rt2561.bin \
+	/lib/firmware/rt2561s.bin \
+	/lib/firmware/rt2661.bin \
+	/lib/firmware/rt2860.bin \
+	/lib/firmware/rt3090.bin \
+	/lib/firmware/rtl_nic/rtl8168d-*.fw \
+	/lib/firmware/rtlwifi/rtl8192defw.bin \
+	/lib/firmware/rtlwifi/rtl8192sefw.bin \
+	/lib/firmware/slicoss \
+	/lib/firmware/sun/cassini.bin \
+	/lib/firmware/sxg \
+	/lib/firmware/tehuti \
+	/lib/firmware/tigon/tg3*.bin \
+	/lib/firmware/tlg2300_firmware.bin \
+	/lib/firmware/v4l-cx23418-*.fw \
+	/lib/firmware/v4l-cx23885-*.fw \
+	/lib/firmware/v4l-cx25840.fw \
+	/lib/firmware/vxge/X3fw*.ncf \
+	/lib/firmware/yamaha/ds1*.fw"
+
+FILES_${PN}-pcmcia = "/lib/firmware/cis \
+	/lib/firmware/libertas/cf8385*.bin \
+	/lib/firmware/ositech/Xilinx7OD.bin"
+
+FILES_${PN}-sdio = "/lib/firmware/brcm/bcm4329-fullmac-4-218-248-5.bin \
+	/lib/firmware/libertas/sd*.bin"
+
+FILES_${PN}-usb ="/lib/firmware/ar7010.fw \
+	/lib/firmware/ar7010_1_1.fw \
+	/lib/firmware/ar9170-*.fw \
+	/lib/firmware/ar9271.fw \
+	/lib/firmware/ath3k-*.fw \
+	/lib/firmware/cpia2 \
+	/lib/firmware/dabusb \
+	/lib/firmware/dvb-usb-dib0700-1.20.fw \
+	/lib/firmware/edgeport \
+	/lib/firmware/emi26 \
+	/lib/firmware/emi62 \
+	/lib/firmware/f2255usb.bin \
+	/lib/firmware/i2400m-fw-usb-*.sbcf \
+	/lib/firmware/i6050-fw-usb-1.5.sbcf \
+	/lib/firmware/kaweth \
+	/lib/firmware/keyspan \
+	/lib/firmware/keyspan_pda \
+	/lib/firmware/libertas/usb*.bin \
+	/lib/firmware/mts_*.fw \
+	/lib/firmware/rt2870.bin \
+	/lib/firmware/rt3070.bin \
+	/lib/firmware/rt3071.bin \
+	/lib/firmware/rt73.bin \
+	/lib/firmware/rtlwifi/rtl8192cfw.bin \
+	/lib/firmware/rtlwifi/rtl8192cufw.bin \
+	/lib/firmware/rtlwifi/rtl8712u.bin \
+	/lib/firmware/s2250*.fw \
+	/lib/firmware/ti_3410.fw \
+	/lib/firmware/ti_5052.fw \
+	/lib/firmware/ttusb-budget \	
+	/lib/firmware/ueagle-atm \
+	/lib/firmware/usbdux_firmware.bin \
+	/lib/firmware/usbduxfast_firmware.bin \
+	/lib/firmware/v4l-cx231xx-avcore-01.fw \
+	/lib/firmware/vicam/firmware.fw \
+	/lib/firmware/vntwusb.fw \
+	/lib/firmware/whiteheat*.fw"
+
+FILES_${PN}-agere = "/lib/firmware/agere_*_fw.bin"
+
+FILES_${PN}-dsp56k = "/lib/firmware/dsp56k/bootstrap.bin"
+
+FILES_${PN}-gspi8682 = "/lib/firmware/libertas/gspi8682*.bin"
+
+FILES_${PN}-gspi8686 = "/lib/firmware/libertas/gspi8686*.bin"
+
+FILES_${PN}-gspi8688 = "/lib/firmware/libertas/gspi8688*.bin" 
+
+FILES_${PN}-myri-sbus = "/lib/firmware/myricom/lanai.bin"
+
+FILES_${PN}-qlogicpti = "/lib/firmware/qlogic/isp1000.bin"
+
+FILES_${PN}-wl12xx = "/lib/firmware/ti-connectivity/wl1271-*.bin"
 
+FILES_${PN}-yam = "/lib/firmware/yam"
-- 
1.7.1



