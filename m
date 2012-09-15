Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TCzUP-0000bU-UE
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Sep 2012 23:01:22 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Sep 2012 13:48:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,428,1344236400"; d="scan'208";a="204871600"
Received: from unknown (HELO helios.localnet) ([10.252.121.222])
	by orsmga002.jf.intel.com with ESMTP; 15 Sep 2012 13:48:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Sep 2012 21:48:42 +0100
Message-ID: <5574729.T6NjLU12IF@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1345242628-5064-1-git-send-email-andrea.adami@gmail.com>
References: <1345242628-5064-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld][PATCH] linux-yocto: use LZMA for Zaurus collie
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
X-List-Received-Date: Sat, 15 Sep 2012 21:01:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 18 August 2012 00:30:28 Andrea Adami wrote:
> * this way we save more than 500KiB, important when you have just 14MiB !
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-kernel/linux/linux-yocto/collie/collie.cfg |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-yocto/collie/collie.cfg
> b/recipes-kernel/linux/linux-yocto/collie/collie.cfg index ad709c5..4cc5f56
> 100644
> --- a/recipes-kernel/linux/linux-yocto/collie/collie.cfg
> +++ b/recipes-kernel/linux/linux-yocto/collie/collie.cfg
> @@ -43,8 +43,8 @@ CONFIG_LOCALVERSION=""
>  CONFIG_HAVE_KERNEL_GZIP=y
>  CONFIG_HAVE_KERNEL_LZMA=y
>  CONFIG_HAVE_KERNEL_LZO=y
> -CONFIG_KERNEL_GZIP=y
> -# CONFIG_KERNEL_LZMA is not set
> +# CONFIG_KERNEL_GZIP is not set
> +CONFIG_KERNEL_LZMA=y
>  # CONFIG_KERNEL_LZO is not set
>  CONFIG_DEFAULT_HOSTNAME="(none)"
>  CONFIG_SWAP=y

Merged to meta-handheld master, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


