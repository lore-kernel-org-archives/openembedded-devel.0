Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LX2yN-0003qI-Be
	for openembedded-devel@openembedded.org; Wed, 11 Feb 2009 01:29:03 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090211002754.KSGA8485.fed1rmmtao105.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Feb 2009 19:27:54 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id EQTs1b00F1E665w04QTsB3; Tue, 10 Feb 2009 19:27:52 -0500
X-Authority-Analysis: v=1.0 c=1 a=xH9YHErz6UQA:10 a=SkQkoGgxQdMA:10
	a=hXa-ka_0g6Q-LWe8HlwA:9 a=wxjE0mN9Gl-hSRSf8Jliv66qbL8A:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 10 Feb 2009 17:27:52 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090211002752.GJ11815@smtp.west.cox.net>
References: <20090210204817.GH11815@smtp.west.cox.net>
	<03499B67-9FFC-43D7-91C4-A92ECDB55370@student.utwente.nl>
	<20090210225940.GI11815@smtp.west.cox.net>
	<gmt3da$4r1$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gmt3da$4r1$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [RFC] Add ubi volume image support, fix ubifs
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
X-List-Received-Date: Wed, 11 Feb 2009 00:29:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 11, 2009 at 12:42:34AM +0100, Koen Kooi wrote:
> On 10-02-09 23:59, Tom Rini wrote:
[snip]
>> Really?  iirc from the mounting commandline stuff that means you have to
>> pass in machine-rootfs rather than just rootfs, ie
>> root=ubi0:machine-rootfs not root=ubi0:rootfs
>
> You'll have to update your bootloaders anyway, so cutting down on  
> 'flashed wrong machine' errors is a big win :)

The PoV we have is of starting things from scratch, so that's not
something we worry about.  How about this so distros can take care of
it?

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 61e8948..b00d125 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -314,6 +314,8 @@ IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
 IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
 IMAGE_EXTRA_SPACE = 10240
 
+UBI_VOLNAME ?= "${MACHINE}-rootfs"
+
 IMAGE_CMD = ""
 IMAGE_CMD_jffs2 = "mkfs.jffs2 -x lzo --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
 IMAGE_CMD_yaffs2 = "mkyaffs2image ${EXTRA_IMAGECMD} ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.yaffs2"
@@ -329,7 +331,7 @@ IMAGE_CMD_tar.gz = "cd ${IMAGE_ROOTFS} && tar -zcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_
 IMAGE_CMD_tar.bz2 = "cd ${IMAGE_ROOTFS} && tar -jcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.bz2 ."
 IMAGE_CMD_cpio = "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio) ${EXTRA_IMAGECMD}"
 IMAGE_CMD_cpio.gz = "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz) ${EXTRA_IMAGECMD}"
-IMAGE_CMD_ubi = "echo \[ubifs\] > ubinize.cfg ; echo mode=ubi >> ubinize.cfg ; echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs >> ubinize.cfg ; echo vol_id=0 >> ubinize.cfg ; echo vol_type=dynamic >> ubinize.cfg ; echo vol_name=rootfs >> ubinize.cfg ; echo vol_flags=autoresize >> ubinize.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg"
+IMAGE_CMD_ubi = "echo \[ubifs\] > ubinize.cfg ; echo mode=ubi >> ubinize.cfg ; echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs >> ubinize.cfg ; echo vol_id=0 >> ubinize.cfg ; echo vol_type=dynamic >> ubinize.cfg ; echo vol_name=${UBI_VOLNAME} >> ubinize.cfg ; echo vol_flags=autoresize >> ubinize.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg"
 IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS}"
 
 EXTRA_IMAGECMD = ""

-- 
Tom Rini


