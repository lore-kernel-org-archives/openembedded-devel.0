Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1P2NNk-0002QY-CM
	for openembedded-devel@openembedded.org; Sun, 03 Oct 2010 14:09:33 +0200
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 1A7561D363EB;
	Sun,  3 Oct 2010 14:02:03 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Oct 2010 14:01:55 +0200
Message-Id: <1286107318-10285-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 0/3] Update kernel for ts72xx
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
X-List-Received-Date: Sun, 03 Oct 2010 12:09:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

this patchset should update ts72xx kernel support in OE. Please apply.
Thanks.

-- ynezz

Petr =C5=A0tetiar (3):
  linux-2.6.34: upgrade to latest stablepatch 2.6.34.7
  linux-2.6.34: add support for ts72xx and make it default kernel
  linux-2.6.27: don't use as default kernel for ts72xx

 .../linux-2.6.34/ts72xx/0001-ts72xx_base.patch     |  445 +++
 .../ts72xx/0002-ts72xx_force_machine-id.patch      |   45 +
 .../linux-2.6.34/ts72xx/0003-ep93xx_cpuinfo.patch  |   32 +
 .../linux-2.6.34/ts72xx/0004-ep93xx_eth.patch      |  551 ++++
 .../ts72xx/0005-ep93xx-m2m-DMA-support.patch       |  882 ++++++
 .../linux-2.6.34/ts72xx/0006-ts72xx_rs485.patch    |  218 ++
 .../linux-2.6.34/ts72xx/0007-ts72xx_ts_ser1.patch  |  259 ++
 .../ts72xx/0008-ts72xx_ts_eth100.patch             |  273 ++
 .../linux-2.6.34/ts72xx/0009-ts72xx_pata.patch     |  432 +++
 .../linux-2.6.34/ts72xx/0010-ts72xx_gpio_i2c.patch |   58 +
 .../ts72xx/0011-ts72xx_dio_keypad.patch            |  306 ++
 .../linux-2.6.34/ts72xx/0012-ts72xx_sbcinfo.patch  |  263 ++
 .../linux-2.6.34/ts72xx/0013-ts72xx_max197.patch   |  347 ++
 .../ts72xx/0014-ts7200_nor_flash.patch             |  176 ++
 .../linux-2.6.34/ts72xx/0015-ts72xx_sdcard.patch   | 3293 ++++++++++++++=
++++++
 .../ts72xx/0016-ts72xx_nand_flash.patch            |  270 ++
 .../linux-2.6.34/ts72xx/0017-ep93xx_spi.patch      | 1312 ++++++++
 .../ts72xx/0018-ts72xx_spi_tmp124.patch            |  298 ++
 recipes/linux/linux-2.6.34/ts72xx/defconfig        | 1679 ++++++++++
 recipes/linux/linux_2.6.27.bb                      |    2 +-
 recipes/linux/linux_2.6.34.bb                      |   28 +-
 21 files changed, 11166 insertions(+), 3 deletions(-)
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0001-ts72xx_base.pa=
tch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0002-ts72xx_force_m=
achine-id.patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0003-ep93xx_cpuinfo=
.patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0004-ep93xx_eth.pat=
ch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0005-ep93xx-m2m-DMA=
-support.patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0006-ts72xx_rs485.p=
atch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0007-ts72xx_ts_ser1=
.patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0008-ts72xx_ts_eth1=
00.patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0009-ts72xx_pata.pa=
tch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0010-ts72xx_gpio_i2=
c.patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0011-ts72xx_dio_key=
pad.patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0012-ts72xx_sbcinfo=
.patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0013-ts72xx_max197.=
patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0014-ts7200_nor_fla=
sh.patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0015-ts72xx_sdcard.=
patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0016-ts72xx_nand_fl=
ash.patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0017-ep93xx_spi.pat=
ch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/0018-ts72xx_spi_tmp=
124.patch
 create mode 100644 recipes/linux/linux-2.6.34/ts72xx/defconfig



