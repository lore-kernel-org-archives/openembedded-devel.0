Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1UHN5j-0000zl-6d
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Mar 2013 00:34:15 +0100
Received: by mail-ea0-f180.google.com with SMTP id j14so2130800eak.25
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Mar 2013 16:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=2bg/WDKkUqp9QEIiLyHySrsjLCmEfkl8m4hwXzJ+4Mk=;
	b=ySIk/5dPvudVgMS9sJN2unFmN2ACTMgzCIOGDcoxgl3Gbx+yYaCDtgmf0z+CdsppTf
	f4LHjFCZz18d0yAS5lh2yUK61N8RudbMhTrHma8J8zOJ6PIUz65itp/PaGj3qBxIiE/I
	afzUI12z6DBeJHxLadoPkk6hc6nn9UTXaR8/DSKODWZ/KSFIfIL2dJ2ANOyHxnJNH3Q6
	VqEZD3ujrPVlNV2AlaCOY35VI2Xovhg34Ymc8V5j1CiKSN2zkmNzbyZhplcugtybSpOA
	3AmPTipUJ/k2xgd/w03IgEdNrNrhGQQr8X43DqQ8/jkrKhXjbvOJOYGCbgJ4IuE8D9EU
	bshA==
X-Received: by 10.14.194.198 with SMTP id m46mr28002249een.8.1363562247937;
	Sun, 17 Mar 2013 16:17:27 -0700 (PDT)
Received: from mizar.localdomain
	(host195-251-dynamic.8-87-r.retail.telecomitalia.it. [87.8.251.195])
	by mx.google.com with ESMTPS id z45sm23918077eeu.10.2013.03.17.16.17.25
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 17 Mar 2013 16:17:26 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Mar 2013 00:17:13 +0100
Message-Id: <cover.1363561878.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.12.4
Subject: [meta-handheld][PATCH 0/5] Zaurus kernel updates
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
X-List-Received-Date: Sun, 17 Mar 2013 23:34:17 -0000

* hack again around collie flash, Read-Only until proper CFI detection
* introduce kernel 3.8 for all Zaurus, with DEFAULT_PREFERENCE -1

Andrea Adami (5):
  linux-yocto-tiny-kexecboot: add patch fixing mtd on SL-C3200
  linux-yocto_3.2: match the exact NOR on collie
  linux-yocto-tiny-kexecboot_3.2: match the exact NOR on collie
  linux-yocto-3.4: remove temporary version. Replace with 3.8
  linux-yocto_3.8: initial commit for Zaurus devices

 .../linux-yocto-3.2/collie/collie-eraseinfo.patch  |  28 +-
 .../linux/linux-yocto-3.2/collie/collie.cfg        |   4 +-
 .../linux/linux-yocto-3.4/akita/akita-standard.scc |   7 -
 .../linux/linux-yocto-3.4/akita/akita.cfg          |   4 -
 .../linux/linux-yocto-3.4/akita/akita.scc          |  11 -
 .../linux/linux-yocto-3.4/c7x0/c7x0-standard.scc   |   7 -
 recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg |  57 ---
 recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.scc |  10 -
 .../linux-yocto-3.4/collie/collie-standard.scc     |   7 -
 .../linux/linux-yocto-3.4/collie/collie.cfg        |  86 -----
 .../linux/linux-yocto-3.4/collie/collie.scc        |   5 -
 .../linux/linux-yocto-3.4/feature-top.scc          |   1 -
 .../linux-yocto-3.4/locomo_kbd_tweak-r2.patch      |  80 ----
 .../linux-yocto-3.4/poodle/poodle-standard.scc     |   7 -
 .../linux/linux-yocto-3.4/poodle/poodle.cfg        |  62 ----
 .../linux/linux-yocto-3.4/poodle/poodle.scc        |  10 -
 .../linux/linux-yocto-3.4/pxa25x-gpio-wakeup.patch |  40 --
 .../linux/linux-yocto-3.4/pxa25x-sa1100-rtc.patch  |  29 --
 .../linux/linux-yocto-3.4/pxa27x-sa1100-rtc.patch  |  29 --
 .../linux/linux-yocto-3.4/sharpsl_param.patch      |  24 --
 .../linux/linux-yocto-3.4/spi-pxa2xx-fix-mem.patch |  34 --
 .../linux/linux-yocto-3.4/spitz/spitz-standard.scc |   7 -
 .../linux/linux-yocto-3.4/spitz/spitz.cfg          |  67 ----
 .../linux/linux-yocto-3.4/spitz/spitz.scc          |  10 -
 .../linux/linux-yocto-3.4/spitz_pm.patch           |  53 ---
 .../linux/linux-yocto-3.4/tosa/tosa-standard.scc   |   7 -
 recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg |  62 ----
 recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.scc |  10 -
 .../linux/linux-yocto-3.4/zaurus-common.scc        |  10 -
 .../linux/linux-yocto-3.4/zaurus-hardware.cfg      | 279 --------------
 .../linux/linux-yocto-3.4/zaurus-non-hardware.cfg  | 401 ---------------------
 .../linux-yocto-3.4/zaurus-pxa-common-non-hw.cfg   |   9 -
 .../linux/linux-yocto-3.4/zaurus-pxa-common.cfg    |  98 -----
 .../linux/linux-yocto-3.4/zaurus-pxa-only.scc      |   2 -
 .../linux/linux-yocto-3.4/zaurus-usb-host.scc      |   6 -
 .../linux-yocto-3.4/zaurus-usb-ohci-non-hw.cfg     |   4 -
 .../linux/linux-yocto-3.4/zaurus-usb-ohci.cfg      | 110 ------
 .../linux/linux-yocto-3.8/akita/akita-standard.scc |   7 +
 .../linux/linux-yocto-3.8/akita/akita.cfg          |   4 +
 .../linux/linux-yocto-3.8/akita/akita.scc          |  11 +
 .../linux/linux-yocto-3.8/c7x0/c7x0-standard.scc   |   7 +
 recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.cfg |  52 +++
 recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc |   8 +
 .../linux/linux-yocto-3.8/collie-eraseinfo.patch   |  31 ++
 .../linux/linux-yocto-3.8/collie-jedec-probe.patch |  11 +
 .../linux-yocto-3.8/collie/collie-standard.scc     |   7 +
 .../linux/linux-yocto-3.8/collie/collie.cfg        | 118 ++++++
 .../linux/linux-yocto-3.8/collie/collie.scc        |   8 +
 .../linux/linux-yocto-3.8/feature-top.scc          |   1 +
 .../linux-yocto-3.8/locomo_kbd_tweak-r2.patch      |  75 ++++
 .../linux/linux-yocto-3.8/mcp-device.patch         |  13 +
 .../linux-yocto-3.8/poodle/poodle-standard.scc     |   7 +
 .../linux/linux-yocto-3.8/poodle/poodle.cfg        |  57 +++
 .../linux/linux-yocto-3.8/poodle/poodle.scc        |   8 +
 .../linux/linux-yocto-3.8/pxa27x-sa1100-rtc.patch  |  34 ++
 .../linux/linux-yocto-3.8/sharpsl_param.patch      |  24 ++
 .../linux/linux-yocto-3.8/spi-pxa2xx-fix-mem.patch |  34 ++
 .../linux/linux-yocto-3.8/spitz/spitz-standard.scc |   7 +
 .../linux/linux-yocto-3.8/spitz/spitz.cfg          |  61 ++++
 .../linux/linux-yocto-3.8/spitz/spitz.scc          |  10 +
 .../linux/linux-yocto-3.8/spitz_pm.patch           |  53 +++
 .../linux/linux-yocto-3.8/tosa/tosa-standard.scc   |   7 +
 recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.cfg |  57 +++
 recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc |   8 +
 .../linux/linux-yocto-3.8/zaurus-common.scc        |  10 +
 .../linux/linux-yocto-3.8/zaurus-hardware.cfg      | 279 ++++++++++++++
 .../linux/linux-yocto-3.8/zaurus-non-hardware.cfg  | 400 ++++++++++++++++++++
 .../linux-yocto-3.8/zaurus-pxa-common-non-hw.cfg   |   9 +
 .../linux/linux-yocto-3.8/zaurus-pxa-common.cfg    | 111 ++++++
 .../linux/linux-yocto-3.8/zaurus-pxa-only.scc      |   2 +
 .../linux/linux-yocto-3.8/zaurus-usb-host.scc      |   6 +
 .../linux-yocto-3.8/zaurus-usb-ohci-non-hw.cfg     |   4 +
 .../linux/linux-yocto-3.8/zaurus-usb-ohci.cfg      | 110 ++++++
 .../collie/collie-eraseinfo.patch                  |  28 +-
 .../collie/collie-kexecboot.cfg                    |   4 +-
 .../spitz/3200-mtd.patch                           |  13 +
 recipes-kernel/linux/linux-yocto_3.4.bbappend      |  54 ---
 recipes-kernel/linux/linux-yocto_3.8.bbappend      |  54 +++
 78 files changed, 1770 insertions(+), 1711 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/akita/akita-standard.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/akita/akita.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0-standard.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/collie/collie-standard.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/collie/collie.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/collie/collie.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/feature-top.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/locomo_kbd_tweak-r2.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/poodle/poodle-standard.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/pxa25x-gpio-wakeup.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/pxa25x-sa1100-rtc.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/pxa27x-sa1100-rtc.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/sharpsl_param.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/spi-pxa2xx-fix-mem.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/spitz/spitz-standard.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/spitz_pm.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/tosa/tosa-standard.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-common.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-non-hardware.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common-non-hw.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-only.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-usb-host.scc
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-usb-ohci-non-hw.cfg
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-usb-ohci.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/REGULATORS
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/akita/akita-standard.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/akita/akita.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0-standard.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/collie-eraseinfo.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/collie-jedec-probe.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/collie/collie-standard.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/collie/collie.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/collie/collie.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/feature-top.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/locomo_kbd_tweak-r2.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/mcp-device.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/poodle/poodle-standard.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/pxa27x-sa1100-rtc.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/sharpsl_param.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/spi-pxa2xx-fix-mem.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/spitz/spitz-standard.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/spitz_pm.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/tosa/tosa-standard.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/zaurus-common.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/zaurus-hardware.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/zaurus-non-hardware.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/zaurus-pxa-common-non-hw.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/zaurus-pxa-common.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/zaurus-pxa-only.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/zaurus-usb-host.scc
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/zaurus-usb-ohci-non-hw.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/zaurus-usb-ohci.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/spitz/3200-mtd.patch
 delete mode 100644 recipes-kernel/linux/linux-yocto_3.4.bbappend
 create mode 100644 recipes-kernel/linux/linux-yocto_3.8.bbappend

-- 
1.7.12.4



