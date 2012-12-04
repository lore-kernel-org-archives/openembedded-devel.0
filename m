Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Tft0c-0006IP-Pm
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 14:58:03 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Dec 2012 05:43:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,215,1355126400"; d="scan'208";a="257090448"
Received: from unknown (HELO helios.localnet) ([10.252.122.195])
	by fmsmga001.fm.intel.com with ESMTP; 04 Dec 2012 05:43:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 04 Dec 2012 13:43:36 +0000
Message-ID: <3890508.g34nZdoGl2@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-18-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <1354315190-22852-1-git-send-email-andrea.adami@gmail.com>
References: <1354315190-22852-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld][PATCH] linux-yocto-tiny-kexecboot_3.2: move it to its specific directory
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
X-List-Received-Date: Tue, 04 Dec 2012 13:58:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 30 November 2012 23:39:50 Andrea Adami wrote:
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../akita/akita-kexecboot.cfg                      | 1698
> ++++++++++++++++++++
> .../akita/akita-tiny.scc                           |    7 +
>  .../akita/revert-check-on-console-device.patch     |   41 +
>  .../c7x0/c7x0-kexecboot.cfg                        | 1692
> +++++++++++++++++++
> .../c7x0/c7x0-tiny.scc                             |    7 +
>  .../c7x0/revert-check-on-console-device.patch      |   41 +
>  ...xx_sharpsl-retain-ops-structure-on-collie.patch |   34 +
>  .../collie/collie-kexecboot.cfg                    | 1596
> ++++++++++++++++++
> .../collie/collie-tiny.scc                         |    7 +
>  .../collie/collie_remove_irq_to_gpio.patch         |   31 +
>  .../collie/locomo_kbd_tweak-r2.patch               |   80 +
>  .../collie/revert-check-on-console-device.patch    |   41 +
>  .../poodle/locomo_kbd_tweak-r2.patch               |   80 +
>  .../poodle/poodle-kexecboot.cfg                    | 1600
> ++++++++++++++++++
> .../poodle/poodle-tiny.scc                         |    7 +
>  .../poodle/revert-check-on-console-device.patch    |   41 +
>  .../spitz/revert-check-on-console-device.patch     |   41 +
>  .../spitz/spitz-kexecboot.cfg                      | 1697
> +++++++++++++++++++
> .../spitz/spitz-tiny.scc                           |    7 +
>  .../tosa/revert-check-on-console-device.patch      |   41 +
>  .../tosa/tosa-kexecboot.cfg                        | 1601
> ++++++++++++++++++
> .../tosa/tosa-tiny.scc                             |    7 +
>  .../akita/akita-kexecboot.cfg                      | 1698
> --------------------
> .../akita/akita-tiny.scc                           |    7 -
>  .../akita/revert-check-on-console-device.patch     |   41 -
>  .../c7x0/c7x0-kexecboot.cfg                        | 1692
> -------------------
> .../linux-yocto-tiny-kexecboot/c7x0/c7x0-tiny.scc  |    7 -
>  .../c7x0/revert-check-on-console-device.patch      |   41 -
>  ...xx_sharpsl-retain-ops-structure-on-collie.patch |   34 -
>  .../collie/collie-kexecboot.cfg                    | 1596
> ------------------
> .../collie/collie-tiny.scc                         |    7 -
>  .../collie/collie_remove_irq_to_gpio.patch         |   31 -
>  .../collie/locomo_kbd_tweak-r2.patch               |   80 -
>  .../collie/revert-check-on-console-device.patch    |   41 -
>  .../poodle/locomo_kbd_tweak-r2.patch               |   80 -
>  .../poodle/poodle-kexecboot.cfg                    | 1600
> ------------------
> .../poodle/poodle-tiny.scc                         |    7 -
>  .../poodle/revert-check-on-console-device.patch    |   41 -
>  .../spitz/revert-check-on-console-device.patch     |   41 -
>  .../spitz/spitz-kexecboot.cfg                      | 1697
> -------------------
> .../spitz/spitz-tiny.scc                           |    7 -
>  .../tosa/revert-check-on-console-device.patch      |   41 -
>  .../tosa/tosa-kexecboot.cfg                        | 1601
> ------------------
> .../linux-yocto-tiny-kexecboot/tosa/tosa-tiny.scc  |    7 -
>  .../linux/linux-yocto-tiny-kexecboot_3.2.bbappend  |    2 +-
>  45 files changed, 10398 insertions(+), 10398 deletions(-)
>  create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/akita/akita-kexecboot.c
> fg create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/akita/akita-tiny.scc
> create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/akita/revert-check-on-c
> onsole-device.patch create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/c7x0/c7x0-kexecboot.cfg
> create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/c7x0/c7x0-tiny.scc
> create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/c7x0/revert-check-on-co
> nsole-device.patch create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/0001-pcmcia-pxa2
> xx_sharpsl-retain-ops-structure-on-collie.patch create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-kexecboot
> .cfg create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-tiny.scc
> create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie_remove_ir
> q_to_gpio.patch create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/locomo_kbd_tweak
> -r2.patch create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/revert-check-on-
> console-device.patch create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/poodle/locomo_kbd_tweak
> -r2.patch create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/poodle/poodle-kexecboot
> .cfg create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/poodle/poodle-tiny.scc
> create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/poodle/revert-check-on-
> console-device.patch create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/spitz/revert-check-on-c
> onsole-device.patch create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/spitz/spitz-kexecboot.c
> fg create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/spitz/spitz-tiny.scc
> create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/tosa/revert-check-on-co
> nsole-device.patch create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/tosa/tosa-kexecboot.cfg
> create mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/tosa/tosa-tiny.scc
> delete mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/akita/akita-kexecboot.cfg
> delete mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/akita/akita-tiny.scc delete
> mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/akita/revert-check-on-conso
> le-device.patch delete mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/c7x0/c7x0-kexecboot.cfg
> delete mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/c7x0/c7x0-tiny.scc delete
> mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/c7x0/revert-check-on-consol
> e-device.patch delete mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/collie/0001-pcmcia-pxa2xx_s
> harpsl-retain-ops-structure-on-collie.patch delete mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/collie/collie-kexecboot.cfg
> delete mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/collie/collie-tiny.scc
> delete mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/collie/collie_remove_irq_to
> _gpio.patch delete mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/collie/locomo_kbd_tweak-r2.
> patch delete mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/collie/revert-check-on-cons
> ole-device.patch delete mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/poodle/locomo_kbd_tweak-r2.
> patch delete mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/poodle/poodle-kexecboot.cfg
> delete mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/poodle/poodle-tiny.scc
> delete mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/poodle/revert-check-on-cons
> ole-device.patch delete mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/spitz/revert-check-on-conso
> le-device.patch delete mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/spitz/spitz-kexecboot.cfg
> delete mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/spitz/spitz-tiny.scc delete
> mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/tosa/revert-check-on-consol
> e-device.patch delete mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/tosa/tosa-kexecboot.cfg
> delete mode 100644
> recipes-kernel/linux/linux-yocto-tiny-kexecboot/tosa/tosa-tiny.scc

Merged to meta-handheld master, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


