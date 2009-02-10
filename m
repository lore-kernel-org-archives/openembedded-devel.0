Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LWzXr-0000Xx-JB
	for openembedded-devel@openembedded.org; Tue, 10 Feb 2009 21:49:27 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090210204819.XJDI8485.fed1rmmtao105.cox.net@fed1rmimpo02.cox.net>;
	Tue, 10 Feb 2009 15:48:19 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo02.cox.net with bizsmtp
	id ELoJ1b0051E665w04LoJJS; Tue, 10 Feb 2009 15:48:18 -0500
X-Authority-Analysis: v=1.0 c=1 a=VuR7V1Ii2mUA:10 a=yomc03Q_ZLsA:10
	a=ujUVQg6_KHiZ9SmS8VoA:9 a=KGIRn0VTeBqJer4mw0QA:7
	a=KMX1jjNHyjOzi0h4aRdG6BA6UKAA:4 a=b8hG5vVbyAkA:10
X-CM-Score: 0.00
Date: Tue, 10 Feb 2009 13:48:17 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090210204817.GH11815@smtp.west.cox.net>
MIME-Version: 1.0
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: [RFC] Add ubi volume image support, fix ubifs
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
X-List-Received-Date: Tue, 10 Feb 2009 20:49:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey all.  I'd like to commit the following patch.  This will add support
for generating single image UBI volumes as well as fix creating ubifs
images.  Going backwards here, the problem with ubifs images right now
is that you must pass in -m -e -c -r and -o args in order to get an
image to come out and only -r / -o are not flash part specific.  To fix
this, on ubifs images, pass in ${MKUBIFS_ARGS}.  Why not just
${EXTRA_IMAGECMD} ? That's because making a UBI volume requires a
different set of mandatory arguments too.  And as there's no way (today)
to have IMAGETYPE=foo require IMAGETYPE=bar to be built previously, we
need to use a separate mechanism here (similar to ext2/3 and blocksize).
To pass in the ubinize args we then go and set UBINIZE_ARGS and then we
get our 1 image UBI volume to come out if mtd-utils-native=1.2.0+git is
being used.

As an example, on a board we have with a Samsung K9F2G08U0M we do:
# Make 256MiB/128KiB
MKUBIFS_ARGS = "-m 2048 -e 126976 -c 2047"
UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"

Note that for ubinize we get around needing to pass in a vol_size param
by dropping it (causing the image to be exactly the size of the
contents) and then setting the resize flag so that when written it will
take up all the room it can.

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 81d4c93..61e8948 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -329,7 +329,8 @@ IMAGE_CMD_tar.gz = "cd ${IMAGE_ROOTFS} && tar -zcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_
 IMAGE_CMD_tar.bz2 = "cd ${IMAGE_ROOTFS} && tar -jcvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.bz2 ."
 IMAGE_CMD_cpio = "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio) ${EXTRA_IMAGECMD}"
 IMAGE_CMD_cpio.gz = "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz) ${EXTRA_IMAGECMD}"
-IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img"
+IMAGE_CMD_ubi = "echo \[ubifs\] > ubinize.cfg ; echo mode=ubi >> ubinize.cfg ; echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs >> ubinize.cfg ; echo vol_id=0 >> ubinize.cfg ; echo vol_type=dynamic >> ubinize.cfg ; echo vol_name=rootfs >> ubinize.cfg ; echo vol_flags=autoresize >> ubinize.cfg;mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS} && ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg"
+IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS}"
 
 EXTRA_IMAGECMD = ""
 EXTRA_IMAGECMD_jffs2 = ""
@@ -338,6 +339,7 @@ EXTRA_IMAGECMD_squashfs = ""
 EXTRA_IMAGECMD_squashfs-lzma = ""
 EXTRA_IMAGECMD_cpio = ""
 EXTRA_IMAGECMD_cpio.gz = ""
+EXTRA_IMAGECMD_ubi = ""
 EXTRA_IMAGECMD_ubifs = ""
 
 IMAGE_DEPENDS = ""
@@ -350,6 +352,7 @@ IMAGE_DEPENDS_ext3 = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_ext3.gz = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
 IMAGE_DEPENDS_squashfs-lzma = "squashfs-lzma-tools-native"
+IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 
 EXTRA_IMAGEDEPENDS = ""

-- 
Tom Rini


