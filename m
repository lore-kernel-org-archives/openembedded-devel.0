Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sx3jo-0008Rx-Ge
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Aug 2012 00:19:24 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Aug 2012 15:07:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="174900427"
Received: from unknown (HELO helios.localnet) ([10.252.121.55])
	by orsmga001.jf.intel.com with ESMTP; 02 Aug 2012 15:07:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 02 Aug 2012 23:07:40 +0100
Message-ID: <24002181.r1aeXagV3f@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-27-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <1343891809-3929-1-git-send-email-andrea.adami@gmail.com>
References: <1343891809-3929-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld][PATCH 1/2] zaurus.inc: add framework for ubifs image types
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
X-List-Received-Date: Thu, 02 Aug 2012 22:19:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 02 August 2012 09:16:48 Andrea Adami wrote:
> * In preparation for the next kexecboot release.
> * tested on poodle, c7x0 and spitz 3200
> * (the different partitioning btw spitz models will be
> * detected by kexecbot)
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  conf/machine/include/zaurus.inc |   47
> ++++++++++++++++++++++++++++++++++----- 1 files changed, 41 insertions(+),
> 6 deletions(-)
> 
> diff --git a/conf/machine/include/zaurus.inc
> b/conf/machine/include/zaurus.inc index 45c82d3..899664a 100644
> --- a/conf/machine/include/zaurus.inc
> +++ b/conf/machine/include/zaurus.inc
> @@ -2,22 +2,57 @@
>  # Zaurus common settings
>  ########################
> 
> +IMAGE_FSTYPES ?= "tar.gz jffs2 sum.jffs2 ubifs"
> +INITRAMFS_FSTYPES ?= "cpio.gz cpio.lzma"
> +IMAGE_DEVICE_TABLES = ""
> +
>  ERASEBLOCKSIZE = "0x4000"
>  ERASEBLOCKSIZE_akita = "0x20000"
> +ERASEBLOCKSIZE_spitz = "0x20000"
> 
>  # Warning! SL-C3000 has "0x4000" (16MiB NAND)
>  # C3100 and C3200 have same 128MiB NAND device as akita
> -ERASEBLOCKSIZE_spitz = "0x20000"
> -
> -IMAGE_FSTYPES ?= "tar.gz jffs2 sum.jffs2"
> -INITRAMFS_FSTYPES ?= "cpio.gz cpio.lzma"
> +#
> +# SL-C3000 (16-7 MiB = 576 PEBs)
> +# 9 x 1024 : 16 = 576 PEBs
> +# MKUBIFS_ARGS_spitz = "-m 512 -e 15872 -c 576 -x zlib"
> +# UBINIZE_ARGS_spitz = "-m 512 -p 16384 -s 256"
> +# ERASEBLOCKSIZE_spitz = "0x4000"
> +
> +# UBI: max collie (14.125 = 904 PEBs)
> +# 14.125 x 1024 : 16 = 904 PEBs
> +MKUBIFS_ARGS_collie = "-m 512 -e 15872 -c 904 -x zlib"
> +UBINIZE_ARGS_collie = "-m 512 -p 16384 -s 256"
> +
> +# UBI: max poodle (64-7 MiB = 3648 PEBs)
> +# 57 x 1024 : 16 = 3648 PEBs
> +MKUBIFS_ARGS_poodle = "-m 512 -e 15872 -c 3648 -x zlib"
> +UBINIZE_ARGS_poodle = "-m 512 -p 16384 -s 256"
> +
> +# UBI: max c7x0 (128-7 MiB = 7744 PEBs)
> +# 121 x 1024 : 16 = 7744 PEBs
> +MKUBIFS_ARGS_c7x0 = "-m 512 -e 15872 -c 7744 -x zlib"
> +UBINIZE_ARGS_c7x0 = "-m 512 -p 16384 -s 256"
> +
> +# UBI: max tosa (128-7 MiB = 7744 PEBs)
> +# 121 x 1024 : 16 = 7744 PEBs
> +MKUBIFS_ARGS_tosa = "-m 512 -e 15872 -c 7744 -x zlib"
> +UBINIZE_ARGS_tosa = "-m 512 -p 16384 -s 256"
> +
> +# UBI: max akita (128-7 MiB = 968 PEBs)
> +# 121 x 1024 : 128 = 968 PEBs
> +MKUBIFS_ARGS_akita = "-m 2048 -e 129024 -c 968 -x zlib"
> +UBINIZE_ARGS_akita = "-m 2048 -p 131072 -s 512"
> +
> +# UBI: max spitz (128-7 MiB = 968 PEBs)
> +# 121 x 1024 : 128 = 968 PEBs
> +MKUBIFS_ARGS_spitz = "-m 2048 -e 129024 -c 968 -x zlib"
> +UBINIZE_ARGS_spitz = "-m 2048 -p 131072 -s 512"
> 
>  # kernel now supports favourlzo
>  EXTRA_IMAGECMD_jffs2 = "-p -l --eraseblock=${ERASEBLOCKSIZE}"
>  EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
> 
> -IMAGE_DEVICE_TABLES = ""
> -
>  #########
>  # xserver
>  #########

Merged these two to meta-handheld master (with typo kexecbot -> kexecboot in 
commit message fixed), thanks.

Cheers,
Paul
-- 

Paul Eggleton
Intel Open Source Technology Centre


