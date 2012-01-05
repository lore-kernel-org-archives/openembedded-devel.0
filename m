Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rij9B-0008Lk-4b
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jan 2012 09:58:05 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Jan 2012 00:50:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="93167364"
Received: from unknown (HELO helios.localnet) ([10.252.122.94])
	by orsmga001.jf.intel.com with ESMTP; 05 Jan 2012 00:50:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 05 Jan 2012 08:50:39 +0000
Message-ID: <3301687.SH7Zo6JYjh@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <1325714316-25757-1-git-send-email-andrea.adami@gmail.com>
References: <1325714316-25757-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld][PATCH] linux(-kexecboot): upgrade from 3.1.6 to 3.1.7
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
X-List-Received-Date: Thu, 05 Jan 2012 08:58:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 04 January 2012 22:58:36 Andrea Adami wrote:
> * apply latest stable patchset 2012-01-03
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-kernel/linux/linux-kexecboot_3.1.bb |    8 ++++----
>  recipes-kernel/linux/linux_3.1.bb           |    8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-kexecboot_3.1.bb
> b/recipes-kernel/linux/linux-kexecboot_3.1.bb index de5d096..5da0cc4 100644
> --- a/recipes-kernel/linux/linux-kexecboot_3.1.bb
> +++ b/recipes-kernel/linux/linux-kexecboot_3.1.bb
> @@ -1,12 +1,12 @@
>  require linux-kexecboot.inc
> 
> -PR = "${INC_PR}.3"
> +PR = "${INC_PR}.4"
>  S = "${WORKDIR}/linux-${PV}"
> 
>  COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
> 
>  SRC_URI +=
> "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \ - 
>         
> ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.6.bz2;apply=yes;name=stab
> lepatch \ +          
> ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.7.bz2;apply=yes;name=stab
> lepatch \ file://defconfig \
>             file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
>             "
> @@ -22,5 +22,5 @@ SRC_URI_append_poodle = " \
> 
>  SRC_URI[kernel.md5sum] = "8d43453f8159b2332ad410b19d86a931"
>  SRC_URI[kernel.sha256sum] =
> "2573d2378c754b0c602b57586e9311e5b38c5d1e6c137f02873833633a4b9359"
> -SRC_URI[stablepatch.md5sum] = "b815dda0a05f7774a0ed0b705b8cfd4c"
> -SRC_URI[stablepatch.sha256sum] =
> "33684faae341f1c48269caf17338c5dca35757d291761df580f2eed10bf8b47c"
> +SRC_URI[stablepatch.md5sum] = "13ea1e611a0a580138b8203e6f1353ed"
> +SRC_URI[stablepatch.sha256sum] =
> "44f2611ce923db17254eeb618ed06703acf4dd6dcc8357b360e11a1111b0bc9d" diff
> --git a/recipes-kernel/linux/linux_3.1.bb
> b/recipes-kernel/linux/linux_3.1.bb index b4271e4..0c65f7b 100644
> --- a/recipes-kernel/linux/linux_3.1.bb
> +++ b/recipes-kernel/linux/linux_3.1.bb
> @@ -1,11 +1,11 @@
>  require linux.inc
> 
> -PR = "${INC_PR}.4"
> +PR = "${INC_PR}.5"
> 
>  COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz|h1940)"
> 
>  SRC_URI +=
> "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \ - 
>         
> ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.6.bz2;apply=yes;name=stab
> lepatch \ +          
> ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.7.bz2;apply=yes;name=stab
> lepatch \ file://defconfig \
>             file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
>             "
> @@ -21,5 +21,5 @@ SRC_URI_append_poodle = " \
> 
>  SRC_URI[kernel.md5sum] = "8d43453f8159b2332ad410b19d86a931"
>  SRC_URI[kernel.sha256sum] =
> "2573d2378c754b0c602b57586e9311e5b38c5d1e6c137f02873833633a4b9359"
> -SRC_URI[stablepatch.md5sum] = "b815dda0a05f7774a0ed0b705b8cfd4c"
> -SRC_URI[stablepatch.sha256sum] =
> "33684faae341f1c48269caf17338c5dca35757d291761df580f2eed10bf8b47c"
> +SRC_URI[stablepatch.md5sum] = "13ea1e611a0a580138b8203e6f1353ed"
> +SRC_URI[stablepatch.sha256sum] =
> "44f2611ce923db17254eeb618ed06703acf4dd6dcc8357b360e11a1111b0bc9d"

Merged to meta-handheld master, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


