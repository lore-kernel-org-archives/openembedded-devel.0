Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q8jwG-0003Bd-Um
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Apr 2011 03:59:45 +0200
Received: by pvc30 with SMTP id 30so1706535pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Apr 2011 18:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=RfoVJkdZwNuUBmFFKE06vQ8daRXnecTw0BnE68F3RDc=;
	b=aqCHN80zz42w93ugkZKrZz1Xq5eywrkEI0ycfbtcqZ89+XWwkRHclbHwDFhy7ZJT0k
	wyNcaWTRZ/845cVAkEfQDNcA7yiUZJ4Gx4Mnl1IomQi9TQeaYaGD9sWSHce/DTYczK2X
	OssyA7Cc5JwjWTboQb/TKDzVTMpH2aGz6/JbY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=QXHsb+NP1/2b9vhVBwniTIhEEVJs0dKnv+ywTQs/1KPkH8HsZXsMhAs8nuFd+FQ0/B
	NpZHz26GQ3MmlOAQxzqmIGyWzXx5eCVKefhvTigjq6CINX+6L8sXDL2AyDXzmoMG/dEK
	oj+BuPXRO3+Z4e0ONnrRPQ+xmb4XTr837DVys=
Received: by 10.142.226.16 with SMTP id y16mr3537928wfg.141.1302400647045;
	Sat, 09 Apr 2011 18:57:27 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id z10sm5984122wfj.3.2011.04.09.18.57.24
	(version=SSLv3 cipher=OTHER); Sat, 09 Apr 2011 18:57:25 -0700 (PDT)
Message-ID: <4DA10E85.8060905@gmail.com>
Date: Sat, 09 Apr 2011 18:57:25 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1301753930-32581-1-git-send-email-ynezz@true.cz>
In-Reply-To: <1301753930-32581-1-git-send-email-ynezz@true.cz>
Subject: Re: [PATCH 0/6] RFC: patches I plan to push
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
X-List-Received-Date: Sun, 10 Apr 2011 01:59:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/2/2011 7:18 AM, Petr Štetiar wrote:
> Hi,
>
> I plan to push few patches, so I'm posting them for the review first to get some
> feedback (if any). Thanks.

looks ok

>
> -- ynezz
>
> Petr Štetiar (6):
>    zeromq: add new recipe for version 2.1.1
>    lua-lanes: add recipe for version 2.1.0 and delete the old one
>    librs232: add version 1.0.1 and remove the old one
>    lua-rs232: add recipe for version 1.0.1, remove old package and fix
>      stripping
>    linux-2.6.36: remove ts72xx support because 2.6.38 is now default
>    linux-2.6.38: add support for ts72xx and make it default
>
>   recipes/librs232/librs232_1.0.0.bb                 |   10 -
>   recipes/librs232/librs232_1.0.1.bb                 |   10 +
>   .../linux-2.6.36/ts72xx/0001-ts72xx_base.patch     |  450 --
>   .../ts72xx/0002-ts72xx_force_machine-id.patch      |   49 -
>   .../linux-2.6.36/ts72xx/0003-ep93xx_cpuinfo.patch  |   36 -
>   .../linux-2.6.36/ts72xx/0004-ep93xx_eth.patch      |  555 ---
>   .../ts72xx/0005-ep93xx-m2m-DMA-support.patch       |  886 ----
>   .../linux-2.6.36/ts72xx/0006-ts72xx_rs485.patch    |  223 -
>   .../linux-2.6.36/ts72xx/0007-ts72xx_ts_ser1.patch  |  264 --
>   .../ts72xx/0008-ts72xx_ts_eth100.patch             |  278 --
>   .../linux-2.6.36/ts72xx/0009-ts72xx_pata.patch     |  437 --
>   .../linux-2.6.36/ts72xx/0010-ts72xx_gpio_i2c.patch |   63 -
>   .../ts72xx/0011-ts72xx_dio_keypad.patch            |  311 --
>   .../linux-2.6.36/ts72xx/0012-ts72xx_sbcinfo.patch  |  267 --
>   .../linux-2.6.36/ts72xx/0013-ts72xx_max197.patch   |  356 --
>   .../ts72xx/0014-ts7200_nor_flash.patch             |  181 -
>   .../linux-2.6.36/ts72xx/0015-ts72xx_sdcard.patch   | 3298 --------------
>   .../ts72xx/0016-ts72xx_spi_tmp124.patch            |  305 --
>   .../0017-ts72xx-use-CPLD-watchdog-for-reset.patch  |   53 -
>   .../ts72xx/0018-ethoc-ts7300-fixes.patch           |   93 -
>   .../ts72xx/0019-ts7300-add-ethernet-support.patch  |   87 -
>   .../ts72xx/0023-ts72xx-add-lcd-linux-driver.patch  | 4569 -------------------
>   .../ts72xx/0024-ts72xx-add-GPIO-keys.patch         |  100 -
>   recipes/linux/linux-2.6.36/ts72xx/defconfig        | 2127 ---------
>   .../linux-2.6.38/ts72xx/0001-ts72xx_base.patch     |  451 ++
>   .../ts72xx/0002-ts72xx_force_machine-id.patch      |   49 +
>   .../linux-2.6.38/ts72xx/0003-ep93xx_cpuinfo.patch  |   36 +
>   .../linux-2.6.38/ts72xx/0004-ep93xx_eth.patch      |  553 +++
>   .../ts72xx/0005-ep93xx-m2m-DMA-support.patch       |  870 ++++
>   .../linux-2.6.38/ts72xx/0006-ts72xx_rs485.patch    |  221 +
>   .../linux-2.6.38/ts72xx/0007-ts72xx_ts_ser1.patch  |  264 ++
>   .../ts72xx/0008-ts72xx_ts_eth100.patch             |  278 ++
>   .../linux-2.6.38/ts72xx/0009-ts72xx_pata.patch     |  437 ++
>   .../linux-2.6.38/ts72xx/0010-ts72xx_gpio_i2c.patch |   63 +
>   .../ts72xx/0011-ts72xx_dio_keypad.patch            |  311 ++
>   .../linux-2.6.38/ts72xx/0012-ts72xx_sbcinfo.patch  |  267 ++
>   .../linux-2.6.38/ts72xx/0013-ts72xx_max197.patch   |  356 ++
>   .../ts72xx/0014-ts7200_nor_flash.patch             |  181 +
>   .../linux-2.6.38/ts72xx/0015-ts72xx_sdcard.patch   | 3299 ++++++++++++++
>   .../ts72xx/0016-ts72xx_spi_tmp124.patch            |  305 ++
>   .../0017-ts72xx-use-CPLD-watchdog-for-reset.patch  |   53 +
>   .../ts72xx/0018-ethoc-ts7300-fixes.patch           |   72 +
>   .../ts72xx/0019-ts7300-add-ethernet-support.patch  |   87 +
>   .../ts72xx/0020-ts72xx-add-lcd-linux-driver.patch  | 4572 ++++++++++++++++++++
>   .../ts72xx/0021-TS-72XX-LCD-console-driver.patch   |  528 +++
>   ...M-ep93xx-Fix-inverted-RTS-and-DTR-signals.patch |   38 +
>   recipes/linux/linux-2.6.38/ts72xx/defconfig        | 2214 ++++++++++
>   recipes/linux/linux_2.6.36.bb                      |   25 -
>   recipes/linux/linux_2.6.38.bb                      |   26 +
>   .../0001-fix-LanesTimer-inifinite-thread-GC.patch  |   31 -
>   recipes/lua/lua-lanes-2.0.6/makefile.patch         |  207 -
>   recipes/lua/lua-lanes-2.0.6/uclibc.patch           |   13 -
>   recipes/lua/lua-lanes-2.1.0/makefile.patch         |  207 +
>   recipes/lua/lua-lanes-2.1.0/uclibc.patch           |   13 +
>   recipes/lua/lua-lanes_2.0.6.bb                     |   33 -
>   recipes/lua/lua-lanes_2.1.0.bb                     |   34 +
>   recipes/lua/lua-rs232_1.0.0.bb                     |   28 -
>   recipes/lua/lua-rs232_1.0.1.bb                     |   28 +
>   recipes/zeromq/zeromq_2.1.1.bb                     |   20 +
>   59 files changed, 15843 insertions(+), 15335 deletions(-)
>   delete mode 100644 recipes/librs232/librs232_1.0.0.bb
>   create mode 100644 recipes/librs232/librs232_1.0.1.bb
>   delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0001-ts72xx_base.patch
>   delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0002-ts72xx_force_machine-id.patch
>   delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0003-ep93xx_cpuinfo.patch
>   delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0004-ep93xx_eth.patch
>   delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0005-ep93xx-m2m-DMA-support.patch
>   delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0006-ts72xx_rs485.patch
>   delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0007-ts72xx_ts_ser1.patch
>   delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0008-ts72xx_ts_eth100.patch
>   delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0009-ts72xx_pata.patch
>   delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0010-ts72xx_gpio_i2c.patch
>   delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0011-ts72xx_dio_keypad.patch
>   delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0012-ts72xx_sbcinfo.patch
>   delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0013-ts72xx_max197.patch
>   delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0014-ts7200_nor_flash.patch
>   delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0015-ts72xx_sdcard.patch
>   delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0016-ts72xx_spi_tmp124.patch
>   delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0017-ts72xx-use-CPLD-watchdog-for-reset.patch
>   delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0018-ethoc-ts7300-fixes.patch
>   delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0019-ts7300-add-ethernet-support.patch
>   delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0023-ts72xx-add-lcd-linux-driver.patch
>   delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/0024-ts72xx-add-GPIO-keys.patch
>   delete mode 100644 recipes/linux/linux-2.6.36/ts72xx/defconfig
>   create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0001-ts72xx_base.patch
>   create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0002-ts72xx_force_machine-id.patch
>   create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0003-ep93xx_cpuinfo.patch
>   create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0004-ep93xx_eth.patch
>   create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0005-ep93xx-m2m-DMA-support.patch
>   create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0006-ts72xx_rs485.patch
>   create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0007-ts72xx_ts_ser1.patch
>   create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0008-ts72xx_ts_eth100.patch
>   create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0009-ts72xx_pata.patch
>   create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0010-ts72xx_gpio_i2c.patch
>   create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0011-ts72xx_dio_keypad.patch
>   create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0012-ts72xx_sbcinfo.patch
>   create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0013-ts72xx_max197.patch
>   create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0014-ts7200_nor_flash.patch
>   create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0015-ts72xx_sdcard.patch
>   create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0016-ts72xx_spi_tmp124.patch
>   create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0017-ts72xx-use-CPLD-watchdog-for-reset.patch
>   create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0018-ethoc-ts7300-fixes.patch
>   create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0019-ts7300-add-ethernet-support.patch
>   create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0020-ts72xx-add-lcd-linux-driver.patch
>   create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0021-TS-72XX-LCD-console-driver.patch
>   create mode 100644 recipes/linux/linux-2.6.38/ts72xx/0024-ARM-ep93xx-Fix-inverted-RTS-and-DTR-signals.patch
>   create mode 100644 recipes/linux/linux-2.6.38/ts72xx/defconfig
>   delete mode 100644 recipes/lua/lua-lanes-2.0.6/0001-fix-LanesTimer-inifinite-thread-GC.patch
>   delete mode 100644 recipes/lua/lua-lanes-2.0.6/makefile.patch
>   delete mode 100644 recipes/lua/lua-lanes-2.0.6/uclibc.patch
>   create mode 100644 recipes/lua/lua-lanes-2.1.0/makefile.patch
>   create mode 100644 recipes/lua/lua-lanes-2.1.0/uclibc.patch
>   delete mode 100644 recipes/lua/lua-lanes_2.0.6.bb
>   create mode 100644 recipes/lua/lua-lanes_2.1.0.bb
>   delete mode 100644 recipes/lua/lua-rs232_1.0.0.bb
>   create mode 100644 recipes/lua/lua-rs232_1.0.1.bb
>   create mode 100644 recipes/zeromq/zeromq_2.1.1.bb
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



