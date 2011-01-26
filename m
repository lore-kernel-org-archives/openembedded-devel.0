Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PiC5T-0001Lz-Fe
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 21:35:32 +0100
Received: by bwz10 with SMTP id 10so1704511bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 12:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=PKpL2QmudVi2hn2uGzhWX54TPPxGaTaGKq5Hh0EUyWs=;
	b=t41eWWGgiQrLVPx9pqhkU2/ovc3DVQR18g7NgAkJMf3+wDcrFkbl3LXgu1i66EbOyX
	wQsiO/h8uydKnCUtp0QrdBX3J3FOlwhncJFg/rlUrQ+vH/DydfRgXG3uEfNhF4Gia6eQ
	Y97lBgBJpAaozpE5Zarkke916nlr2uFNCMdR4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=j1EYSU4HE2wty3E1Tn1cWTfEgvqFFvSOVumdeNFK9kcPj8nEAse3/z3CFX+em8MVAY
	brQUlGhYX8Ef8v00BWcHwaJgcPyY/pXNMNzVN+ZToR7NmXcgK1L3hyg3U0ELrvExjRoa
	lgzl/A6WOIiIUJR4V2aWBoTpJe4jju9lG5L/0=
Received: by 10.204.51.65 with SMTP id c1mr788570bkg.185.1296072519948;
	Wed, 26 Jan 2011 12:08:39 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id f20sm7707592bkf.16.2011.01.26.12.08.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Jan 2011 12:08:38 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PiBfQ-0003Fr-SV; Wed, 26 Jan 2011 21:08:36 +0100
Date: Wed, 26 Jan 2011 21:08:36 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110126200836.GB714@mx.loc>
References: <1296065612-9637-1-git-send-email-rep.dot.nop@gmail.com>
	<1296065612-9637-4-git-send-email-rep.dot.nop@gmail.com>
	<4D40744F.5090105@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4D40744F.5090105@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Wed, 26 Jan 2011 20:35:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 26, 2011 at 12:21:51PM -0700, Tom Rini wrote:
>On 01/26/2011 11:13 AM, Bernhard Reutner-Fischer wrote:
>>Signed-off-by: Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>
>>---
>>  conf/bitbake.conf |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>>diff --git a/conf/bitbake.conf b/conf/bitbake.conf
>>index 042a06c..4fbb6b6 100644
>>--- a/conf/bitbake.conf
>>+++ b/conf/bitbake.conf
>>@@ -387,7 +387,7 @@ IMAGE_CMD_ext3.bz2 = "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2fs -i 4096
>>  IMAGE_CMD_ext4 = "genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4; set +e; e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4;chk=$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac;"
>>  IMAGE_CMD_ext4.gz = "install -d ${DEPLOY_DIR_IMAGE}/tmp.gz ; genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4; set +e;e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4;chk=$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext4.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.gz"
>>  IMAGE_CMD_ext4.bz2 = "install -d ${DEPLOY_DIR_IMAGE}/tmp.bz2 ; genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4; set +e; e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4;chk=$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac; bzip2 -f -9 ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4; mv ${DEPLOY_DIR_IMAGE}/tmp.bz2/${IMAGE_NAME}.rootfs.ext4.bz2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.bz2"
>>-IMAGE_CMD_ext4.xz = "install -d ${DEPLOY_DIR_IMAGE}/tmp.xz; genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4; set +e; e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4;chk=$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac; xz -c ${XZ_COMPRESSION_LEVEL} ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4>  ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.xz; rmdir ${DEPLOY_DIR_IMAGE}/tmp.xz"
>>+IMAGE_CMD_ext4.xz = "install -d ${DEPLOY_DIR_IMAGE}/tmp.xz; genext2fs -i 4096 -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4 ${EXTRA_IMAGECMD}; tune2fs -O extents,uninit_bg,dir_index,has_journal ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4; set +e; e2fsck -yfDC0 ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4;chk=$?; set -e; case $chk in 0|1|2);;*)exit $chk;;esac; xz -c ${XZ_COMPRESSION_LEVEL} ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4>  ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.xz ; rm -f ${DEPLOY_DIR_IMAGE}/tmp.xz/${IMAGE_NAME}.rootfs.ext4 ; rmdir ${DEPLOY_DIR_IMAGE}/tmp.xz"
>>
>>  IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
>>  IMAGE_CMD_squashfs-lzma = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzma ${EXTRA_IMAGECMD} -noappend -comp lzma"
>
>Any reason we do xz -c < foo rather than just xz foo?  Then we
>wouldn't have to rm...

yea, not really, but:
khem, re 3/9: The whole IMAGE generation is a pile of crap. We genext2fs
more often than i can count without stuttering
khem, there should be an .ext2 task and we can make
ext{3,4}{,.{Z,gz,bz2,xz}} out of that basic .ext2



