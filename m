Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PiAx4-0005Wl-53
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 20:22:46 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PiAwH-00050V-Fb from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 11:21:57 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 26 Jan 2011 11:21:56 -0800
Received: from [172.30.80.64] ([172.30.80.64]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 26 Jan 2011 12:21:55 -0700
Message-ID: <4D40744F.5090105@mentor.com>
Date: Wed, 26 Jan 2011 12:21:51 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296065612-9637-1-git-send-email-rep.dot.nop@gmail.com>
	<1296065612-9637-4-git-send-email-rep.dot.nop@gmail.com>
In-Reply-To: <1296065612-9637-4-git-send-email-rep.dot.nop@gmail.com>
X-OriginalArrivalTime: 26 Jan 2011 19:21:55.0967 (UTC)
	FILETIME=[4B7CD8F0:01CBBD8E]
Subject: Re: [PATCH 3/9] IMAGE_CMD_ext4.xz: rm uncompressed image
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
X-List-Received-Date: Wed, 26 Jan 2011 19:22:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/26/2011 11:13 AM, Bernhard Reutner-Fischer wrote:
> Signed-off-by: Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>
> ---
>   conf/bitbake.conf |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 042a06c..4fbb6b6 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -387,7 +387,7 @@ IMAGE_CMD_ext3.bz2 = "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2fs -i 4096
>   IMAGE_CMD_ext4 = "genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4; set +e; e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4;chk=$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac;"
>   IMAGE_CMD_ext4.gz = "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4; set +e;e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4;chk=$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.gz"
>   IMAGE_CMD_ext4.bz2 = "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4; set +e; e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4;chk=$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac; bzip2 -f -9 ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4; mv ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4.bz2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.bz2"
> -IMAGE_CMD_ext4.xz = "install -d ${DEPLOY_DIR_IMAGE}/tmp.xz; genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4; set +e; e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4;chk=$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac; xz -c ${XZ_COMPRESSION_LEVEL} ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4>  ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.xz; rmdir ${DEPLOY_DIR_IMAGE}/tmp.xz"
> +IMAGE_CMD_ext4.xz = "install -d ${DEPLOY_DIR_IMAGE}/tmp.xz; genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4; set +e; e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4;chk=$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac; xz -c ${XZ_COMPRESSION_LEVEL} ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4>  ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.xz ; rm -f ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4 ; rmdir ${DEPLOY_DIR_IMAGE}/tmp.xz"
>
>   IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
>   IMAGE_CMD_squashfs-lzma = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzma ${EXTRA_IMAGECMD} -noappend -comp lzma"

Any reason we do xz -c < foo rather than just xz foo?  Then we wouldn't 
have to rm...

-- 
Tom Rini
Mentor Graphics Corporation


