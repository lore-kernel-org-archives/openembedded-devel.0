Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SMIvS-0000A2-HC
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Apr 2012 15:03:31 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Apr 2012 05:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="92074294"
Received: from unknown (HELO helios.localnet) ([10.252.120.11])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Apr 2012 05:53:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Mon, 23 Apr 2012 13:53:53 +0100
Message-ID: <2508700.eu29Ybm7TQ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.0.0-17-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <cover.1335132155.git.andrea.adami@gmail.com>
References: <cover.1335132155.git.andrea.adami@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH 0/3] Zaurus: (ab)use of linux-yocto as virtual/kernel
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
X-List-Received-Date: Mon, 23 Apr 2012 13:03:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 23 April 2012 00:19:47 Andrea Adami wrote:
> * This series of patches does the initial commit of
> * the linux-yocto-* recipes for the meta-handheld layer.
> * With minor refinements, the kernel configuration tools used by
> * the Yocto Project could allow us to have a modular managed kernel.
> * The 'production' kernel is based on linux-yocto while the
> * 'kexecboot powered' is based on linux-yocto-tiny.
> * Unfortunately the configuration tools are requiring one
> * directory for each machine containing all required .scc, .cfg and
> * patches (there are other ways but keep it simple at the beginning).
> * Tested on Zaurus (c7x0, poodle, spitz).
> * The linux-yocto-tiny-kexecboot does not build atm because of a
> * klibc incompatibility.
> * Patch for klibc unlocking the new yocto-based kernel will be sent
> * separately.
> 
> Andrea Adami (3):
>   linux-yocto: initial commit of v. 3.2 for Zaurus
>   linux-yocto-tiny-kexecboot: initial commit of v. 3.2 for Zaurus
>   zaurus: use linux-yocto as virtual/kernel
> 
>  conf/machine/include/zaurus.inc                    |    2 +-
>  .../akita/akita-kexecboot.cfg                      | 1698 ++++++++++++
>  .../akita/akita-tiny.scc                           |    7 +
>  .../akita/revert-check-on-console-device.patch     |   41 +
>  .../c7x0/c7x0-kexecboot.cfg                        | 1692 ++++++++++++
>  .../linux-yocto-tiny-kexecboot/c7x0/c7x0-tiny.scc  |    7 +
>  .../c7x0/revert-check-on-console-device.patch      |   41 +
>  ...xx_sharpsl-retain-ops-structure-on-collie.patch |   34 +
>  .../collie/collie-kexecboot.cfg                    | 1596 ++++++++++++
>  .../collie/collie-tiny.scc                         |    7 +
>  .../collie/collie_remove_irq_to_gpio.patch         |   31 +
>  .../collie/locomo_kbd_tweak-r2.patch               |   80 +
>  .../collie/revert-check-on-console-device.patch    |   41 +
>  .../poodle/locomo_kbd_tweak-r2.patch               |   80 +
>  .../poodle/poodle-kexecboot.cfg                    | 1600 ++++++++++++
>  .../poodle/poodle-tiny.scc                         |    7 +
>  .../poodle/revert-check-on-console-device.patch    |   41 +
>  .../spitz/revert-check-on-console-device.patch     |   41 +
>  .../spitz/spitz-kexecboot.cfg                      | 1697 ++++++++++++
>  .../spitz/spitz-tiny.scc                           |    7 +
>  .../tosa/revert-check-on-console-device.patch      |   41 +
>  .../tosa/tosa-kexecboot.cfg                        | 1601 ++++++++++++
>  .../linux-yocto-tiny-kexecboot/tosa/tosa-tiny.scc  |    7 +
>  .../linux/linux-yocto-tiny-kexecboot_3.2.bbappend  |   71 +
>  .../linux/linux-yocto/akita/akita-standard.scc     |   13 +
>  recipes-kernel/linux/linux-yocto/akita/akita.cfg   | 2692
> +++++++++++++++++++ .../linux/linux-yocto/c7x0/c7x0-standard.scc       |  
> 13 +
>  recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg     | 2412
> ++++++++++++++++++ ...xx_sharpsl-retain-ops-structure-on-collie.patch |  
> 34 +
>  .../linux/linux-yocto/collie/collie-standard.scc   |   13 +
>  recipes-kernel/linux/linux-yocto/collie/collie.cfg | 2420
> ++++++++++++++++++ .../collie/collie_remove_irq_to_gpio.patch         |  
> 31 +
>  .../linux-yocto/collie/locomo_kbd_tweak-r2.patch   |   80 +
>  .../linux-yocto/poodle/locomo_kbd_tweak-r2.patch   |   80 +
>  .../linux/linux-yocto/poodle/poodle-standard.scc   |   13 +
>  recipes-kernel/linux/linux-yocto/poodle/poodle.cfg | 2422
> ++++++++++++++++++ .../linux/linux-yocto/spitz/spitz-standard.scc     |  
> 13 +
>  recipes-kernel/linux/linux-yocto/spitz/spitz.cfg   | 2691
> +++++++++++++++++++ .../linux/linux-yocto/tosa/tosa-standard.scc       |  
> 13 +
>  recipes-kernel/linux/linux-yocto/tosa/tosa.cfg     | 2694
> ++++++++++++++++++++ recipes-kernel/linux/linux-yocto_3.2.bbappend      |  
> 57 +
>  41 files changed, 26160 insertions(+), 1 deletions(-)
>  create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/akita/akita-kexecboot.cfg
> create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/akita/akita-tiny.scc create
> mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/akita/revert-check-on-conso
> le-device.patch create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/c7x0/c7x0-kexecboot.cfg
> create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/c7x0/c7x0-tiny.scc create
> mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/c7x0/revert-check-on-consol
> e-device.patch create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/collie/0001-pcmcia-pxa2xx_s
> harpsl-retain-ops-structure-on-collie.patch create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/collie/collie-kexecboot.cfg
> create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/collie/collie-tiny.scc
> create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/collie/collie_remove_irq_to
> _gpio.patch create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/collie/locomo_kbd_tweak-r2.
> patch create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/collie/revert-check-on-cons
> ole-device.patch create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/poodle/locomo_kbd_tweak-r2.
> patch create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/poodle/poodle-kexecboot.cfg
> create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/poodle/poodle-tiny.scc
> create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/poodle/revert-check-on-cons
> ole-device.patch create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/spitz/revert-check-on-conso
> le-device.patch create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/spitz/spitz-kexecboot.cfg
> create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/spitz/spitz-tiny.scc create
> mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/tosa/revert-check-on-consol
> e-device.patch create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/tosa/tosa-kexecboot.cfg
> create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/tosa/tosa-tiny.scc create
> mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bbappend
> create mode 100644
> recipes-kernel/linux/linux-yocto/akita/akita-standard.scc create mode
> 100644 recipes-kernel/linux/linux-yocto/akita/akita.cfg create mode 100644
> recipes-kernel/linux/linux-yocto/c7x0/c7x0-standard.scc create mode 100644
> recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg create mode 100644
> recipes-kernel/linux/linux-yocto/collie/0001-pcmcia-pxa2xx_sharpsl-retain-o
> ps-structure-on-collie.patch create mode 100644
> recipes-kernel/linux/linux-yocto/collie/collie-standard.scc create mode
> 100644 recipes-kernel/linux/linux-yocto/collie/collie.cfg create mode
> 100644
> recipes-kernel/linux/linux-yocto/collie/collie_remove_irq_to_gpio.patch
> create mode 100644
> recipes-kernel/linux/linux-yocto/collie/locomo_kbd_tweak-r2.patch create
> mode 100644
> recipes-kernel/linux/linux-yocto/poodle/locomo_kbd_tweak-r2.patch create
> mode 100644 recipes-kernel/linux/linux-yocto/poodle/poodle-standard.scc
> create mode 100644 recipes-kernel/linux/linux-yocto/poodle/poodle.cfg
> create mode 100644
> recipes-kernel/linux/linux-yocto/spitz/spitz-standard.scc create mode
> 100644 recipes-kernel/linux/linux-yocto/spitz/spitz.cfg create mode 100644
> recipes-kernel/linux/linux-yocto/tosa/tosa-standard.scc create mode 100644
> recipes-kernel/linux/linux-yocto/tosa/tosa.cfg create mode 100644
> recipes-kernel/linux/linux-yocto_3.2.bbappend

Merged to meta-handheld master, thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


