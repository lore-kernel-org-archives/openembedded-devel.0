Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rupno-00050L-PW
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 19:30:04 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Feb 2012 10:22:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122087905"
Received: from unknown (HELO helios.localnet) ([10.252.123.5])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2012 10:22:00 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 07 Feb 2012 18:21:59 +0000
Message-ID: <4212390.S23LVBF3Qx@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-15-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <1328486682-29754-1-git-send-email-andrea.adami@gmail.com>
References: <1328486682-29754-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld][PATCH] linux(-kexecboot): upgrade from 3.1.8 to 3.1.10
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
X-List-Received-Date: Tue, 07 Feb 2012 18:30:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 06 February 2012 01:04:42 Andrea Adami wrote:
> * apply latest patchset for 3.1 and bump PR of both recipes
> * (Kernel 3.2 is still on hold because we are waiting for klibc_2.0)
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-kernel/linux/linux-3.1.inc          |    6 +++---
>  recipes-kernel/linux/linux-kexecboot_3.1.bb |    2 +-
>  recipes-kernel/linux/linux_3.1.bb           |    2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-3.1.inc
> b/recipes-kernel/linux/linux-3.1.inc index 8733543..34bf4a8 100644
> --- a/recipes-kernel/linux/linux-3.1.inc
> +++ b/recipes-kernel/linux/linux-3.1.inc
> @@ -1,5 +1,5 @@
>  SRC_URI +=
> "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \ - 
>         
> ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.8.bz2;apply=yes;name=stab
> lepatch \ +          
> ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.10.bz2;apply=yes;name=sta
> blepatch \ file://defconfig \
>             file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
>             "
> @@ -15,5 +15,5 @@ SRC_URI_append_poodle = " \
> 
>  SRC_URI[kernel.md5sum] = "8d43453f8159b2332ad410b19d86a931"
>  SRC_URI[kernel.sha256sum] =
> "2573d2378c754b0c602b57586e9311e5b38c5d1e6c137f02873833633a4b9359"
> -SRC_URI[stablepatch.md5sum] = "54fac8e4b0b55201e012ef0337a6cc87"
> -SRC_URI[stablepatch.sha256sum] =
> "e191f1fd3d3e0a27e3e5116391a97b47b0c2adc3f6f779df1996766b37759d30"
> +SRC_URI[stablepatch.md5sum] = "a8e1c25a93a685ec2a1c3a808715fe9d"
> +SRC_URI[stablepatch.sha256sum] =
> "f25126052d1a083a415ddd313b40c7fcdb3742f40474cb4a826af7e43fee29d3" diff
> --git a/recipes-kernel/linux/linux-kexecboot_3.1.bb
> b/recipes-kernel/linux/linux-kexecboot_3.1.bb index 535beb3..28dc370 100644
> --- a/recipes-kernel/linux/linux-kexecboot_3.1.bb
> +++ b/recipes-kernel/linux/linux-kexecboot_3.1.bb
> @@ -1,7 +1,7 @@
>  require linux-kexecboot.inc
>  require linux-${PV}.inc
> 
> -PR = "${INC_PR}.6"
> +PR = "${INC_PR}.7"
>  S = "${WORKDIR}/linux-${PV}"
> 
>  COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
> diff --git a/recipes-kernel/linux/linux_3.1.bb
> b/recipes-kernel/linux/linux_3.1.bb index 980be11..c8e2a39 100644
> --- a/recipes-kernel/linux/linux_3.1.bb
> +++ b/recipes-kernel/linux/linux_3.1.bb
> @@ -1,7 +1,7 @@
>  require linux.inc
>  require linux-${PV}.inc
> 
> -PR = "${INC_PR}.8"
> +PR = "${INC_PR}.9"
> 
>  COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz|h1940)"

Merged to meta-handheld, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


