Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UDfhy-0008BJ-KH
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 19:38:28 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 07 Mar 2013 10:21:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,803,1355126400"; d="scan'208";a="296997561"
Received: from unknown (HELO helios.localnet) ([10.255.12.181])
	by fmsmga001.fm.intel.com with ESMTP; 07 Mar 2013 10:21:52 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 07 Mar 2013 18:21:51 +0000
Message-ID: <7880415.lJ2VTqbKKs@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-24-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <1362251176-26068-1-git-send-email-andrea.adami@gmail.com>
References: <1362251176-26068-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH] linux-yocto-tiny-kexecboot_3.2: set CONFIG_CRAMFS=y for Zaurus
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
X-List-Received-Date: Thu, 07 Mar 2013 18:38:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 02 March 2013 20:06:16 Andrea Adami wrote:
> * note: only collie is using cramfs as factory default
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../linux/linux-yocto-tiny-kexecboot-3.2/akita/akita-kexecboot.cfg      | 2
> +- .../linux/linux-yocto-tiny-kexecboot-3.2/c7x0/c7x0-kexecboot.cfg       
> | 2 +- .../linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-kexecboot.cfg
>    | 2 +-
> .../linux/linux-yocto-tiny-kexecboot-3.2/poodle/poodle-kexecboot.cfg    | 2
> +- .../linux/linux-yocto-tiny-kexecboot-3.2/spitz/spitz-kexecboot.cfg     
> | 2 +- .../linux/linux-yocto-tiny-kexecboot-3.2/tosa/tosa-kexecboot.cfg    
>    | 2 +- 6 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git
> a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/akita/akita-kexecboot
> .cfg
> b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/akita/akita-kexecboot
> .cfg index 82bb479..84523d7 100644
> ---
> a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/akita/akita-kexecboot
> .cfg +++
> b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/akita/akita-kexecboot
> .cfg @@ -1417,7 +1417,7 @@ CONFIG_UBIFS_FS_LZO=y
>  CONFIG_UBIFS_FS_ZLIB=y
>  # CONFIG_UBIFS_FS_DEBUG is not set
>  # CONFIG_LOGFS is not set
> -# CONFIG_CRAMFS is not set
> +CONFIG_CRAMFS=y
>  # CONFIG_SQUASHFS is not set
>  # CONFIG_VXFS_FS is not set
>  # CONFIG_MINIX_FS is not set
> diff --git
> a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/c7x0/c7x0-kexecboot.c
> fg
> b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/c7x0/c7x0-kexecboot.c
> fg index 0ef169b..0265150 100644
> ---
> a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/c7x0/c7x0-kexecboot.c
> fg +++
> b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/c7x0/c7x0-kexecboot.c
> fg @@ -1411,7 +1411,7 @@ CONFIG_UBIFS_FS_LZO=y
>  CONFIG_UBIFS_FS_ZLIB=y
>  # CONFIG_UBIFS_FS_DEBUG is not set
>  # CONFIG_LOGFS is not set
> -# CONFIG_CRAMFS is not set
> +CONFIG_CRAMFS=y
>  # CONFIG_SQUASHFS is not set
>  # CONFIG_VXFS_FS is not set
>  # CONFIG_MINIX_FS is not set
> diff --git
> a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-kexecbo
> ot.cfg
> b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-kexecbo
> ot.cfg index e01ceae..ba5334d 100644
> ---
> a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-kexecbo
> ot.cfg +++
> b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-kexecbo
> ot.cfg @@ -1315,7 +1315,7 @@ CONFIG_UBIFS_FS_LZO=y
>  CONFIG_UBIFS_FS_ZLIB=y
>  # CONFIG_UBIFS_FS_DEBUG is not set
>  # CONFIG_LOGFS is not set
> -# CONFIG_CRAMFS is not set
> +CONFIG_CRAMFS=y
>  # CONFIG_SQUASHFS is not set
>  # CONFIG_VXFS_FS is not set
>  # CONFIG_MINIX_FS is not set
> diff --git
> a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/poodle/poodle-kexecbo
> ot.cfg
> b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/poodle/poodle-kexecbo
> ot.cfg index 04e53bd..5acf22c 100644
> ---
> a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/poodle/poodle-kexecbo
> ot.cfg +++
> b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/poodle/poodle-kexecbo
> ot.cfg @@ -1319,7 +1319,7 @@ CONFIG_UBIFS_FS_LZO=y
>  CONFIG_UBIFS_FS_ZLIB=y
>  # CONFIG_UBIFS_FS_DEBUG is not set
>  # CONFIG_LOGFS is not set
> -# CONFIG_CRAMFS is not set
> +CONFIG_CRAMFS=y
>  # CONFIG_SQUASHFS is not set
>  # CONFIG_VXFS_FS is not set
>  # CONFIG_MINIX_FS is not set
> diff --git
> a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/spitz/spitz-kexecboot
> .cfg
> b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/spitz/spitz-kexecboot
> .cfg index 338209d..2e864c0 100644
> ---
> a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/spitz/spitz-kexecboot
> .cfg +++
> b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/spitz/spitz-kexecboot
> .cfg @@ -1416,7 +1416,7 @@ CONFIG_UBIFS_FS_LZO=y
>  CONFIG_UBIFS_FS_ZLIB=y
>  # CONFIG_UBIFS_FS_DEBUG is not set
>  # CONFIG_LOGFS is not set
> -# CONFIG_CRAMFS is not set
> +CONFIG_CRAMFS=y
>  # CONFIG_SQUASHFS is not set
>  # CONFIG_VXFS_FS is not set
>  # CONFIG_MINIX_FS is not set
> diff --git
> a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/tosa/tosa-kexecboot.c
> fg
> b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/tosa/tosa-kexecboot.c
> fg index 855d70b..e055f5b 100644
> ---
> a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/tosa/tosa-kexecboot.c
> fg +++
> b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/tosa/tosa-kexecboot.c
> fg @@ -1320,7 +1320,7 @@ CONFIG_UBIFS_FS_LZO=y
>  CONFIG_UBIFS_FS_ZLIB=y
>  # CONFIG_UBIFS_FS_DEBUG is not set
>  # CONFIG_LOGFS is not set
> -# CONFIG_CRAMFS is not set
> +CONFIG_CRAMFS=y
>  # CONFIG_SQUASHFS is not set
>  # CONFIG_VXFS_FS is not set
>  # CONFIG_MINIX_FS is not set

Applied, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


