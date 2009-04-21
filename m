Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LwMkd-0004YO-Cd
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 22:39:31 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LwMgJ-00016T-1R
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 20:35:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 20:35:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 20:35:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 21 Apr 2009 22:32:36 +0200
Message-ID: <gslah4$mfs$1@ger.gmane.org>
References: <1238404723-8814-1-git-send-email-khimov@altell.ru>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <1238404723-8814-1-git-send-email-khimov@altell.ru>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] bitbake.conf: use ROOTFS_SIZE for gzip'd images
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
X-List-Received-Date: Tue, 21 Apr 2009 20:39:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30-03-09 11:18, Roman I Khimov wrote:
> Make ext2.gz and ext3.gz images use ROOTFS_SIZE parameter for genext2s (as
> non-compressed ext2 and ext3 does).

Is marcins patch to use du -k applicable as well? If not:

Acked-by: Koen Kooi <koen@openembedded.org>



> This allows to use IMAGE_EXTRA_SPACE configuration.
> ---
>   conf/bitbake.conf |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 7c159af..9d372f1 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -326,9 +326,9 @@ IMAGE_CMD_jffs2 = "mkfs.jffs2 -x lzo --root=${IMAGE_ROOTFS} --faketime --output=
>   IMAGE_CMD_yaffs2 = "mkyaffs2image ${EXTRA_IMAGECMD} ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.yaffs2"
>   IMAGE_CMD_cramfs = "mkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
>   IMAGE_CMD_ext2 = "genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}"
> -IMAGE_CMD_ext2.gz = "rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz&&  mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz; genext2fs -b ${IMAGE_ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.gz; rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz"
> +IMAGE_CMD_ext2.gz = "rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz&&  mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz; genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.gz; rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz"
>   IMAGE_CMD_ext3 = "genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3"
> -IMAGE_CMD_ext3.gz = "rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz&&  mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz; genext2fs -b ${IMAGE_ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.gz; rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz"
> +IMAGE_CMD_ext3.gz = "rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz&&  mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz; genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.gz; rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz"
>   IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
>   IMAGE_CMD_squashfs-lzma = "mksquashfs-lzma ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzma ${EXTRA_IMAGECMD} -noappend"
>   IMAGE_CMD_tar = "cd ${IMAGE_ROOTFS}&&  tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar ."




