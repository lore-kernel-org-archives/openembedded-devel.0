Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RmA6o-00072H-1M
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Jan 2012 21:21:53 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Jan 2012 12:14:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95860804"
Received: from unknown (HELO helios.localnet) ([10.252.122.112])
	by azsmga001.ch.intel.com with ESMTP; 14 Jan 2012 12:14:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Sat, 14 Jan 2012 20:14:03 +0000
Message-ID: <3241243.h0SD6JhW2O@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <1326243269-21197-2-git-send-email-andrea.adami@gmail.com>
References: <1326243269-21197-1-git-send-email-andrea.adami@gmail.com>
	<1326243269-21197-2-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld] [PATCH 2/2] linux(-kexecboot): update from 3.1.7 to 3.1.8
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
X-List-Received-Date: Sat, 14 Jan 2012 20:21:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 11 January 2012 01:54:29 Andrea Adami wrote:
> * apply latest stable patchset
> * bump PR
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-kernel/linux/linux-kexecboot_3.1.bb |    8 ++++----
>  recipes-kernel/linux/linux_3.1.bb           |    8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-kexecboot_3.1.bb
> b/recipes-kernel/linux/linux-kexecboot_3.1.bb index 9e2fb69..8a7f38f 100644
> --- a/recipes-kernel/linux/linux-kexecboot_3.1.bb
> +++ b/recipes-kernel/linux/linux-kexecboot_3.1.bb
> @@ -1,12 +1,12 @@
>  require linux-kexecboot.inc
> 
> -PR = "${INC_PR}.4"
> +PR = "${INC_PR}.5"
>  S = "${WORKDIR}/linux-${PV}"
> 
>  COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
> 
>  SRC_URI +=
> "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \ - 
>         
> ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.7.bz2;name=stablepatch \
> +          
> ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.8.bz2;name=stablepatch \
> file://defconfig \
>             file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
>             "
> @@ -22,5 +22,5 @@ SRC_URI_append_poodle = " \
> 
>  SRC_URI[kernel.md5sum] = "8d43453f8159b2332ad410b19d86a931"
>  SRC_URI[kernel.sha256sum] =
> "2573d2378c754b0c602b57586e9311e5b38c5d1e6c137f02873833633a4b9359"
> -SRC_URI[stablepatch.md5sum] = "13ea1e611a0a580138b8203e6f1353ed"
> -SRC_URI[stablepatch.sha256sum] =
> "44f2611ce923db17254eeb618ed06703acf4dd6dcc8357b360e11a1111b0bc9d"
> +SRC_URI[stablepatch.md5sum] = "54fac8e4b0b55201e012ef0337a6cc87"
> +SRC_URI[stablepatch.sha256sum] =
> "e191f1fd3d3e0a27e3e5116391a97b47b0c2adc3f6f779df1996766b37759d30" diff
> --git a/recipes-kernel/linux/linux_3.1.bb
> b/recipes-kernel/linux/linux_3.1.bb index baa0b34..3dc2759 100644
> --- a/recipes-kernel/linux/linux_3.1.bb
> +++ b/recipes-kernel/linux/linux_3.1.bb
> @@ -1,11 +1,11 @@
>  require linux.inc
> 
> -PR = "${INC_PR}.5"
> +PR = "${INC_PR}.6"
> 
>  COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz|h1940)"
> 
>  SRC_URI +=
> "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \ - 
>         
> ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.7.bz2;name=stablepatch \
> +          
> ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.8.bz2;name=stablepatch \
> file://defconfig \
>             file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
>             "
> @@ -21,5 +21,5 @@ SRC_URI_append_poodle = " \
> 
>  SRC_URI[kernel.md5sum] = "8d43453f8159b2332ad410b19d86a931"
>  SRC_URI[kernel.sha256sum] =
> "2573d2378c754b0c602b57586e9311e5b38c5d1e6c137f02873833633a4b9359"
> -SRC_URI[stablepatch.md5sum] = "13ea1e611a0a580138b8203e6f1353ed"
> -SRC_URI[stablepatch.sha256sum] =
> "44f2611ce923db17254eeb618ed06703acf4dd6dcc8357b360e11a1111b0bc9d"
> +SRC_URI[stablepatch.md5sum] = "54fac8e4b0b55201e012ef0337a6cc87"
> +SRC_URI[stablepatch.sha256sum] =
> "e191f1fd3d3e0a27e3e5116391a97b47b0c2adc3f6f779df1996766b37759d30"

I left the other patch but took this one. Thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


