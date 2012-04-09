Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SHNIc-00047j-1V
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2012 00:43:02 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Apr 2012 15:33:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="130457326"
Received: from unknown (HELO helios.localnet) ([10.252.120.17])
	by orsmga002.jf.intel.com with ESMTP; 09 Apr 2012 15:33:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 09 Apr 2012 23:33:41 +0100
Message-ID: <4084358.abpNhLqlEI@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.0.0-17-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <1334009136-7557-3-git-send-email-andrea.adami@gmail.com>
References: <1334009136-7557-1-git-send-email-andrea.adami@gmail.com>
	<1334009136-7557-3-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld][PATCH 3/3] linux(-kexecboot)_git: add CC_OPTIMIZE_FOR_SIZE=y
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
X-List-Received-Date: Mon, 09 Apr 2012 22:43:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 10 April 2012 00:05:36 Andrea Adami wrote:
> * to spitz kernel
> * bump PR
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../linux/linux-kexecboot/spitz/defconfig          |    1 +
>  recipes-kernel/linux/linux-kexecboot_git.bbappend  |    2 ++
>  recipes-kernel/linux/linux/spitz/defconfig         |    1 +
>  recipes-kernel/linux/linux_git.bb                  |    2 +-
>  4 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-kexecboot/spitz/defconfig
> b/recipes-kernel/linux/linux-kexecboot/spitz/defconfig index
> c64f831..60960d7 100644
> --- a/recipes-kernel/linux/linux-kexecboot/spitz/defconfig
> +++ b/recipes-kernel/linux/linux-kexecboot/spitz/defconfig
> @@ -11,6 +11,7 @@ CONFIG_INITRAMFS_COMPRESSION_LZMA=y
>  # CONFIG_KALLSYMS is not set
>  # CONFIG_ELF_CORE is not set
>  # CONFIG_BASE_FULL is not set
> +CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>  CONFIG_EMBEDDED=y
>  # CONFIG_VM_EVENT_COUNTERS is not set
>  # CONFIG_COMPAT_BRK is not set
> diff --git a/recipes-kernel/linux/linux-kexecboot_git.bbappend
> b/recipes-kernel/linux/linux-kexecboot_git.bbappend index 1acab8a..49dd75f
> 100644
> --- a/recipes-kernel/linux/linux-kexecboot_git.bbappend
> +++ b/recipes-kernel/linux/linux-kexecboot_git.bbappend
> @@ -1,6 +1,8 @@
>  FILESEXTRAPATHS_prepend :=
> "${THISDIR}/linux-kexecboot-${PV}:${THISDIR}/files:"
> 
>  DEFAULT_PREFERENCE = "-2"
> +
> +PR = "${INC_PR}.1"
>  #COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
>  COMPATIBLE_MACHINE = "(spitz)"
> 
> diff --git a/recipes-kernel/linux/linux/spitz/defconfig
> b/recipes-kernel/linux/linux/spitz/defconfig index 4370819..fb5eaee 100644
> --- a/recipes-kernel/linux/linux/spitz/defconfig
> +++ b/recipes-kernel/linux/linux/spitz/defconfig
> @@ -17,6 +17,7 @@ CONFIG_BLK_DEV_INITRD=y
>  CONFIG_RD_BZIP2=y
>  CONFIG_RD_LZMA=y
>  CONFIG_RD_LZO=y
> +CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>  CONFIG_EMBEDDED=y
>  CONFIG_SLOB=y
>  CONFIG_PROFILING=y
> diff --git a/recipes-kernel/linux/linux_git.bb
> b/recipes-kernel/linux/linux_git.bb index 222df31..2897d19 100644
> --- a/recipes-kernel/linux/linux_git.bb
> +++ b/recipes-kernel/linux/linux_git.bb
> @@ -1,6 +1,6 @@
>  require linux.inc
> 
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  COMPATIBLE_MACHINE = "spitz"
> 
>  DEFAULT_PREFERENCE = "-2"

Merged these three to meta-handheld, with a fix for accidental revert of the 
CONFIG_GPIO_PCA953X option. Thanks.

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre


