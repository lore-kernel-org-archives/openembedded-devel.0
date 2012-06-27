Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sjs2n-00021W-D4
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jun 2012 15:12:29 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 27 Jun 2012 06:01:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="116527915"
Received: from unknown (HELO helios.localnet) ([10.252.120.185])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Jun 2012 06:01:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Jun 2012 14:01:16 +0100
Message-ID: <2556659.pn0cFXQTpO@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-25-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <1340315167-5855-2-git-send-email-andrea.adami@gmail.com>
References: <1340315167-5855-1-git-send-email-andrea.adami@gmail.com>
	<1340315167-5855-2-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld][PATCH 2/2] linux_2.6.29: fix parsing warnings
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
X-List-Received-Date: Wed, 27 Jun 2012 13:12:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 21 June 2012 23:46:07 Andrea Adami wrote:
> * declare COMPATIBLE_MACHINE to fix
> * WARNING: Unable to get checksum for linux SRC_URI entry
> * defconfig: file could not be found
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  recipes-kernel/linux/linux_2.6.29.bb |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux_2.6.29.bb
> b/recipes-kernel/linux/linux_2.6.29.bb index e1da026..1886f24 100644
> --- a/recipes-kernel/linux/linux_2.6.29.bb
> +++ b/recipes-kernel/linux/linux_2.6.29.bb
> @@ -6,6 +6,8 @@ PR = "r0"
>  DEFAULT_PREFERENCE = "-1"
>  DEFAULT_PREFERENCE_h3600 = "1"
> 
> +COMPATIBLE_MACHINE = "h3600"
> +
>  SRC_URI =
> "${KERNELORG_MIRROR}/linux/kernel/v2.6/linux-2.6.29.6.tar.bz2;name=kernel \
> file://defconfig"

Merged both of these to meta-handheld master, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


