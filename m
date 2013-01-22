Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Txg6h-0002Vj-0U
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 16:49:58 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jan 2013 07:34:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,515,1355126400"; d="scan'208";a="280589055"
Received: from unknown (HELO helios.localnet) ([10.252.123.171])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jan 2013 07:34:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Tue, 22 Jan 2013 15:34:18 +0000
Message-ID: <1424511.WqX12C0hM8@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.4 (Linux/3.5.0-22-generic; KDE/4.9.4; i686; ; )
In-Reply-To: <1358725702-18634-1-git-send-email-andrea.adami@gmail.com>
References: <1358725702-18634-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH] linux-yocto_3.4: add general MTD options to zaurus-hardware.cfg
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
X-List-Received-Date: Tue, 22 Jan 2013 15:50:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 21 January 2013 00:48:22 Andrea Adami wrote:
> * options were removed from zaurus-pxa-common.cfg because are
> * shared by collie as well
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg
> b/recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg index
> ae3627a..b01ec8f 100644
> --- a/recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg
> +++ b/recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg
> @@ -60,6 +60,16 @@ CONFIG_MTD_BLKDEVS=y
>  CONFIG_MTD_BLOCK=y
> 
>  #
> +# RAM/ROM/Flash chip drivers
> +#
> +CONFIG_MTD_MAP_BANK_WIDTH_1=y
> +CONFIG_MTD_MAP_BANK_WIDTH_2=y
> +CONFIG_MTD_MAP_BANK_WIDTH_4=y
> +CONFIG_MTD_CFI_I1=y
> +CONFIG_MTD_CFI_I2=y
> +CONFIG_MTD_ROM=y
> +
> +#
>  # Mapping drivers for chip access
>  #
>  CONFIG_MTD_COMPLEX_MAPPINGS=y

Merged, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


