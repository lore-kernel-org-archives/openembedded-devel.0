Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S8B4Z-0004nL-Bw
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 14:50:31 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Mar 2012 06:41:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="139325206"
Received: from unknown (HELO helios.localnet) ([10.252.123.170])
	by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2012 06:41:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 15 Mar 2012 13:41:41 +0000
Message-ID: <2452142.3c7HBX69ER@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <1331162943-4863-1-git-send-email-andrea.adami@gmail.com>
References: <1331162943-4863-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH 1/3] linux-3.1: remove CONFIG_RAMOOPS=y from Zaurus defconfigs
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
X-List-Received-Date: Thu, 15 Mar 2012 13:50:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 08 March 2012 00:29:01 Andrea Adami wrote:
> * this was enabled by mistake, nonsense on Zaurus
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-kernel/linux/linux-3.1/akita/defconfig  |    1 -
>  recipes-kernel/linux/linux-3.1/c7x0/defconfig   |    1 -
>  recipes-kernel/linux/linux-3.1/collie/defconfig |    1 -
>  recipes-kernel/linux/linux-3.1/poodle/defconfig |    1 -
>  recipes-kernel/linux/linux-3.1/spitz/defconfig  |    1 -
>  recipes-kernel/linux/linux-3.1/tosa/defconfig   |    1 -
>  6 files changed, 0 insertions(+), 6 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-3.1/akita/defconfig
> b/recipes-kernel/linux/linux-3.1/akita/defconfig index 9b5bafb..dfab582
> 100644
> --- a/recipes-kernel/linux/linux-3.1/akita/defconfig
> +++ b/recipes-kernel/linux/linux-3.1/akita/defconfig
> @@ -179,7 +179,6 @@ CONFIG_SERIAL_8250=m
>  CONFIG_SERIAL_8250_CS=m
>  CONFIG_SERIAL_PXA=y
>  CONFIG_SERIAL_PXA_CONSOLE=y
> -CONFIG_RAMOOPS=y
>  CONFIG_SPI=y
>  CONFIG_SPI_PXA2XX=y
>  CONFIG_GPIO_SYSFS=y
> diff --git a/recipes-kernel/linux/linux-3.1/c7x0/defconfig
> b/recipes-kernel/linux/linux-3.1/c7x0/defconfig index cbcd789..025008b
> 100644
> --- a/recipes-kernel/linux/linux-3.1/c7x0/defconfig
> +++ b/recipes-kernel/linux/linux-3.1/c7x0/defconfig
> @@ -168,7 +168,6 @@ CONFIG_SERIAL_8250=m
>  CONFIG_SERIAL_8250_CS=m
>  CONFIG_SERIAL_PXA=y
>  CONFIG_SERIAL_PXA_CONSOLE=y
> -CONFIG_RAMOOPS=y
>  CONFIG_I2C=y
>  CONFIG_I2C_PXA=y
>  CONFIG_SPI=y
> diff --git a/recipes-kernel/linux/linux-3.1/collie/defconfig
> b/recipes-kernel/linux/linux-3.1/collie/defconfig index b6b4315..679532b
> 100644
> --- a/recipes-kernel/linux/linux-3.1/collie/defconfig
> +++ b/recipes-kernel/linux/linux-3.1/collie/defconfig
> @@ -175,7 +175,6 @@ CONFIG_SERIAL_8250=m
>  CONFIG_SERIAL_8250_CS=m
>  CONFIG_SERIAL_SA1100=y
>  CONFIG_SERIAL_SA1100_CONSOLE=y
> -CONFIG_RAMOOPS=y
>  CONFIG_I2C=y
>  CONFIG_SPI=y
>  CONFIG_GPIO_SYSFS=y
> diff --git a/recipes-kernel/linux/linux-3.1/poodle/defconfig
> b/recipes-kernel/linux/linux-3.1/poodle/defconfig index a2dc2ec..0124824
> 100644
> --- a/recipes-kernel/linux/linux-3.1/poodle/defconfig
> +++ b/recipes-kernel/linux/linux-3.1/poodle/defconfig
> @@ -167,7 +167,6 @@ CONFIG_SERIAL_8250=m
>  CONFIG_SERIAL_8250_CS=m
>  CONFIG_SERIAL_PXA=y
>  CONFIG_SERIAL_PXA_CONSOLE=y
> -CONFIG_RAMOOPS=y
>  CONFIG_I2C=y
>  CONFIG_I2C_PXA=y
>  CONFIG_SPI=y
> diff --git a/recipes-kernel/linux/linux-3.1/spitz/defconfig
> b/recipes-kernel/linux/linux-3.1/spitz/defconfig index 9b5bafb..dfab582
> 100644
> --- a/recipes-kernel/linux/linux-3.1/spitz/defconfig
> +++ b/recipes-kernel/linux/linux-3.1/spitz/defconfig
> @@ -179,7 +179,6 @@ CONFIG_SERIAL_8250=m
>  CONFIG_SERIAL_8250_CS=m
>  CONFIG_SERIAL_PXA=y
>  CONFIG_SERIAL_PXA_CONSOLE=y
> -CONFIG_RAMOOPS=y
>  CONFIG_SPI=y
>  CONFIG_SPI_PXA2XX=y
>  CONFIG_GPIO_SYSFS=y
> diff --git a/recipes-kernel/linux/linux-3.1/tosa/defconfig
> b/recipes-kernel/linux/linux-3.1/tosa/defconfig index 7f10c29..187bab2
> 100644
> --- a/recipes-kernel/linux/linux-3.1/tosa/defconfig
> +++ b/recipes-kernel/linux/linux-3.1/tosa/defconfig
> @@ -180,7 +180,6 @@ CONFIG_SERIAL_8250=m
>  CONFIG_SERIAL_8250_CS=m
>  CONFIG_SERIAL_PXA=y
>  CONFIG_SERIAL_PXA_CONSOLE=y
> -CONFIG_RAMOOPS=y
>  CONFIG_I2C=y
>  CONFIG_I2C_PXA=y
>  CONFIG_SPI=y

Merged to meta-handheld, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


