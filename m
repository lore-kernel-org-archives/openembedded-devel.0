Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rupm1-0004qr-3X
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 19:28:13 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Feb 2012 10:20:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122087119"
Received: from unknown (HELO helios.localnet) ([10.252.123.5])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2012 10:20:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 07 Feb 2012 18:20:08 +0000
Message-ID: <2342878.vkj0khZiVL@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-15-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <1328395761-19018-1-git-send-email-andrea.adami@gmail.com>
References: <1328395761-19018-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld][PATCH] zaurus.inc: remove remnant of kernel26 from MACHINE_FEATURES
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
X-List-Received-Date: Tue, 07 Feb 2012 18:28:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 04 February 2012 23:49:21 Andrea Adami wrote:
> * and do some minor cleanings, removing unneeded var for kernel type
> * remove outdated comments about tosa suspend as well
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  conf/machine/include/zaurus.inc |    8 ++------
>  1 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/conf/machine/include/zaurus.inc
> b/conf/machine/include/zaurus.inc index 099bb3e..a43db8b 100644
> --- a/conf/machine/include/zaurus.inc
> +++ b/conf/machine/include/zaurus.inc
> @@ -35,8 +35,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux"
> 
>  # Default bootloader expects "zImage", use "uImage" for u-boot
>  # Note: kexecboot can boot both kind of images
> -ZAURUS_KERNEL_IMAGETYPE ?= "zImage"
> -KERNEL_IMAGETYPE = "${ZAURUS_KERNEL_IMAGETYPE}"
> +KERNEL_IMAGETYPE ?= "zImage"
> 
>  # sane defaults for devices with only 32Mb RAM (see man xz)
>  XZ_COMPRESSION_LEVEL = "-e -7"
> @@ -60,7 +59,7 @@ CMDLINE_poodle = "console=ttyS0,115200n8 console=tty1
> fbcon=rotate:1" CMDLINE_spitz = "console=ttyS0,115200n8 console=tty1
> fbcon=rotate:1" CMDLINE_tosa = "console=ttyS0,115200n8 console=tty1"
> 
> -MACHINE_FEATURES = "kernel26 apm alsa pcmcia irda usbgadget keyboard
> touchscreen screen vfat ext2" +MACHINE_FEATURES = "apm alsa pcmcia irda
> usbgadget keyboard touchscreen screen vfat ext2"
> MACHINE_FEATURES_append_akita = " usbhost"
>  MACHINE_FEATURES_append_spitz = " usbhost"
>  MACHINE_FEATURES_append_tosa  = " usbhost wifi "
> @@ -68,9 +67,6 @@ MACHINE_FEATURES_append_tosa  = " usbhost wifi "
>  MACHINE_EXTRA_RDEPENDS = "zaurusd mtd-utils nandlogical"
>  MACHINE_EXTRA_RDEPENDS_collie = "zaurusd"
> 
> -# Still actual? OHCI suspend/resume fixup
> -# MACHINE_EXTRA_RRECOMMENDS_tosa = "apm-tosa-suspendfix"
> -
>  ##################################
>  # Zaurus rootfs are booted by
>  # linux-kexecboot

All three of the zaurus.inc patches merged to meta-handheld. Thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


