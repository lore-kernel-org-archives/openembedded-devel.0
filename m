Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SHNHk-00041X-Be
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2012 00:42:08 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Apr 2012 15:32:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="139646058"
Received: from unknown (HELO helios.localnet) ([10.252.120.17])
	by fmsmga001.fm.intel.com with ESMTP; 09 Apr 2012 15:32:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 09 Apr 2012 23:32:49 +0100
Message-ID: <1423975.A42DTJU2gT@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.0.0-17-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <1334006320-5810-2-git-send-email-andrea.adami@gmail.com>
References: <1334006320-5810-1-git-send-email-andrea.adami@gmail.com>
	<1334006320-5810-2-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld][PATCH 2/2] linux-kexecboot: add CONFIG_GPIO_PCA953X=y to akita defconfigs
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
X-List-Received-Date: Mon, 09 Apr 2012 22:42:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 09 April 2012 23:18:40 Andrea Adami wrote:
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../linux/linux-kexecboot-3.1/akita/defconfig      |    1 +
>  .../linux/linux-kexecboot-3.2/akita/defconfig      |    1 +
>  2 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-kexecboot-3.1/akita/defconfig
> b/recipes-kernel/linux/linux-kexecboot-3.1/akita/defconfig index
> b066839..32530a3 100644
> --- a/recipes-kernel/linux/linux-kexecboot-3.1/akita/defconfig
> +++ b/recipes-kernel/linux/linux-kexecboot-3.1/akita/defconfig
> @@ -21,6 +21,7 @@ CONFIG_SLOB=y
>  # CONFIG_LBDAF is not set
>  # CONFIG_IOSCHED_CFQ is not set
>  CONFIG_ARCH_PXA=y
> +CONFIG_GPIO_PCA953X=y
>  CONFIG_PXA_SHARPSL=y
>  CONFIG_PXA_SHARPSL_DETECT_MACH_ID=y
>  CONFIG_MACH_AKITA=y
> diff --git a/recipes-kernel/linux/linux-kexecboot-3.2/akita/defconfig
> b/recipes-kernel/linux/linux-kexecboot-3.2/akita/defconfig index
> 6c579fa..a25331b 100644
> --- a/recipes-kernel/linux/linux-kexecboot-3.2/akita/defconfig
> +++ b/recipes-kernel/linux/linux-kexecboot-3.2/akita/defconfig
> @@ -20,6 +20,7 @@ CONFIG_SLOB=y
>  # CONFIG_LBDAF is not set
>  # CONFIG_IOSCHED_CFQ is not set
>  CONFIG_ARCH_PXA=y
> +CONFIG_GPIO_PCA953X=y
>  CONFIG_PXA_SHARPSL=y
>  CONFIG_PXA_SHARPSL_DETECT_MACH_ID=y
>  CONFIG_MACH_AKITA=y

Merged these two to meta-handheld, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


