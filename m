Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L8dXl-0004hj-Ox
	for openembedded-devel@openembedded.org; Fri, 05 Dec 2008 17:28:42 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L8dUA-0002tU-Qh
	for openembedded-devel@openembedded.org; Fri, 05 Dec 2008 16:24:58 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 05 Dec 2008 16:24:58 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 05 Dec 2008 16:24:58 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 05 Dec 2008 17:24:46 +0100
Message-ID: <ghbkke$jfo$1@ger.gmane.org>
References: <200812051715.45106.openembedded@haerwu.biz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081130 Shredder/3.0b1pre
In-Reply-To: <200812051715.45106.openembedded@haerwu.biz>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] Auto resizing ext2/ext3 images (from Poky)
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
X-List-Received-Date: Fri, 05 Dec 2008 16:28:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05-12-08 17:15, Marcin Juszkiewicz wrote:
> During my work for OpenedHand I wrote one usefull thing which we used for
> ext2/ext3 images - autosizing.
>
> In few words: it checks how big rootfs is, adds IMAGE_EXTRA_SPACE amount
> of kilobytes to it and gives that size to genext2fs.
>
> Below is a patch with code changes. Check it and say what You think about
> it. One thing is missing - support for fixed size ext2/3 images big enough
> to fit resulting rootfs.

Looks good to me.

regards,

Koen

>
> diff --git a/classes/image.bbclass b/classes/image.bbclass
> index e9c0ecd..901ab34 100644
> --- a/classes/image.bbclass
> +++ b/classes/image.bbclass
> @@ -107,6 +107,7 @@ fakeroot do_rootfs () {
>
>   	${IMAGE_PREPROCESS_COMMAND}
>
> +	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{print ${IMAGE_EXTRA_SPACE} + $1}'`
>   	${@get_imagecmds(d)}
>
>   	${IMAGE_POSTPROCESS_COMMAND}
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 8a754fd..159f17f 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -302,9 +302,9 @@ IMAGE_CMD = ""
>   IMAGE_CMD_jffs2 = "mkfs.jffs2 -x lzo --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
>   IMAGE_CMD_yaffs2 = "mkyaffs2image ${EXTRA_IMAGECMD} ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.yaffs2"
>   IMAGE_CMD_cramfs = "mkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
> -IMAGE_CMD_ext2 = "genext2fs -b ${IMAGE_ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}"
> +IMAGE_CMD_ext2 = "genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}"
>   IMAGE_CMD_ext2.gz = "rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz&&  mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz; genext2fs -b ${IMAGE_ROOTFS_SIZE} -d ${IMAGE_ROOTFS}
> ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2; mv
> ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.gz; rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz"
> -IMAGE_CMD_ext3 = "genext2fs -b ${IMAGE_ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j
> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3"
> +IMAGE_CMD_ext3 = "genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j
> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3"
>   IMAGE_CMD_ext3.gz = "rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz&&  mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz; genext2fs -b ${IMAGE_ROOTFS_SIZE} -d ${IMAGE_ROOTFS}
> ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; gzip -f -9
> ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3.gz
> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.gz; rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz"
>   IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
>   IMAGE_CMD_squashfs-lzma = "mksquashfs-lzma ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzma ${EXTRA_IMAGECMD} -noappend"




