Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TRB4h-0005x9-22
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2012 02:13:27 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 Oct 2012 16:59:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,643,1344236400"; d="scan'208";a="208923548"
Received: from unknown (HELO helios.localnet) ([10.252.122.104])
	by azsmga001.ch.intel.com with ESMTP; 24 Oct 2012 16:59:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Oct 2012 00:59:55 +0100
Message-ID: <2047014.ZCupCGhGcJ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <1349814502-1649-1-git-send-email-andrea.adami@gmail.com>
References: <1349814502-1649-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld] [PATCH] linux-yocto_3.2: move to its specific directory
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
X-List-Received-Date: Thu, 25 Oct 2012 00:13:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 09 October 2012 22:28:22 Andrea Adami wrote:
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../linux/linux-yocto-3.2/akita/akita-standard.scc |   13 +
>  .../linux/linux-yocto-3.2/akita/akita.cfg          | 2692
> +++++++++++++++++++
> .../linux/linux-yocto-3.2/c7x0/c7x0-standard.scc   |   13 +
>  recipes-kernel/linux/linux-yocto-3.2/c7x0/c7x0.cfg | 2412
> ++++++++++++++++++ ...xx_sharpsl-retain-ops-structure-on-collie.patch
> |   34 +
>  .../linux-yocto-3.2/collie/collie-standard.scc     |   13 +
>  .../linux/linux-yocto-3.2/collie/collie.cfg        | 2420
> ++++++++++++++++++
> .../collie/collie_remove_irq_to_gpio.patch         |   31 +
>  .../collie/locomo_kbd_tweak-r2.patch               |   80 +
>  .../poodle/locomo_kbd_tweak-r2.patch               |   80 +
>  .../linux-yocto-3.2/poodle/poodle-standard.scc     |   13 +
>  .../linux/linux-yocto-3.2/poodle/poodle.cfg        | 2422
> ++++++++++++++++++ .../linux/linux-yocto-3.2/spitz/spitz-standard.scc
> |   13 +
>  .../linux/linux-yocto-3.2/spitz/spitz.cfg          | 2691
> +++++++++++++++++++
> .../linux/linux-yocto-3.2/tosa/tosa-standard.scc   |   13 +
>  recipes-kernel/linux/linux-yocto-3.2/tosa/tosa.cfg | 2694
> ++++++++++++++++++++
> .../linux/linux-yocto/akita/akita-standard.scc     |   13 -
>  recipes-kernel/linux/linux-yocto/akita/akita.cfg   | 2692
> -------------------
> .../linux/linux-yocto/c7x0/c7x0-standard.scc       |   13 -
>  recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg     | 2412
> ------------------ ...xx_sharpsl-retain-ops-structure-on-collie.patch
> |   34 -
>  .../linux/linux-yocto/collie/collie-standard.scc   |   13 -
>  recipes-kernel/linux/linux-yocto/collie/collie.cfg | 2420
> ------------------
> .../collie/collie_remove_irq_to_gpio.patch         |   31 -
>  .../linux-yocto/collie/locomo_kbd_tweak-r2.patch   |   80 -
>  .../linux-yocto/poodle/locomo_kbd_tweak-r2.patch   |   80 -
>  .../linux/linux-yocto/poodle/poodle-standard.scc   |   13 -
>  recipes-kernel/linux/linux-yocto/poodle/poodle.cfg | 2422
> ------------------
> .../linux/linux-yocto/spitz/spitz-standard.scc     |   13 -
>  recipes-kernel/linux/linux-yocto/spitz/spitz.cfg   | 2691
> -------------------
> .../linux/linux-yocto/tosa/tosa-standard.scc       |   13 -
>  recipes-kernel/linux/linux-yocto/tosa/tosa.cfg     | 2694
> --------------------
> recipes-kernel/linux/linux-yocto_3.2.bbappend      |    2 +-
>  33 files changed, 15635 insertions(+), 15635 deletions(-)
>  create mode 100644
> recipes-kernel/linux/linux-yocto-3.2/akita/akita-standard.scc create mode
> 100644 recipes-kernel/linux/linux-yocto-3.2/akita/akita.cfg create mode
> 100644 recipes-kernel/linux/linux-yocto-3.2/c7x0/c7x0-standard.scc create
> mode 100644 recipes-kernel/linux/linux-yocto-3.2/c7x0/c7x0.cfg create mode
> 100644
> recipes-kernel/linux/linux-yocto-3.2/collie/0001-pcmcia-pxa2xx_sharpsl-reta
> in-ops-structure-on-collie.patch create mode 100644
> recipes-kernel/linux/linux-yocto-3.2/collie/collie-standard.scc create mode
> 100644 recipes-kernel/linux/linux-yocto-3.2/collie/collie.cfg create mode
> 100644
> recipes-kernel/linux/linux-yocto-3.2/collie/collie_remove_irq_to_gpio.patch
> create mode 100644
> recipes-kernel/linux/linux-yocto-3.2/collie/locomo_kbd_tweak-r2.patch
> create mode 100644
> recipes-kernel/linux/linux-yocto-3.2/poodle/locomo_kbd_tweak-r2.patch
> create mode 100644
> recipes-kernel/linux/linux-yocto-3.2/poodle/poodle-standard.scc create mode
> 100644 recipes-kernel/linux/linux-yocto-3.2/poodle/poodle.cfg create mode
> 100644 recipes-kernel/linux/linux-yocto-3.2/spitz/spitz-standard.scc create
> mode 100644 recipes-kernel/linux/linux-yocto-3.2/spitz/spitz.cfg create
> mode 100644 recipes-kernel/linux/linux-yocto-3.2/tosa/tosa-standard.scc
> create mode 100644 recipes-kernel/linux/linux-yocto-3.2/tosa/tosa.cfg
> delete mode 100644
> recipes-kernel/linux/linux-yocto/akita/akita-standard.scc delete mode
> 100644 recipes-kernel/linux/linux-yocto/akita/akita.cfg delete mode 100644
> recipes-kernel/linux/linux-yocto/c7x0/c7x0-standard.scc delete mode 100644
> recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg delete mode 100644
> recipes-kernel/linux/linux-yocto/collie/0001-pcmcia-pxa2xx_sharpsl-retain-o
> ps-structure-on-collie.patch delete mode 100644
> recipes-kernel/linux/linux-yocto/collie/collie-standard.scc delete mode
> 100644 recipes-kernel/linux/linux-yocto/collie/collie.cfg delete mode
> 100644
> recipes-kernel/linux/linux-yocto/collie/collie_remove_irq_to_gpio.patch
> delete mode 100644
> recipes-kernel/linux/linux-yocto/collie/locomo_kbd_tweak-r2.patch delete
> mode 100644
> recipes-kernel/linux/linux-yocto/poodle/locomo_kbd_tweak-r2.patch delete
> mode 100644 recipes-kernel/linux/linux-yocto/poodle/poodle-standard.scc
> delete mode 100644 recipes-kernel/linux/linux-yocto/poodle/poodle.cfg
> delete mode 100644
> recipes-kernel/linux/linux-yocto/spitz/spitz-standard.scc delete mode
> 100644 recipes-kernel/linux/linux-yocto/spitz/spitz.cfg delete mode 100644
> recipes-kernel/linux/linux-yocto/tosa/tosa-standard.scc delete mode 100644
> recipes-kernel/linux/linux-yocto/tosa/tosa.cfg

Merged to meta-handheld master, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


