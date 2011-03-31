Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q5Bbp-0002Ir-4L for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 08:43:57 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q5BZs-0001MW-AZ for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 08:41:56 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 08:41:56 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 08:41:56 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 31 Mar 2011 08:41:44 +0200
Message-ID: <in17n8$pfl$1@dough.gmane.org>
References: <1301508491-3062-1-git-send-email-Chase.Maupin@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1301508491-3062-1-git-send-email-Chase.Maupin@ti.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 1/6] ti814x: Add new machine definitions
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
X-List-Received-Date: Thu, 31 Mar 2011 06:43:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 30-03-11 20:08, Chase Maupin wrote:
> * Add new am387x-evm machine definition
> * Add new dm814xx-evm machine definition
> * Add new c6a814x-evm machine definition
> * New SOC_FAMILY ti814x available
> * Based on machine configuration files from Arago contributed
>   by Siddharth Heroor

FWIW, the machines get generally added last in the patch series since
now you have a commit where there are machines, but no uboot/kernel/etc.

regards,

Koen


> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  conf/machine/am387x-evm.conf    |    5 +++++
>  conf/machine/c6a814x-evm.conf   |    5 +++++
>  conf/machine/dm814x-evm.conf    |    5 +++++
>  conf/machine/include/ti814x.inc |   26 ++++++++++++++++++++++++++
>  4 files changed, 41 insertions(+), 0 deletions(-)
>  create mode 100644 conf/machine/am387x-evm.conf
>  create mode 100644 conf/machine/c6a814x-evm.conf
>  create mode 100644 conf/machine/dm814x-evm.conf
>  create mode 100644 conf/machine/include/ti814x.inc
> 
> diff --git a/conf/machine/am387x-evm.conf b/conf/machine/am387x-evm.conf
> new file mode 100644
> index 0000000..ebf9889
> --- /dev/null
> +++ b/conf/machine/am387x-evm.conf
> @@ -0,0 +1,5 @@
> +#@TYPE: Machine
> +#@NAME: AM389x evm
> +#@DESCRIPTION: Machine configuration for the AM389x evm
> +
> +require conf/machine/include/ti814x.inc
> diff --git a/conf/machine/c6a814x-evm.conf b/conf/machine/c6a814x-evm.conf
> new file mode 100644
> index 0000000..b85c489
> --- /dev/null
> +++ b/conf/machine/c6a814x-evm.conf
> @@ -0,0 +1,5 @@
> +#@TYPE: Machine
> +#@NAME: c6a814x evm
> +#@DESCRIPTION: Machine configuration for the c6a814x evm
> +
> +require conf/machine/include/ti814x.inc
> diff --git a/conf/machine/dm814x-evm.conf b/conf/machine/dm814x-evm.conf
> new file mode 100644
> index 0000000..140dcc1
> --- /dev/null
> +++ b/conf/machine/dm814x-evm.conf
> @@ -0,0 +1,5 @@
> +#@TYPE: Machine
> +#@NAME: DM814x evm
> +#@DESCRIPTION: Machine configuration for the DM814x evm
> +
> +require conf/machine/include/ti814x.inc
> diff --git a/conf/machine/include/ti814x.inc b/conf/machine/include/ti814x.inc
> new file mode 100644
> index 0000000..8fa7ee9
> --- /dev/null
> +++ b/conf/machine/include/ti814x.inc
> @@ -0,0 +1,26 @@
> +TARGET_ARCH = "arm"
> +SOC_FAMILY = "ti814x"
> +
> +require conf/machine/include/tune-cortexa8.inc
> +
> +PREFERRED_PROVIDER_virtual/kernel = "linux-omap3"
> +PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
> +
> +# Increase this everytime you change something in the kernel
> +MACHINE_KERNEL_PR = "r1"
> +
> +KERNEL_IMAGETYPE = "uImage"
> +
> +UBOOT_ARCH = "arm"
> +UBOOT_MACHINE = "ti8148_evm_config_nand"
> +UBOOT_ENTRYPOINT = "0x80008000"
> +UBOOT_LOADADDRESS = "0x80008000"
> +
> +# Only build u-boot
> +EXTRA_IMAGEDEPENDS += "u-boot"
> +
> +# Ship all kernel modules
> +IMAGE_FSTYPES ?= "jffs2 tar.bz2"
> +EXTRA_IMAGECMD_jffs2 = "-lqn -e 128"
> +SERIAL_CONSOLE = "115200 ttyO0"
> +MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 ethernet"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNlCIoMkyGM64RGpERAkAmAJ9Eie7vs4ZP8LqzsxsOwmwhbas0fACgoUTl
KodmBksvnoK3o5Kx+x6LQZk=
=mssH
-----END PGP SIGNATURE-----



