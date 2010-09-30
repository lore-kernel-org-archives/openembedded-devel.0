Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P1SWs-000674-W6
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 01:27:14 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L9L0057Z2G6DLC0@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	30 Sep 2010 18:26:31 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6E15414AF64; Thu,
	30 Sep 2010 19:26:30 -0400 (EDT)
Date: Thu, 30 Sep 2010 19:26:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100930232630.GB28782@denix.org>
References: <1285870326-27944-1-git-send-email-chase.maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1285870326-27944-1-git-send-email-chase.maupin@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.7
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/5] ti816x: add support for ti816x family of	devices
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
X-List-Received-Date: Thu, 30 Sep 2010 23:27:15 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Sep 30, 2010 at 01:12:02PM -0500, Chase Maupin wrote:
> * Add support for the TI816x family of devices.  This includes
>   the c6a816x and am389x devices.
> * Separate machine types are used because not all packages
>   are valid for each machine.
> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> ---
>  conf/machine/am389x-evm.conf    |    5 +++++
>  conf/machine/c6a816x-evm.conf   |    5 +++++
>  conf/machine/include/ti816x.inc |   26 ++++++++++++++++++++++++++
>  3 files changed, 36 insertions(+), 0 deletions(-)
>  create mode 100644 conf/machine/am389x-evm.conf
>  create mode 100644 conf/machine/c6a816x-evm.conf
>  create mode 100644 conf/machine/include/ti816x.inc
> 
> diff --git a/conf/machine/am389x-evm.conf b/conf/machine/am389x-evm.conf
> new file mode 100644
> index 0000000..9bfe7a7
> --- /dev/null
> +++ b/conf/machine/am389x-evm.conf
> @@ -0,0 +1,5 @@
> +#@TYPE: Machine
> +#@NAME: am389x evm
> +#@DESCRIPTION: Machine configuration for the am389x evm
> +
> +require conf/machine/include/ti816x.inc
> diff --git a/conf/machine/c6a816x-evm.conf b/conf/machine/c6a816x-evm.conf
> new file mode 100644
> index 0000000..a7ab9b0
> --- /dev/null
> +++ b/conf/machine/c6a816x-evm.conf
> @@ -0,0 +1,5 @@
> +#@TYPE: Machine
> +#@NAME: c6a816x evm
> +#@DESCRIPTION: Machine configuration for the c6a816x evm
> +
> +require conf/machine/include/ti816x.inc
> diff --git a/conf/machine/include/ti816x.inc b/conf/machine/include/ti816x.inc
> new file mode 100644
> index 0000000..e5205f7
> --- /dev/null
> +++ b/conf/machine/include/ti816x.inc
> @@ -0,0 +1,26 @@
> +TARGET_ARCH = "arm"
> +SOC_FAMILY = "ti816x"
> +
> +require conf/machine/include/tune-cortexa8.inc
> +
> +PREFERRED_PROVIDER_virtual/kernel = "linux-omap3"

Chase,

There is no linux-omap3 recipe in OE, unlike Arago. Anyway, Koen said he'll 
make necessary updates when he pushes all the ti816x-related changes...

-- 
Denys


> +PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
> +
> +# Increase this everytime you change something in the kernel
> +MACHINE_KERNEL_PR = "r1"
> +
> +KERNEL_IMAGETYPE = "uImage"
> +
> +UBOOT_ARCH = "arm"
> +UBOOT_MACHINE = "ti8168_evm_config"
> +UBOOT_ENTRYPOINT = "0x80008000"
> +UBOOT_LOADADDRESS = "0x80008000"
> +
> +# Only build u-boot
> +EXTRA_IMAGEDEPENDS += "u-boot"
> +
> +# Ship all kernel modules
> +IMAGE_FSTYPES ?= "jffs2 tar.bz2"
> +EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
> +SERIAL_CONSOLE = "115200 ttyS2"
> +MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 ethernet"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


