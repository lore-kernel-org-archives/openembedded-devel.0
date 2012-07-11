Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sp4Yw-000778-TM
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Jul 2012 23:35:11 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Jul 2012 14:23:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="121320565"
Received: from unknown (HELO helios.localnet) ([10.252.121.5])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Jul 2012 14:23:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Jul 2012 22:23:56 +0100
Message-ID: <13558616.icoKLKkeqh@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <cover.1341875525.git.andrea.adami@gmail.com>
References: <cover.1341875525.git.andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld][PATCH 0/5] Zaurus kernel cleanings and tuning
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
X-List-Received-Date: Wed, 11 Jul 2012 21:35:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 10 July 2012 01:22:34 Andrea Adami wrote:
>  * remove obsolete recipe
>  * update linux-yocto kernels for UBI support
> 
> Andrea Adami (5):
>   linux_3.1: remove obsoleted Zaurus defconfig
>   linux_3.2: remove obsolete recipe and defconfigs (was Zaurus-only)
>   linux_git: remove unused obsolete recipe (was for Zaurus spitz)
>   linux-yocto: unset CONFIG_MTD_NAND_VERIFY_WRITE for Zaurus
>   linux-yocto-tiny-kexecboot: unset CONFIG_MTD_NAND_VERIFY_WRITE for
>     Zaurus
> 
>  ...xx_sharpsl-retain-ops-structure-on-collie.patch |   34 --
>  recipes-kernel/linux/linux-3.1/akita/defconfig     |  379
> ------------------- recipes-kernel/linux/linux-3.1/c7x0/defconfig      | 
> 316 ---------------- recipes-kernel/linux/linux-3.1/collie/defconfig    | 
> 322 ----------------- .../linux/linux-3.1/locomo_kbd_tweak-r2.patch      | 
>  66 ----
>  recipes-kernel/linux/linux-3.1/poodle/defconfig    |  317 ----------------
>  recipes-kernel/linux/linux-3.1/spitz/defconfig     |  378
> ------------------- recipes-kernel/linux/linux-3.1/tosa/defconfig      | 
> 379 ------------------- ...xx_sharpsl-retain-ops-structure-on-collie.patch
> |   34 --
>  recipes-kernel/linux/linux-3.2/akita/defconfig     |  375
> ------------------- recipes-kernel/linux/linux-3.2/c7x0/defconfig      | 
> 312 ---------------- recipes-kernel/linux/linux-3.2/collie/defconfig    | 
> 319 ---------------- .../linux-3.2/collie_remove_irq_to_gpio.patch      |  
> 31 --
>  .../linux/linux-3.2/locomo_kbd_tweak-r2.patch      |   66 ----
>  recipes-kernel/linux/linux-3.2/poodle/defconfig    |  314 ----------------
>  recipes-kernel/linux/linux-3.2/spitz/defconfig     |  374
> ------------------- recipes-kernel/linux/linux-3.2/tosa/defconfig      | 
> 376 ------------------- .../akita/akita-kexecboot.cfg                     
> |    2 +-
>  .../c7x0/c7x0-kexecboot.cfg                        |    2 +-
>  .../collie/collie-kexecboot.cfg                    |    2 +-
>  .../poodle/poodle-kexecboot.cfg                    |    2 +-
>  .../spitz/spitz-kexecboot.cfg                      |    2 +-
>  .../tosa/tosa-kexecboot.cfg                        |    2 +-
>  recipes-kernel/linux/linux-yocto/akita/akita.cfg   |    2 +-
>  recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg     |    2 +-
>  recipes-kernel/linux/linux-yocto/collie/collie.cfg |    2 +-
>  recipes-kernel/linux/linux-yocto/poodle/poodle.cfg |    2 +-
>  recipes-kernel/linux/linux-yocto/spitz/spitz.cfg   |    2 +-
>  recipes-kernel/linux/linux-yocto/tosa/tosa.cfg     |    2 +-
>  recipes-kernel/linux/linux/spitz/defconfig         |  380
> -------------------- recipes-kernel/linux/linux_3.1.bb                  |  
> 13 +-
>  recipes-kernel/linux/linux_3.2.bb                  |   25 --
>  recipes-kernel/linux/linux_git.bb                  |   26 --
>  33 files changed, 14 insertions(+), 4846 deletions(-)
>  delete mode 100644
> recipes-kernel/linux/linux-3.1/0001-pcmcia-pxa2xx_sharpsl-retain-ops-struct
> ure-on-collie.patch delete mode 100644
> recipes-kernel/linux/linux-3.1/akita/defconfig delete mode 100644
> recipes-kernel/linux/linux-3.1/c7x0/defconfig
>  delete mode 100644 recipes-kernel/linux/linux-3.1/collie/defconfig
>  delete mode 100644 recipes-kernel/linux/linux-3.1/locomo_kbd_tweak-r2.patch
> delete mode 100644 recipes-kernel/linux/linux-3.1/poodle/defconfig delete
> mode 100644 recipes-kernel/linux/linux-3.1/spitz/defconfig delete mode
> 100644 recipes-kernel/linux/linux-3.1/tosa/defconfig
>  delete mode 100644
> recipes-kernel/linux/linux-3.2/0001-pcmcia-pxa2xx_sharpsl-retain-ops-struct
> ure-on-collie.patch delete mode 100644
> recipes-kernel/linux/linux-3.2/akita/defconfig delete mode 100644
> recipes-kernel/linux/linux-3.2/c7x0/defconfig
>  delete mode 100644 recipes-kernel/linux/linux-3.2/collie/defconfig
>  delete mode 100644
> recipes-kernel/linux/linux-3.2/collie_remove_irq_to_gpio.patch delete mode
> 100644 recipes-kernel/linux/linux-3.2/locomo_kbd_tweak-r2.patch delete mode
> 100644 recipes-kernel/linux/linux-3.2/poodle/defconfig delete mode 100644
> recipes-kernel/linux/linux-3.2/spitz/defconfig delete mode 100644
> recipes-kernel/linux/linux-3.2/tosa/defconfig
>  delete mode 100644 recipes-kernel/linux/linux/spitz/defconfig
>  delete mode 100644 recipes-kernel/linux/linux_3.2.bb
>  delete mode 100644 recipes-kernel/linux/linux_git.bb

Merged to meta-handheld master, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


