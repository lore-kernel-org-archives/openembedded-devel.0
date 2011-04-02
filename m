Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@true.cz>) id 1Q61hE-0006oE-BU
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Apr 2011 16:21:00 +0200
Received: from ntbk.lan (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 8B5A31D36069;
	Sat,  2 Apr 2011 16:18:56 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Apr 2011 16:18:44 +0200
Message-Id: <1301753930-32581-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/6] RFC: patches I plan to push
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
X-List-Received-Date: Sat, 02 Apr 2011 14:21:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I plan to push few patches, so I'm posting them for the review first to g=
et some
feedback (if any). Thanks.

-- ynezz

Petr =C5=A0tetiar (6):
  zeromq: add new recipe for version 2.1.1
  lua-lanes: add recipe for version 2.1.0 and delete the old one
  librs232: add version 1.0.1 and remove the old one
  lua-rs232: add recipe for version 1.0.1, remove old package and fix
    stripping
  linux-2.6.36: remove ts72xx support because 2.6.38 is now default
  linux-2.6.38: add support for ts72xx and make it default

 recipes/librs232/librs232_1.0.0.bb                 |   10 -
 recipes/librs232/librs232_1.0.1.bb                 |   10 +
 .../linux-2.6.36/ts72xx/0001-ts72xx_base.patch     |  450 --
 .../ts72xx/0002-ts72xx_force_machine-id.patch      |   49 -
 .../linux-2.6.36/ts72xx/0003-ep93xx_cpuinfo.patch  |   36 -
 .../linux-2.6.36/ts72xx/0004-ep93xx_eth.patch      |  555 ---
 .../ts72xx/0005-ep93xx-m2m-DMA-support.patch       |  886 ----
 .../linux-2.6.36/ts72xx/0006-ts72xx_rs485.patch    |  223 -
 .../linux-2.6.36/ts72xx/0007-ts72xx_ts_ser1.patch  |  264 --
 .../ts72xx/0008-ts72xx_ts_eth100.patch             |  278 --
 .../linux-2.6.36/ts72xx/0009-ts72xx_pata.patch     |  437 --
 .../linux-2.6.36/ts72xx/0010-ts72xx_gpio_i2c.patch |   63 -
 .../ts72xx/0011-ts72xx_dio_keypad.patch            |  311 --
 .../linux-2.6.36/ts72xx/0012-ts72xx_sbcinfo.patch  |  267 --
 .../linux-2.6.36/ts72xx/0013-ts72xx_max197.patch   |  356 --
 .../ts72xx/0014-ts7200_nor_flash.patch             |  181 -
 .../linux-2.6.36/ts72xx/0015-ts72xx_sdcard.patch   | 3298 --------------
 .../ts72xx/0016-ts72xx_spi_tmp124.patch            |  305 --
 .../0017-ts72xx-use-CPLD-watchdog-for-reset.patch  |   53 -
 .../ts72xx/0018-ethoc-ts7300-fixes.patch           |   93 -
 .../ts72xx/0019-ts7300-add-ethernet-support.patch  |   87 -
 .../ts72xx/0023-ts72xx-add-lcd-linux-driver.patch  | 4569 --------------=
-----
 .../ts72xx/0024-ts72xx-add-GPIO-keys.patch         |  100 -
 recipes/linux/linux-2.6.36/ts72xx/defconfig        | 2127 ---------
 .../linux-2.6.38/ts72xx/0001-ts72xx_base.patch     |  451 ++
 .../ts72xx/0002-ts72xx_force_machine-id.patch      |   49 +
 .../linux-2.6.38/ts72xx/0003-ep93xx_cpuinfo.patch  |   36 +
 .../linux-2.6.38/ts72xx/0004-ep93xx_eth.patch      |  553 +++
 .../ts72xx/0005-ep93xx-m2m-DMA-support.patch       |  870 ++++
 .../linux-2.6.38/ts72xx/0006-ts72xx_rs485.patch    |  221 +
 .../linux-2.6.38/ts72xx/0007-ts72xx_ts_ser1.patch  |  264 ++
 .../ts72xx/0008-ts72xx_ts_eth100.patch             |  278 ++
 .../linux-2.6.38/ts72xx/0009-ts72xx_pata.patch     |  437 ++
 .../linux-2.6.38/ts72xx/0010-ts72xx_gpio_i2c.patch |   63 +
 .../ts72xx/0011-ts72xx_dio_keypad.patch            |  311 ++
 .../linux-2.6.38/ts72xx/0012-ts72xx_sbcinfo.patch  |  267 ++
 .../linux-2.6.38/ts72xx/0013-ts72xx_max197.patch   |  356 ++
 .../ts72xx/0014-ts7200_nor_flash.patch             |  181 +
 .../linux-2.6.38/ts72xx/0015-ts72xx_sdcard.patch   | 3299 ++++++++++++++
 .../ts72xx/0016-ts72xx_spi_tmp124.patch            |  305 ++
 .../0017-ts72xx-use-CPLD-watchdog-for-reset.patch  |   53 +
 .../ts72xx/0018-ethoc-ts7300-fixes.patch           |   72 +
 .../ts72xx/0019-ts7300-add-ethernet-support.patch  |   87 +
 .../ts72xx/0020-ts72xx-add-lcd-linux-driver.patch  | 4572 ++++++++++++++=
++++++
 .../ts72xx/0021-TS-72XX-LCD-console-driver.patch   |  528 +++
 ...M-ep93xx-Fix-inverted-RTS-and-DTR-signals.patch |   38 +
 recipes/linux/linux-2.6.38/ts72xx/defconfig        | 2214 ++++++++++
 recipes/linux/linux_2.6.36.bb                      |   25 -
 recipes/linux/linux_2.6.38.bb                      |   26 +
 .../0001-fix-LanesTimer-inifinite-thread-GC.patch  |   31 -
 recipes/lua/lua-lanes-2.0.6/makefile.patch         |  207 -
 recipes/lua/lua-lanes-2.0.6/uclibc.patch           |   13 -
 recipes/lua/lua-lanes-2.1.0/makefile.patch         |  207 +
 recipes/lua/lua-lanes-2.1.0/uclibc.patch           |   13 +
 recipes/lua/lua-lanes_2.0.6.bb                     |   33 -
 recipes/lua/lua-lanes_2.1.0.bb                     |   34 +
 recipes/lua/lua-rs232_1.0.0.bb                     |   28 -
 recipes/lua/lua-rs232_1.0.1.bb                     |   28 +
 recipes/zeromq/zeromq_2.1.1.bb                     |   20 +
 59 files changed, 15843 insertions(+), 15335 deletions(-)
 delete mode 100644 recipes/librs232/librs232_1.0.0.bb
 create mode 100644 recipes/librs232/librs232_1.0.1.bb
 delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0001-ts72xx_base.pa=
tch
 delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0002-ts72xx_force_m=
achine-id.patch
 delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0003-ep93xx_cpuinfo=
.patch
 delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0004-ep93xx_eth.pat=
ch
 delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0005-ep93xx-m2m-DMA=
-support.patch
 delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0006-ts72xx_rs485.p=
atch
 delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0007-ts72xx_ts_ser1=
.patch
 delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0008-ts72xx_ts_eth1=
00.patch
 delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0009-ts72xx_pata.pa=
tch
 delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0010-ts72xx_gpio_i2=
c.patch
 delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0011-ts72xx_dio_key=
pad.patch
 delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0012-ts72xx_sbcinfo=
.patch
 delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0013-ts72xx_max197.=
patch
 delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0014-ts7200_nor_fla=
sh.patch
 delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0015-ts72xx_sdcard.=
patch
 delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0016-ts72xx_spi_tmp=
124.patch
 delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0017-ts72xx-use-CPL=
D-watchdog-for-reset.patch
 delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0018-ethoc-ts7300-f=
ixes.patch
 delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0019-ts7300-add-eth=
ernet-support.patch
 delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0023-ts72xx-add-lcd=
-linux-driver.patch
 delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0024-ts72xx-add-GPI=
O-keys.patch
 delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/defconfig
 create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0001-ts72xx_base.pa=
tch
 create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0002-ts72xx_force_m=
achine-id.patch
 create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0003-ep93xx_cpuinfo=
.patch
 create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0004-ep93xx_eth.pat=
ch
 create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0005-ep93xx-m2m-DMA=
-support.patch
 create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0006-ts72xx_rs485.p=
atch
 create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0007-ts72xx_ts_ser1=
.patch
 create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0008-ts72xx_ts_eth1=
00.patch
 create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0009-ts72xx_pata.pa=
tch
 create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0010-ts72xx_gpio_i2=
c.patch
 create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0011-ts72xx_dio_key=
pad.patch
 create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0012-ts72xx_sbcinfo=
.patch
 create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0013-ts72xx_max197.=
patch
 create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0014-ts7200_nor_fla=
sh.patch
 create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0015-ts72xx_sdcard.=
patch
 create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0016-ts72xx_spi_tmp=
124.patch
 create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0017-ts72xx-use-CPL=
D-watchdog-for-reset.patch
 create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0018-ethoc-ts7300-f=
ixes.patch
 create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0019-ts7300-add-eth=
ernet-support.patch
 create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0020-ts72xx-add-lcd=
-linux-driver.patch
 create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0021-TS-72XX-LCD-co=
nsole-driver.patch
 create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0024-ARM-ep93xx-Fix=
-inverted-RTS-and-DTR-signals.patch
 create mode 100644 recipes/linux/linux-2.6.38/ts72xx/defconfig
 delete mode 100644 recipes/lua/lua-lanes-2.0.6/0001-fix-LanesTimer-inifi=
nite-thread-GC.patch
 delete mode 100644 recipes/lua/lua-lanes-2.0.6/makefile.patch
 delete mode 100644 recipes/lua/lua-lanes-2.0.6/uclibc.patch
 create mode 100644 recipes/lua/lua-lanes-2.1.0/makefile.patch
 create mode 100644 recipes/lua/lua-lanes-2.1.0/uclibc.patch
 delete mode 100644 recipes/lua/lua-lanes_2.0.6.bb
 create mode 100644 recipes/lua/lua-lanes_2.1.0.bb
 delete mode 100644 recipes/lua/lua-rs232_1.0.0.bb
 create mode 100644 recipes/lua/lua-rs232_1.0.1.bb
 create mode 100644 recipes/zeromq/zeromq_2.1.1.bb



