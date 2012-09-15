Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TCzUq-0000dw-7M
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Sep 2012 23:01:48 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Sep 2012 13:49:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,428,1344236400"; d="scan'208";a="204871871"
Received: from unknown (HELO helios.localnet) ([10.252.121.222])
	by orsmga002.jf.intel.com with ESMTP; 15 Sep 2012 13:49:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Sep 2012 21:49:09 +0100
Message-ID: <8481912.4eYpRluVRs@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1347741104-18615-1-git-send-email-andrea.adami@gmail.com>
References: <1347741104-18615-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld][PATCH] linux-yocto: slob breaks usb networking, use slab
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
X-List-Received-Date: Sat, 15 Sep 2012 21:01:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 15 September 2012 22:31:44 Andrea Adami wrote:
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-kernel/linux/linux-yocto/akita/akita.cfg   |    4 ++--
>  recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg     |    4 ++--
>  recipes-kernel/linux/linux-yocto/collie/collie.cfg |    4 ++--
>  recipes-kernel/linux/linux-yocto/poodle/poodle.cfg |    4 ++--
>  recipes-kernel/linux/linux-yocto/spitz/spitz.cfg   |    4 ++--
>  recipes-kernel/linux/linux-yocto/tosa/tosa.cfg     |    4 ++--
>  6 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-yocto/akita/akita.cfg
> b/recipes-kernel/linux/linux-yocto/akita/akita.cfg index 6f0db54..e7ecdde
> 100644
> --- a/recipes-kernel/linux/linux-yocto/akita/akita.cfg
> +++ b/recipes-kernel/linux/linux-yocto/akita/akita.cfg
> @@ -128,9 +128,9 @@ CONFIG_PERF_EVENTS=y
>  # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
>  CONFIG_VM_EVENT_COUNTERS=y
>  CONFIG_COMPAT_BRK=y
> -# CONFIG_SLAB is not set
> +CONFIG_SLAB=y
>  # CONFIG_SLUB is not set
> -CONFIG_SLOB=y
> +# CONFIG_SLOB is not set
>  CONFIG_PROFILING=y
>  CONFIG_OPROFILE=m
>  CONFIG_HAVE_OPROFILE=y
> diff --git a/recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg
> b/recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg index 5655f0d..f8d3f4d
> 100644
> --- a/recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg
> +++ b/recipes-kernel/linux/linux-yocto/c7x0/c7x0.cfg
> @@ -128,9 +128,9 @@ CONFIG_PERF_EVENTS=y
>  # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
>  CONFIG_VM_EVENT_COUNTERS=y
>  CONFIG_COMPAT_BRK=y
> -# CONFIG_SLAB is not set
> +CONFIG_SLAB=y
>  # CONFIG_SLUB is not set
> -CONFIG_SLOB=y
> +# CONFIG_SLOB is not set
>  CONFIG_PROFILING=y
>  CONFIG_OPROFILE=m
>  CONFIG_HAVE_OPROFILE=y
> diff --git a/recipes-kernel/linux/linux-yocto/collie/collie.cfg
> b/recipes-kernel/linux/linux-yocto/collie/collie.cfg index 4cc5f56..2f5ead7
> 100644
> --- a/recipes-kernel/linux/linux-yocto/collie/collie.cfg
> +++ b/recipes-kernel/linux/linux-yocto/collie/collie.cfg
> @@ -129,9 +129,9 @@ CONFIG_PERF_EVENTS=y
>  # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
>  CONFIG_VM_EVENT_COUNTERS=y
>  CONFIG_COMPAT_BRK=y
> -# CONFIG_SLAB is not set
> +CONFIG_SLAB=y
>  # CONFIG_SLUB is not set
> -CONFIG_SLOB=y
> +# CONFIG_SLOB is not set
>  CONFIG_PROFILING=y
>  CONFIG_OPROFILE=m
>  CONFIG_HAVE_OPROFILE=y
> diff --git a/recipes-kernel/linux/linux-yocto/poodle/poodle.cfg
> b/recipes-kernel/linux/linux-yocto/poodle/poodle.cfg index c20557e..644ff69
> 100644
> --- a/recipes-kernel/linux/linux-yocto/poodle/poodle.cfg
> +++ b/recipes-kernel/linux/linux-yocto/poodle/poodle.cfg
> @@ -129,9 +129,9 @@ CONFIG_PERF_EVENTS=y
>  # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
>  CONFIG_VM_EVENT_COUNTERS=y
>  CONFIG_COMPAT_BRK=y
> -# CONFIG_SLAB is not set
> +CONFIG_SLAB=y
>  # CONFIG_SLUB is not set
> -CONFIG_SLOB=y
> +# CONFIG_SLOB is not set
>  CONFIG_PROFILING=y
>  CONFIG_OPROFILE=m
>  CONFIG_HAVE_OPROFILE=y
> diff --git a/recipes-kernel/linux/linux-yocto/spitz/spitz.cfg
> b/recipes-kernel/linux/linux-yocto/spitz/spitz.cfg index f3f6561..6a26182
> 100644
> --- a/recipes-kernel/linux/linux-yocto/spitz/spitz.cfg
> +++ b/recipes-kernel/linux/linux-yocto/spitz/spitz.cfg
> @@ -128,9 +128,9 @@ CONFIG_PERF_EVENTS=y
>  # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
>  CONFIG_VM_EVENT_COUNTERS=y
>  CONFIG_COMPAT_BRK=y
> -# CONFIG_SLAB is not set
> +CONFIG_SLAB=y
>  # CONFIG_SLUB is not set
> -CONFIG_SLOB=y
> +# CONFIG_SLOB is not set
>  CONFIG_PROFILING=y
>  CONFIG_OPROFILE=m
>  CONFIG_HAVE_OPROFILE=y
> diff --git a/recipes-kernel/linux/linux-yocto/tosa/tosa.cfg
> b/recipes-kernel/linux/linux-yocto/tosa/tosa.cfg index 31c6da3..013112f
> 100644
> --- a/recipes-kernel/linux/linux-yocto/tosa/tosa.cfg
> +++ b/recipes-kernel/linux/linux-yocto/tosa/tosa.cfg
> @@ -128,9 +128,9 @@ CONFIG_PERF_EVENTS=y
>  # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
>  CONFIG_VM_EVENT_COUNTERS=y
>  CONFIG_COMPAT_BRK=y
> -# CONFIG_SLAB is not set
> +CONFIG_SLAB=y
>  # CONFIG_SLUB is not set
> -CONFIG_SLOB=y
> +# CONFIG_SLOB is not set
>  CONFIG_PROFILING=y
>  CONFIG_OPROFILE=m
>  CONFIG_HAVE_OPROFILE=y

Merged to meta-handheld master, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


