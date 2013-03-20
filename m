Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UIFWw-0001xN-Br
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Mar 2013 10:42:00 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 20 Mar 2013 02:25:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,876,1355126400"; d="scan'208";a="216845535"
Received: from unknown (HELO helios.localnet) ([10.255.13.114])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Mar 2013 02:25:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Wed, 20 Mar 2013 09:25:04 +0000
Message-ID: <2425119.OLCOhAdEo6@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <cover.1363561878.git.andrea.adami@gmail.com>
References: <cover.1363561878.git.andrea.adami@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH 0/5] Zaurus kernel updates
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
X-List-Received-Date: Wed, 20 Mar 2013 09:42:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 18 March 2013 00:17:13 Andrea Adami wrote:
> * hack again around collie flash, Read-Only until proper CFI detection
> * introduce kernel 3.8 for all Zaurus, with DEFAULT_PREFERENCE -1
> 
> Andrea Adami (5):
>   linux-yocto-tiny-kexecboot: add patch fixing mtd on SL-C3200
>   linux-yocto_3.2: match the exact NOR on collie
>   linux-yocto-tiny-kexecboot_3.2: match the exact NOR on collie
>   linux-yocto-3.4: remove temporary version. Replace with 3.8
>   linux-yocto_3.8: initial commit for Zaurus devices
> 
>  .../linux-yocto-3.2/collie/collie-eraseinfo.patch  |  28 +-
>  .../linux/linux-yocto-3.2/collie/collie.cfg        |   4 +-
>  .../linux/linux-yocto-3.4/akita/akita-standard.scc |   7 -
>  .../linux/linux-yocto-3.4/akita/akita.cfg          |   4 -
>  .../linux/linux-yocto-3.4/akita/akita.scc          |  11 -
>  .../linux/linux-yocto-3.4/c7x0/c7x0-standard.scc   |   7 -
>  recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg |  57 ---
>  recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.scc |  10 -
>  .../linux-yocto-3.4/collie/collie-standard.scc     |   7 -
>  .../linux/linux-yocto-3.4/collie/collie.cfg        |  86 -----
>  .../linux/linux-yocto-3.4/collie/collie.scc        |   5 -
>  .../linux/linux-yocto-3.4/feature-top.scc          |   1 -
>  .../linux-yocto-3.4/locomo_kbd_tweak-r2.patch      |  80 ----
>  .../linux-yocto-3.4/poodle/poodle-standard.scc     |   7 -
>  .../linux/linux-yocto-3.4/poodle/poodle.cfg        |  62 ----
>  .../linux/linux-yocto-3.4/poodle/poodle.scc        |  10 -
>  .../linux/linux-yocto-3.4/pxa25x-gpio-wakeup.patch |  40 --
>  .../linux/linux-yocto-3.4/pxa25x-sa1100-rtc.patch  |  29 --
>  .../linux/linux-yocto-3.4/pxa27x-sa1100-rtc.patch  |  29 --
>  .../linux/linux-yocto-3.4/sharpsl_param.patch      |  24 --
>  .../linux/linux-yocto-3.4/spi-pxa2xx-fix-mem.patch |  34 --
>  .../linux/linux-yocto-3.4/spitz/spitz-standard.scc |   7 -
>  .../linux/linux-yocto-3.4/spitz/spitz.cfg          |  67 ----
>  .../linux/linux-yocto-3.4/spitz/spitz.scc          |  10 -
>  .../linux/linux-yocto-3.4/spitz_pm.patch           |  53 ---
>  .../linux/linux-yocto-3.4/tosa/tosa-standard.scc   |   7 -
>  recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg |  62 ----
>  recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.scc |  10 -
>  .../linux/linux-yocto-3.4/zaurus-common.scc        |  10 -
>  .../linux/linux-yocto-3.4/zaurus-hardware.cfg      | 279 --------------
>  .../linux/linux-yocto-3.4/zaurus-non-hardware.cfg  | 401
> --------------------- .../linux-yocto-3.4/zaurus-pxa-common-non-hw.cfg   | 
>  9 -
>  .../linux/linux-yocto-3.4/zaurus-pxa-common.cfg    |  98 -----
>  .../linux/linux-yocto-3.4/zaurus-pxa-only.scc      |   2 -
>  .../linux/linux-yocto-3.4/zaurus-usb-host.scc      |   6 -
>  .../linux-yocto-3.4/zaurus-usb-ohci-non-hw.cfg     |   4 -
>  .../linux/linux-yocto-3.4/zaurus-usb-ohci.cfg      | 110 ------
>  .../linux/linux-yocto-3.8/akita/akita-standard.scc |   7 +
>  .../linux/linux-yocto-3.8/akita/akita.cfg          |   4 +
>  .../linux/linux-yocto-3.8/akita/akita.scc          |  11 +
>  .../linux/linux-yocto-3.8/c7x0/c7x0-standard.scc   |   7 +
>  recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.cfg |  52 +++
>  recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc |   8 +
>  .../linux/linux-yocto-3.8/collie-eraseinfo.patch   |  31 ++
>  .../linux/linux-yocto-3.8/collie-jedec-probe.patch |  11 +
>  .../linux-yocto-3.8/collie/collie-standard.scc     |   7 +
>  .../linux/linux-yocto-3.8/collie/collie.cfg        | 118 ++++++
>  .../linux/linux-yocto-3.8/collie/collie.scc        |   8 +
>  .../linux/linux-yocto-3.8/feature-top.scc          |   1 +
>  .../linux-yocto-3.8/locomo_kbd_tweak-r2.patch      |  75 ++++
>  .../linux/linux-yocto-3.8/mcp-device.patch         |  13 +
>  .../linux-yocto-3.8/poodle/poodle-standard.scc     |   7 +
>  .../linux/linux-yocto-3.8/poodle/poodle.cfg        |  57 +++
>  .../linux/linux-yocto-3.8/poodle/poodle.scc        |   8 +
>  .../linux/linux-yocto-3.8/pxa27x-sa1100-rtc.patch  |  34 ++
>  .../linux/linux-yocto-3.8/sharpsl_param.patch      |  24 ++
>  .../linux/linux-yocto-3.8/spi-pxa2xx-fix-mem.patch |  34 ++
>  .../linux/linux-yocto-3.8/spitz/spitz-standard.scc |   7 +
>  .../linux/linux-yocto-3.8/spitz/spitz.cfg          |  61 ++++
>  .../linux/linux-yocto-3.8/spitz/spitz.scc          |  10 +
>  .../linux/linux-yocto-3.8/spitz_pm.patch           |  53 +++
>  .../linux/linux-yocto-3.8/tosa/tosa-standard.scc   |   7 +
>  recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.cfg |  57 +++
>  recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc |   8 +
>  .../linux/linux-yocto-3.8/zaurus-common.scc        |  10 +
>  .../linux/linux-yocto-3.8/zaurus-hardware.cfg      | 279 ++++++++++++++
>  .../linux/linux-yocto-3.8/zaurus-non-hardware.cfg  | 400
> ++++++++++++++++++++ .../linux-yocto-3.8/zaurus-pxa-common-non-hw.cfg   |  
> 9 +
>  .../linux/linux-yocto-3.8/zaurus-pxa-common.cfg    | 111 ++++++
>  .../linux/linux-yocto-3.8/zaurus-pxa-only.scc      |   2 +
>  .../linux/linux-yocto-3.8/zaurus-usb-host.scc      |   6 +
>  .../linux-yocto-3.8/zaurus-usb-ohci-non-hw.cfg     |   4 +
>  .../linux/linux-yocto-3.8/zaurus-usb-ohci.cfg      | 110 ++++++
>  .../collie/collie-eraseinfo.patch                  |  28 +-
>  .../collie/collie-kexecboot.cfg                    |   4 +-
>  .../spitz/3200-mtd.patch                           |  13 +
>  recipes-kernel/linux/linux-yocto_3.4.bbappend      |  54 ---
>  recipes-kernel/linux/linux-yocto_3.8.bbappend      |  54 +++
>  78 files changed, 1770 insertions(+), 1711 deletions(-)
>  delete mode 100644
> recipes-kernel/linux/linux-yocto-3.4/akita/akita-standard.scc delete mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg delete mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/akita/akita.scc delete mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0-standard.scc delete
> mode 100644 recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg delete mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.scc delete mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/collie/collie-standard.scc
> delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/collie/collie.cfg
> delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/collie/collie.scc
> delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/feature-top.scc
> delete mode 100644
> recipes-kernel/linux/linux-yocto-3.4/locomo_kbd_tweak-r2.patch delete mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/poodle/poodle-standard.scc
> delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.cfg
> delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.scc
> delete mode 100644
> recipes-kernel/linux/linux-yocto-3.4/pxa25x-gpio-wakeup.patch delete mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/pxa25x-sa1100-rtc.patch delete
> mode 100644 recipes-kernel/linux/linux-yocto-3.4/pxa27x-sa1100-rtc.patch
> delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/sharpsl_param.patch
> delete mode 100644
> recipes-kernel/linux/linux-yocto-3.4/spi-pxa2xx-fix-mem.patch delete mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/spitz/spitz-standard.scc delete
> mode 100644 recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.cfg delete
> mode 100644 recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.scc delete
> mode 100644 recipes-kernel/linux/linux-yocto-3.4/spitz_pm.patch delete mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/tosa/tosa-standard.scc delete
> mode 100644 recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg delete mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.scc delete mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-common.scc delete mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg delete mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-non-hardware.cfg delete
> mode 100644
> recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common-non-hw.cfg delete
> mode 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common.cfg
> delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-only.scc
> delete mode 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-usb-host.scc
> delete mode 100644
> recipes-kernel/linux/linux-yocto-3.4/zaurus-usb-ohci-non-hw.cfg delete mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-usb-ohci.cfg create mode
> 100644 recipes-kernel/linux/linux-yocto-3.8/REGULATORS create mode 100644
> recipes-kernel/linux/linux-yocto-3.8/akita/akita-standard.scc create mode
> 100644 recipes-kernel/linux/linux-yocto-3.8/akita/akita.cfg create mode
> 100644 recipes-kernel/linux/linux-yocto-3.8/akita/akita.scc create mode
> 100644 recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0-standard.scc create
> mode 100644 recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.cfg create mode
> 100644 recipes-kernel/linux/linux-yocto-3.8/c7x0/c7x0.scc create mode
> 100644 recipes-kernel/linux/linux-yocto-3.8/collie-eraseinfo.patch create
> mode 100644 recipes-kernel/linux/linux-yocto-3.8/collie-jedec-probe.patch
> create mode 100644
> recipes-kernel/linux/linux-yocto-3.8/collie/collie-standard.scc create mode
> 100644 recipes-kernel/linux/linux-yocto-3.8/collie/collie.cfg create mode
> 100644 recipes-kernel/linux/linux-yocto-3.8/collie/collie.scc create mode
> 100644 recipes-kernel/linux/linux-yocto-3.8/feature-top.scc create mode
> 100644 recipes-kernel/linux/linux-yocto-3.8/locomo_kbd_tweak-r2.patch
> create mode 100644 recipes-kernel/linux/linux-yocto-3.8/mcp-device.patch
> create mode 100644
> recipes-kernel/linux/linux-yocto-3.8/poodle/poodle-standard.scc create mode
> 100644 recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.cfg create mode
> 100644 recipes-kernel/linux/linux-yocto-3.8/poodle/poodle.scc create mode
> 100644 recipes-kernel/linux/linux-yocto-3.8/pxa27x-sa1100-rtc.patch create
> mode 100644 recipes-kernel/linux/linux-yocto-3.8/sharpsl_param.patch create
> mode 100644 recipes-kernel/linux/linux-yocto-3.8/spi-pxa2xx-fix-mem.patch
> create mode 100644
> recipes-kernel/linux/linux-yocto-3.8/spitz/spitz-standard.scc create mode
> 100644 recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.cfg create mode
> 100644 recipes-kernel/linux/linux-yocto-3.8/spitz/spitz.scc create mode
> 100644 recipes-kernel/linux/linux-yocto-3.8/spitz_pm.patch create mode
> 100644 recipes-kernel/linux/linux-yocto-3.8/tosa/tosa-standard.scc create
> mode 100644 recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.cfg create mode
> 100644 recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc create mode
> 100644 recipes-kernel/linux/linux-yocto-3.8/zaurus-common.scc create mode
> 100644 recipes-kernel/linux/linux-yocto-3.8/zaurus-hardware.cfg create mode
> 100644 recipes-kernel/linux/linux-yocto-3.8/zaurus-non-hardware.cfg create
> mode 100644
> recipes-kernel/linux/linux-yocto-3.8/zaurus-pxa-common-non-hw.cfg create
> mode 100644 recipes-kernel/linux/linux-yocto-3.8/zaurus-pxa-common.cfg
> create mode 100644 recipes-kernel/linux/linux-yocto-3.8/zaurus-pxa-only.scc
> create mode 100644 recipes-kernel/linux/linux-yocto-3.8/zaurus-usb-host.scc
> create mode 100644
> recipes-kernel/linux/linux-yocto-3.8/zaurus-usb-ohci-non-hw.cfg create mode
> 100644 recipes-kernel/linux/linux-yocto-3.8/zaurus-usb-ohci.cfg create mode
> 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/spitz/3200-mtd.patch
> delete mode 100644 recipes-kernel/linux/linux-yocto_3.4.bbappend
>  create mode 100644 recipes-kernel/linux/linux-yocto_3.8.bbappend

Merged, thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


