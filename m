Return-Path: <andrea.adami@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id ACAE16017E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Sep 2014 21:08:43 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id y10so3751855wgg.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Sep 2014 14:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SEvEDXO5pkqP8hdarP6kyLPnX6wW/IfuTt8Jn94FhRE=;
	b=Wo+vkDEssgiJPgn8TnxyA6zvTYSPWxlnIMqEOszVlpXNv22+z9MEVXuGysWXwi/E79
	l4e1oDcue4Eeu3ZS/sXO4VZRGIayRQMdLPNkPCRTh4BZ7R8tQzzpHizYvPaoQFkberCb
	0YgcchxHLAMrGdVQTS7GrzBSy75yhH5Q2GwO8PKs3u2TE62DY0smlDj9N15STbN96Q8G
	AWZVK2EcN3uuCvsSrUHphy08N+AafUk+eRFjYhjYkoJa024aMnL96I9WHJwgw8PUg4mH
	tCk18PselrvjCELcBk9gFR4PIsEd0YF8jRxHLUBh8b5JmavEivnzCWEJCXAymxGIU3OZ
	Ibzw==
X-Received: by 10.194.220.7 with SMTP id ps7mr57275484wjc.28.1412111324477;
	Tue, 30 Sep 2014 14:08:44 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host115-255-dynamic.2-87-r.retail.telecomitalia.it. [87.2.255.115])
	by mx.google.com with ESMTPSA id
	ga9sm20432337wjb.45.2014.09.30.14.08.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Sep 2014 14:08:43 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Sep 2014 23:08:38 +0200
Message-Id: <1412111318-14034-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld] Pull request 20140930
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Sep 2014 21:08:54 -0000

The following changes since commit e51a0c84c65651a646ac701a411f724c0ed583a6:

  linux-yocto-tiny-kexecboot: change KERNEL_IMAGE_MAXSIZE from bytes to KB (2014-08-13 22:18:10 +0100)

are available in the git repository at:

  https://github.com/andrea-adami/meta-handheld master

for you to fetch changes up to 0838478a7059ecc9e4ed08ccd25c2415ded0e74c:

  linux-yocto-tiny-kexecboot_3.17: zaurus: initial commit based on 3.17-rc6 (2014-09-30 22:42:02 +0200)

----------------------------------------------------------------

Andrea Adami (2):
  linux-yocto_3.17: zaurus: initial commit based on 3.17-rc6
  linux-yocto-tiny-kexecboot_3.17: zaurus: initial commit based on
    3.17-rc6

 .../linux/linux-yocto-3.17/OE-qvga-logo.patch      | 232025 +++++
 .../linux/linux-yocto-3.17/OE-vga-logo.patch       | 923225 ++++++++++++++++++
 .../linux/linux-yocto-3.17/akita/defconfig         |    443 +
 .../linux/linux-yocto-3.17/c7x0/defconfig          |    374 +
 .../collie/arm-sa1100-add-cpu-clock.patch          |     95 +
 .../collie/arm-sa1100-dummy-clk_set_rate.patch     |     33 +
 .../collie/collie-use-gpio-charger.patch           |    113 +
 .../linux/linux-yocto-3.17/collie/defconfig        |    378 +
 .../fbdev-sa1100fb-make-use-of-device-clock.patch  |    112 +
 .../collie/locomo-fix-SCL-SDA.patch                |     28 +
 .../collie/locomo_kbd_tweak-r2.patch               |     84 +
 .../collie/locomolcd-suspend-resume.patch          |     92 +
 .../collie/pcmcia-sa1100-device-clock.patch        |     91 +
 .../revert-arm-sa1100-dummy-clk_get_rate.patch     |     32 +
 .../linux/linux-yocto-3.17/poodle/defconfig        |    376 +
 .../poodle/locomo-fix-SCL-SDA.patch                |     28 +
 .../poodle/locomo_kbd_tweak-r2.patch               |     84 +
 .../poodle/locomolcd-suspend-resume.patch          |     92 +
 .../revert-check-on-console-device.patch           |     41 +
 .../linux/linux-yocto-3.17/spitz/defconfig         |    442 +
 ...deo-move-backlight-to-the-end-of-Makefile.patch |     34 +
 ...02-tosa-bl-correct-backlight-calculations.patch |     39 +
 ...-tmio-call-tmiofb_set_par-in-tmiofb_probe.patch |     43 +
 .../0004-ARM-pxa-tosa-switch-to-gpio-charger.patch |     90 +
 ...5-ARM-pxa-tosa-fix-several-build-failures.patch |     32 +
 ...b-fail-ohci-suspend-if-full-state-restore.patch |     54 +
 ...97xx-adapt-parameters-to-tosa-touchscreen.patch |     31 +
 .../linux/linux-yocto-3.17/tosa/defconfig          |    446 +
 .../akita/defconfig                                |    135 +
 .../linux-yocto-tiny-kexecboot-3.17/c7x0/defconfig |    136 +
 .../collie/defconfig                               |    144 +
 .../poodle/defconfig                               |    140 +
 .../spitz/3200-mtd.patch                           |     13 +
 .../spitz/defconfig                                |    134 +
 .../linux-yocto-tiny-kexecboot-3.17/tosa/defconfig |    138 +
 .../linux/linux-yocto-tiny-kexecboot_3.17.bbappend |     86 +
 recipes-kernel/linux/linux-yocto_3.17.bbappend     |     80 +
 37 files changed, 1159963 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/OE-qvga-logo.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/OE-vga-logo.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/akita/defconfig
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/c7x0/defconfig
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/collie/arm-sa1100-add-cpu-clock.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/collie/arm-sa1100-dummy-clk_set_rate.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/collie/collie-use-gpio-charger.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/collie/defconfig
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/collie/fbdev-sa1100fb-make-use-of-device-clock.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/collie/locomo-fix-SCL-SDA.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/collie/locomo_kbd_tweak-r2.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/collie/locomolcd-suspend-resume.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/collie/pcmcia-sa1100-device-clock.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/collie/revert-arm-sa1100-dummy-clk_get_rate.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/poodle/defconfig
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/poodle/locomo-fix-SCL-SDA.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/poodle/locomo_kbd_tweak-r2.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/poodle/locomolcd-suspend-resume.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/revert-check-on-console-device.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/spitz/defconfig
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/tosa/0001-HACK-video-move-backlight-to-the-end-of-Makefile.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/tosa/0002-tosa-bl-correct-backlight-calculations.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/tosa/0003-tmio-call-tmiofb_set_par-in-tmiofb_probe.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/tosa/0004-ARM-pxa-tosa-switch-to-gpio-charger.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/tosa/0005-ARM-pxa-tosa-fix-several-build-failures.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/tosa/0006-mfd-tc6393xb-fail-ohci-suspend-if-full-state-restore.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/tosa/0007-wm97xx-adapt-parameters-to-tosa-touchscreen.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/tosa/defconfig
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/akita/defconfig
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/c7x0/defconfig
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/collie/defconfig
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/poodle/defconfig
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/spitz/3200-mtd.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/spitz/defconfig
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.17/tosa/defconfig
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.bbappend
 create mode 100644 recipes-kernel/linux/linux-yocto_3.17.bbappend

-- 
1.9.1


