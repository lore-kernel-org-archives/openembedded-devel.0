Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RYzhd-0008EU-0R
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 13:37:25 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Dec 2011 04:30:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="45583082"
Received: from unknown (HELO helios.localnet) ([10.252.122.20])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Dec 2011 04:30:32 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 09 Dec 2011 12:30:31 +0000
Message-ID: <1429930.oZSh8tThZJ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-13-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <1323360423-12691-1-git-send-email-andrea.adami@gmail.com>
References: <1323360423-12691-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld][PATCH] linux(-kexecboot): upgrade from 3.1.2 to 3.1.4
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
X-List-Received-Date: Fri, 09 Dec 2011 12:37:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 08 December 2011 17:07:03 Andrea Adami wrote:
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-kernel/linux/linux-kexecboot_3.1.bb |    8 ++++----
>  recipes-kernel/linux/linux_3.1.bb           |    8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-kexecboot_3.1.bb
> b/recipes-kernel/linux/linux-kexecboot_3.1.bb index d04be36..a83144a 100644
> --- a/recipes-kernel/linux/linux-kexecboot_3.1.bb
> +++ b/recipes-kernel/linux/linux-kexecboot_3.1.bb
> @@ -1,12 +1,12 @@
>  require linux-kexecboot.inc
> 
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.2"
>  S = "${WORKDIR}/linux-${PV}"
> 
>  COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
> 
>  SRC_URI +=
> "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \ - 
>         
> ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.2.bz2;apply=yes;name=stab
> lepatch \ +          
> ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.4.bz2;apply=yes;name=stab
> lepatch \ file://defconfig \
>             file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
>             "
> @@ -22,5 +22,5 @@ SRC_URI_append_poodle = " \
> 
>  SRC_URI[kernel.md5sum] = "8d43453f8159b2332ad410b19d86a931"
>  SRC_URI[kernel.sha256sum] =
> "2573d2378c754b0c602b57586e9311e5b38c5d1e6c137f02873833633a4b9359"
> -SRC_URI[stablepatch.md5sum] = "7487d8e6f00c077f6e15d6f4f9947c30"
> -SRC_URI[stablepatch.sha256sum] =
> "bc6508cc2d275cbf4a20af74d7454d22791e439948c31b8397d265c20dfd6bb6"
> +SRC_URI[stablepatch.md5sum] = "b8b14bdfbf76cfef8e042e7d1a385fca"
> +SRC_URI[stablepatch.sha256sum] =
> "7fab9b4984bdc00781450ae3cdee7b1218a07d5ed8081da115316f17392a8d5f" diff
> --git a/recipes-kernel/linux/linux_3.1.bb
> b/recipes-kernel/linux/linux_3.1.bb index 4d28e78..82f61d3 100644
> --- a/recipes-kernel/linux/linux_3.1.bb
> +++ b/recipes-kernel/linux/linux_3.1.bb
> @@ -1,11 +1,11 @@
>  require linux.inc
> 
> -PR = "${INC_PR}.2"
> +PR = "${INC_PR}.3"
> 
>  COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz|h1940)"
> 
>  SRC_URI +=
> "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \ - 
>         
> ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.2.bz2;apply=yes;name=stab
> lepatch \ +          
> ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.4.bz2;apply=yes;name=stab
> lepatch \ file://defconfig \
>             file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
>             "
> @@ -21,5 +21,5 @@ SRC_URI_append_poodle = " \
> 
>  SRC_URI[kernel.md5sum] = "8d43453f8159b2332ad410b19d86a931"
>  SRC_URI[kernel.sha256sum] =
> "2573d2378c754b0c602b57586e9311e5b38c5d1e6c137f02873833633a4b9359"
> -SRC_URI[stablepatch.md5sum] = "7487d8e6f00c077f6e15d6f4f9947c30"
> -SRC_URI[stablepatch.sha256sum] =
> "bc6508cc2d275cbf4a20af74d7454d22791e439948c31b8397d265c20dfd6bb6"
> +SRC_URI[stablepatch.md5sum] = "b8b14bdfbf76cfef8e042e7d1a385fca"
> +SRC_URI[stablepatch.sha256sum] =
> "7fab9b4984bdc00781450ae3cdee7b1218a07d5ed8081da115316f17392a8d5f"

Merged to meta-handheld, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


