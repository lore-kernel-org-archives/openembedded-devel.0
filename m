Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Tft1M-0006MN-OJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 14:58:49 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Dec 2012 05:44:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,215,1355126400"; d="scan'208";a="228757073"
Received: from unknown (HELO helios.localnet) ([10.252.122.195])
	by orsmga001.jf.intel.com with ESMTP; 04 Dec 2012 05:44:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 04 Dec 2012 13:44:23 +0000
Message-ID: <3825646.aQZl1lGs07@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-18-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <1354318947-12109-1-git-send-email-andrea.adami@gmail.com>
References: <1354318947-12109-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld][PATCH] linux-yocto_3.4: initial commit for Zaurus
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
X-List-Received-Date: Tue, 04 Dec 2012 13:58:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 01 December 2012 00:42:27 Andrea Adami wrote:
> * based on linux-yocto-standard cfg fragments
> * kernel 3.4 boots though size is too big
> * put together pending/submitted patches
> * for the moment DEFAULT_PREFERENCE = "-1"
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../linux/linux-yocto-3.4/akita/akita-standard.scc |    7 +
>  .../linux/linux-yocto-3.4/akita/akita.cfg          |   81 ++++
>  .../linux/linux-yocto-3.4/akita/akita.scc          |   10 +
>  .../linux/linux-yocto-3.4/c7x0/c7x0-standard.scc   |    7 +
>  recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg |   70 ++++
>  recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.scc |   10 +
>  ...xx_sharpsl-retain-ops-structure-on-collie.patch |   34 ++
>  .../linux-yocto-3.4/collie/collie-standard.scc     |    7 +
>  .../linux/linux-yocto-3.4/collie/collie.cfg        |   84 +++++
>  .../linux/linux-yocto-3.4/collie/collie.scc        |    6 +
>  .../collie/locomo_kbd_tweak-r2.patch               |   80 ++++
>  .../linux/linux-yocto-3.4/feature-top.scc          |    1 +
>  .../poodle/locomo_kbd_tweak-r2.patch               |   80 ++++
>  .../linux-yocto-3.4/poodle/poodle-standard.scc     |    7 +
>  .../linux/linux-yocto-3.4/poodle/poodle.cfg        |   75 ++++
>  .../linux/linux-yocto-3.4/poodle/poodle.scc        |   10 +
>  .../linux/linux-yocto-3.4/pxa25x-gpio-wakeup.patch |   40 ++
>  .../linux/linux-yocto-3.4/pxa25x-sa1100-rtc.patch  |   29 ++
>  .../linux/linux-yocto-3.4/pxa27x-sa1100-rtc.patch  |   29 ++
>  .../linux/linux-yocto-3.4/sharpsl_param.patch      |   24 ++
>  .../linux/linux-yocto-3.4/spi-pxa2xx-fix-mem.patch |   34 ++
>  .../linux/linux-yocto-3.4/spitz/spitz-standard.scc |    7 +
>  .../linux/linux-yocto-3.4/spitz/spitz.cfg          |   80 ++++
>  .../linux/linux-yocto-3.4/spitz/spitz.scc          |   10 +
>  .../linux/linux-yocto-3.4/spitz_pm.patch           |   53 +++
>  .../linux/linux-yocto-3.4/tosa/tosa-standard.scc   |    7 +
>  recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg |   75 ++++
>  recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.scc |   10 +
>  .../linux/linux-yocto-3.4/zaurus-common.scc        |   10 +
>  .../linux/linux-yocto-3.4/zaurus-hardware.cfg      |  255 +++++++++++++
>  .../linux/linux-yocto-3.4/zaurus-non-hardware.cfg  |  394
> ++++++++++++++++++++
> .../linux-yocto-3.4/zaurus-pxa-common-non-hw.cfg   |    9 +
>  .../linux/linux-yocto-3.4/zaurus-pxa-common.cfg    |   98 +++++
>  .../linux/linux-yocto-3.4/zaurus-pxa-only.scc      |    2 +
>  .../linux/linux-yocto-3.4/zaurus-usb-host.scc      |    6 +
>  .../linux-yocto-3.4/zaurus-usb-ohci-non-hw.cfg     |    4 +
>  .../linux/linux-yocto-3.4/zaurus-usb-ohci.cfg      |  110 ++++++
>  recipes-kernel/linux/linux-yocto_3.4.bbappend      |   49 +++
>  38 files changed, 1904 insertions(+), 0 deletions(-)
>  create mode 100644
> recipes-kernel/linux/linux-yocto-3.4/akita/akita-standard.scc create mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg create mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/akita/akita.scc create mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0-standard.scc create
> mode 100644 recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg create mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.scc create mode
> 100644
> recipes-kernel/linux/linux-yocto-3.4/collie/0001-pcmcia-pxa2xx_sharpsl-reta
> in-ops-structure-on-collie.patch create mode 100644
> recipes-kernel/linux/linux-yocto-3.4/collie/collie-standard.scc create mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/collie/collie.cfg create mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/collie/collie.scc create mode
> 100644
> recipes-kernel/linux/linux-yocto-3.4/collie/locomo_kbd_tweak-r2.patch
> create mode 100644 recipes-kernel/linux/linux-yocto-3.4/feature-top.scc
> create mode 100644
> recipes-kernel/linux/linux-yocto-3.4/poodle/locomo_kbd_tweak-r2.patch
> create mode 100644
> recipes-kernel/linux/linux-yocto-3.4/poodle/poodle-standard.scc create mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.cfg create mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.scc create mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/pxa25x-gpio-wakeup.patch create
> mode 100644 recipes-kernel/linux/linux-yocto-3.4/pxa25x-sa1100-rtc.patch
> create mode 100644
> recipes-kernel/linux/linux-yocto-3.4/pxa27x-sa1100-rtc.patch create mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/sharpsl_param.patch create mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/spi-pxa2xx-fix-mem.patch create
> mode 100644 recipes-kernel/linux/linux-yocto-3.4/spitz/spitz-standard.scc
> create mode 100644 recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.cfg
> create mode 100644 recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.scc
> create mode 100644 recipes-kernel/linux/linux-yocto-3.4/spitz_pm.patch
> create mode 100644
> recipes-kernel/linux/linux-yocto-3.4/tosa/tosa-standard.scc create mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg create mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.scc create mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-common.scc create mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg create mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-non-hardware.cfg create
> mode 100644
> recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common-non-hw.cfg create
> mode 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common.cfg
> create mode 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-only.scc
> create mode 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-usb-host.scc
> create mode 100644
> recipes-kernel/linux/linux-yocto-3.4/zaurus-usb-ohci-non-hw.cfg create mode
> 100644 recipes-kernel/linux/linux-yocto-3.4/zaurus-usb-ohci.cfg create mode
> 100644 recipes-kernel/linux/linux-yocto_3.4.bbappend

Merged to meta-handheld master, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


