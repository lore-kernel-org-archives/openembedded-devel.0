Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PzyCH-0005rq-MI
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 22:24:02 +0100
Received: from gandalf.denix.org ([unknown] [71.251.48.61])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LI600HLT37V1053@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	16 Mar 2011 15:21:37 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8A77314AF6A; Wed,
	16 Mar 2011 16:21:31 -0400 (EDT)
Date: Wed, 16 Mar 2011 16:21:31 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110316202131.GF3042@denix.org>
References: <cover.1300293663.git.bengardiner@nanometrics.ca>
	<5156e672c781e8a44e02f9eb4351cb8c476c3a60.1300293663.git.bengardiner@nanometrics.ca>
MIME-version: 1.0
In-reply-to: <5156e672c781e8a44e02f9eb4351cb8c476c3a60.1300293663.git.bengardiner@nanometrics.ca>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [2010.03-maintenance] [PATCH 2/7] bitbake.conf: use	.ubifs.img extension in IMAGE_CMD_ubi
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
X-List-Received-Date: Wed, 16 Mar 2011 21:24:02 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Mar 16, 2011 at 12:50:35PM -0400, Ben Gardiner wrote:
> The current IMAGE_CMD_ubi creates an interim image with a .rootfs.ubifs
> extension.
> 
> The ubifs image created is not considered a valid rootfs without a UBI
> container.
> 
> Change the filename of the iterim ubifs image used by IMAGE_CMD_ubi to
> .ubifs.img to match the IMAGE_CMD_ubifs command.
> 
> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
> Acked-by: Denys Dmytriyenko <denys@ti.com>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> (backported from commit 7308e68fc26cdbffa08d311a2319c8d1c3b2805f -- some
> changes were needed since commit 312b42bcf2cc9b11266ba497ade68e8ddabb3007
> bitbake.conf: add XZ_INTEGRITY_CHECK and LZMA_COMPRESSION_LEVEL variables
> has not been applied to 2011.03-maintenance)
> 
> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>

Acked-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  conf/bitbake.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 1002c01..01b9321 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -399,7 +399,7 @@ IMAGE_CMD_cpio.gz = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio
>  IMAGE_CMD_cpio.xz = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | xz -c ${XZ_COMPRESSION_LEVEL} > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.xz) ${EXTRA_IMAGECMD}"
>  IMAGE_CMD_cpio.gz.u-boot = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz) ${EXTRA_IMAGECMD}; mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C gzip -n ${IMAGE_NAME} -d ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz.u-boot"
>  IMAGE_CMD_cpio.lzma = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | lzma -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}"
> -IMAGE_CMD_ubi = "echo \[ubifs\] > ubinize.cfg ; echo mode=ubi >> ubinize.cfg ; echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs >> ubinize.cfg ; echo vol_id=0 >> ubinize.cfg ; echo vol_type=dynamic >> ubinize.cfg ; echo vol_name=${UBI_VOLNAME} >> ubinize.cfg ; echo vol_flags=autoresize >> ubinize.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg"
> +IMAGE_CMD_ubi = "echo \[ubifs\] > ubinize.cfg ; echo mode=ubi >> ubinize.cfg ; echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img >> ubinize.cfg ; echo vol_id=0 >> ubinize.cfg ; echo vol_type=dynamic >> ubinize.cfg ; echo vol_name=${UBI_VOLNAME} >> ubinize.cfg ; echo vol_flags=autoresize >> ubinize.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg"
>  IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS}"
>  
>  EXTRA_IMAGECMD = ""
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


