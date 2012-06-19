Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sh80q-0000d9-39
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jun 2012 01:39:08 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 19 Jun 2012 16:28:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113974624"
Received: from unknown (HELO helios.localnet) ([10.252.120.138])
	by AZSMGA002.ch.intel.com with ESMTP; 19 Jun 2012 16:28:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Wed, 20 Jun 2012 00:28:21 +0100
Message-ID: <1506799.oJnv9467AL@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-25-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <1340060237-28718-2-git-send-email-andrea.adami@gmail.com>
References: <1340060237-28718-1-git-send-email-andrea.adami@gmail.com>
	<1340060237-28718-2-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH 2/2] zaurus.inc: redefine XZ compression level
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
X-List-Received-Date: Tue, 19 Jun 2012 23:39:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 19 June 2012 00:57:17 Andrea Adami wrote:
> * xz -7 makes sense if your vmlinux is much larger than 16 MiB uncompressed
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  conf/machine/include/zaurus.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/machine/include/zaurus.inc
> b/conf/machine/include/zaurus.inc index 268b9fd..45c82d3 100644
> --- a/conf/machine/include/zaurus.inc
> +++ b/conf/machine/include/zaurus.inc
> @@ -38,7 +38,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
>  KERNEL_IMAGETYPE ?= "zImage"
> 
>  # sane defaults for devices with only 32Mb RAM (see man xz)
> -XZ_COMPRESSION_LEVEL = "-e -7"
> +XZ_COMPRESSION_LEVEL = "-2e"
> 
>  # kernel bootlogo
>  LOGO_SIZE = '${@base_conditional("MACHINE_GUI_CLASS", "bigscreen", "vga",
> "qvga", d)}'

Merged both of these to meta-handheld master, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


