Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R4vTB-00083e-0P
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Sep 2011 16:02:19 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Sep 2011 06:56:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,398,1312182000"; d="scan'208";a="49871738"
Received: from unknown (HELO helios.localnet) ([10.252.120.34])
	by azsmga001.ch.intel.com with ESMTP; 17 Sep 2011 06:56:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Sep 2011 14:56:54 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <201109150057.47810.paul.eggleton@linux.intel.com>
	<1316119412-3685-1-git-send-email-andrea.adami@gmail.com>
In-Reply-To: <1316119412-3685-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Message-Id: <201109171456.54414.paul.eggleton@linux.intel.com>
Subject: Re: [meta-handheld][PATCH v2] linux-kexecboot.inc: hardcode loglevel=3 to keep bootlogo intact
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
X-List-Received-Date: Sat, 17 Sep 2011 14:02:19 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 15 September 2011 21:43:32 Andrea Adami wrote:
> * Being a second-stage bootloader we don't expect any output on screen.
> * Adding 'debug' as commandline arg is pointless because
> * linux-kexecboot is compiled without debug and printk in order
> * to minimize the size.
> * Full debug implies not only editing the commandline (e.g. earlyprintk)
> * but re-enabling full debug options in the defconfigs.
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-kernel/linux/linux-kexecboot.inc |   19 ++++++++-----------
>  1 files changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-kexecboot.inc
> b/recipes-kernel/linux/linux-kexecboot.inc index fb9760a..ea0bbd6 100644
> --- a/recipes-kernel/linux/linux-kexecboot.inc
> +++ b/recipes-kernel/linux/linux-kexecboot.inc
> @@ -1,5 +1,5 @@
>  # We set INC_PR here, since a change in the kexecboot recipe will need to
> get picked up by *all* the kernels: -INC_PR = "r43"
> +INC_PR = "r44"
> 
>  inherit kernel siteinfo
> 
> @@ -19,16 +19,13 @@ DEPENDS += "xz-native"
>  LOGO_SIZE ?= "."
>  SRC_URI = "file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2"
> 
> -# Set the verbosity of kernel messages during runtime
> -CMDLINE_DEBUG ?= '${@base_contains("IMAGE_FEATURES", "debug-tweaks",
> "debug", "loglevel=3", d)}' -
> -# Note how we set master console on serial to protect bootlogo.
> -CMDLINE_c7x0 = "console=tty1 console=ttyS0,115200n8 ${CMDLINE_DEBUG}"
> -CMDLINE_tosa = "console=tty1 console=ttyS0,115200n8 ${CMDLINE_DEBUG}"
> -CMDLINE_poodle = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1
> ${CMDLINE_DEBUG}" -CMDLINE_akita = "console=tty1 console=ttyS0,115200n8
> fbcon=rotate:1 ${CMDLINE_DEBUG}" -CMDLINE_collie = "console=tty1
> console=ttySA0,115200n8 fbcon=rotate:1 mem=64M ${CMDLINE_DEBUG}"
> -CMDLINE_spitz = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1
> ${CMDLINE_DEBUG}" +# Note how we set loglevel=3 and master console on
> serial to protect bootlogo. +CMDLINE_c7x0 = "console=tty1
> console=ttyS0,115200n8 loglevel=3"
> +CMDLINE_tosa = "console=tty1 console=ttyS0,115200n8 loglevel=3"
> +CMDLINE_poodle = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1
> loglevel=3" +CMDLINE_akita = "console=tty1 console=ttyS0,115200n8
> fbcon=rotate:1 loglevel=3" +CMDLINE_collie = "console=tty1
> console=ttySA0,115200n8 fbcon=rotate:1 mem=64M loglevel=3" +CMDLINE_spitz
> = "console=tty1 console=ttyS0,115200n8 fbcon=rotate:1 loglevel=3"
> 
>  PACKAGES = ""
>  PROVIDES = ""

Merged to meta-handheld master, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


