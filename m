Received: from exprod5og106.obsmtp.com ([64.18.0.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1NpMxm-00020H-9z
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 15:32:43 +0100
Received: from source ([4.78.218.129]) (using TLSv1) by
	exprod5ob106.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS5es2Q3t3CHZOPb3UptQ9aiy2tfcP4v5@postini.com;
	Wed, 10 Mar 2010 06:29:47 PST
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by Cinmlip07.e2k.ad.ge.com with ESMTP; 10 Mar 2010 08:26:17 -0500
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 10 Mar 2010 08:26:14 -0500
Message-ID: <4B979EB7.4000004@ge.com>
Date: Wed, 10 Mar 2010 13:29:27 +0000
From: Martyn Welch <martyn.welch@ge.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1268156863.16526.133.camel@trini-m4400>
	<1268213424-16360-1-git-send-email-sledz@dresearch.de>
In-Reply-To: <1268213424-16360-1-git-send-email-sledz@dresearch.de>
X-SA-Exim-Connect-IP: 64.18.0.182
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] bitbake.conf: introducing new image fstype	.cpio.gz.u-boot
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
X-List-Received-Date: Wed, 10 Mar 2010 14:32:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Steffen Sledz wrote:
> * initrd images need to be prepared with mkimage to be usable from u-boot
>
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
>   

Works for me on a PowerPC board:

Acked-by: Martyn Welch <martyn.welch@gefanuc.com>


> ---
>  classes/image.bbclass |    1 +
>  conf/bitbake.conf     |    2 ++
>  2 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/classes/image.bbclass b/classes/image.bbclass
> index 9dce609..8e202f0 100644
> --- a/classes/image.bbclass
> +++ b/classes/image.bbclass
> @@ -1,4 +1,5 @@
>  inherit rootfs_${IMAGE_PKGTYPE}
> +inherit kernel-arch
>  
>  LICENSE = "MIT"
>  PACKAGES = ""
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 3a68959..c020efe 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -374,6 +374,7 @@ IMAGE_CMD_tar.gz = "cd ${IMAGE_ROOTFS} && tar -zcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_
>  IMAGE_CMD_tar.bz2 = "cd ${IMAGE_ROOTFS} && tar -jcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.bz2 ."
>  IMAGE_CMD_cpio = "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio) ${EXTRA_IMAGECMD}"
>  IMAGE_CMD_cpio.gz = "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz) ${EXTRA_IMAGECMD}"
> +IMAGE_CMD_cpio.gz.u-boot = "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz) ${EXTRA_IMAGECMD}; mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C gzip -n ${IMAGE_NAME} -d ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz.u-boot"
>  IMAGE_CMD_cpio.lzma = "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | lzma -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}"
>  IMAGE_CMD_ubi = "echo \[ubifs\] > ubinize.cfg ; echo mode=ubi >> ubinize.cfg ; echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs >> ubinize.cfg ; echo vol_id=0 >> ubinize.cfg ; echo vol_type=dynamic >> ubinize.cfg ; echo vol_name=${UBI_VOLNAME} >> ubinize.cfg ; echo vol_flags=autoresize >> ubinize.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg"
>  IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS}"
> @@ -397,6 +398,7 @@ IMAGE_DEPENDS_ext2 = "genext2fs-native"
>  IMAGE_DEPENDS_ext2.gz = "genext2fs-native"
>  IMAGE_DEPENDS_ext3 = "genext2fs-native e2fsprogs-native"
>  IMAGE_DEPENDS_ext3.gz = "genext2fs-native e2fsprogs-native"
> +IMAGE_DEPENDS_cpio.gz.u-boot = "u-boot-mkimage-native"
>  IMAGE_DEPENDS_cpio.lzma = "lzma-native"
>  IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
>  IMAGE_DEPENDS_squashfs-lzma = "squashfs-tools-native"
>   


-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189



