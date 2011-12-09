Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RYzgq-00084U-Bo
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 13:36:36 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Dec 2011 04:29:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="94341304"
Received: from unknown (HELO helios.localnet) ([10.252.122.20])
	by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2011 04:29:44 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 09 Dec 2011 12:29:43 +0000
Message-ID: <2186162.576yhDyNMz@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-13-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <1323360390-12622-1-git-send-email-andrea.adami@gmail.com>
References: <1323360390-12622-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld][PATCH] zaurus.inc: adapt jffs2 and sum.jffs2 to changes in oe-core
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
X-List-Received-Date: Fri, 09 Dec 2011 12:36:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 08 December 2011 17:06:30 Andrea Adami wrote:
> * in oe-core jffs2 summary has been added to image_types.bbclass and
> * IMAGE_CMD_jffs2 now includes '-n' to skip cleanmarkers node creation
> * so we need to customize only padding, endianness and compression mode
> * While there remove compression settings which are handled in kernel.
> * This allows us to use the same string for mkfs.jffs2 and for sumtool.
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  conf/machine/include/zaurus.inc |   13 +++----------
>  1 files changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/conf/machine/include/zaurus.inc
> b/conf/machine/include/zaurus.inc index b488f37..0a9b1c5 100644
> --- a/conf/machine/include/zaurus.inc
> +++ b/conf/machine/include/zaurus.inc
> @@ -9,18 +9,11 @@ ERASEBLOCKSIZE_akita = "0x20000"
>  # C3100 and C3200 have same 128MiB NAND device as akita
>  ERASEBLOCKSIZE_spitz = "0x20000"
> 
> -IMAGE_FSTYPES += "jffs2 tar.gz"
> +IMAGE_FSTYPES += "tar.gz jffs2 sum.jffs2"
> 
>  # kernel now supports favourlzo
> -IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime -m
> favourlzo \ -                   --output=${T}/${IMAGE_NAME}.rootfs.jffs2
> --pad --little-endian --eraseblock=${ERASEBLOCKSIZE} -n \ -                
>   && sumtool -i ${T}/${IMAGE_NAME}.rootfs.jffs2 \ -                   -o
> ${T}/${IMAGE_NAME}.rootfs.jffs2.summary \
> -                   --eraseblock=${ERASEBLOCKSIZE} -l -p; \
> -                   cat ${T}/${IMAGE_NAME}.rootfs.jffs2 >
> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2; \ -                   rm
> ${T}/${IMAGE_NAME}.rootfs.jffs2; \
> -                   cat ${T}/${IMAGE_NAME}.rootfs.jffs2.summary >
> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.summary.jffs2; \ -                
>   rm ${T}/${IMAGE_NAME}.rootfs.jffs2.summary;"
> +EXTRA_IMAGECMD_jffs2 = "-p -l --eraseblock=${ERASEBLOCKSIZE}"
> +EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
> 
>  EXTRA_IMAGEDEPENDS += "zaurus-installer"

Merged to meta-handheld, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


