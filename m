Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Alexander.Stohr@gmx.de>) id 1QkGml-0003Ci-J7
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jul 2011 16:33:04 +0200
Received: (qmail 14389 invoked by uid 0); 22 Jul 2011 14:22:15 -0000
Received: from 193.8.40.126 by www007.gmx.net with HTTP;
	Fri, 22 Jul 2011 16:22:14 +0200 (CEST)
Date: Fri, 22 Jul 2011 16:22:14 +0200
From: "Alexander Stohr" <Alexander.Stohr@gmx.de>
Message-ID: <20110722142214.326020@gmx.net>
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Authenticated: #15156664
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX18xgi0w7Swxntiw/LxsXoy/B7ZKJzIzIQcQMFSQ8F
	Ratv7gYJOabq+W/Z+Rw6EQYLwiGZepplikZw== 
X-GMX-UID: 3sFPJDIJaHItecIXwSUlP1JiamdhZESR
Cc: tytso@mit.edu, fpletz@franz-pletz.org, xavier.bestel@free.fr
Subject: [PATCH] openembedded bitbake conf: fix for file system image creation
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
X-List-Received-Date: Fri, 22 Jul 2011 14:33:04 -0000
X-Groupsio-MsgNum: 33292
Content-Type: multipart/mixed; boundary="========GMX32602131134453416697"

--========GMX32602131134453416697
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

i've come to the insight that the tool "genext2fs"
does a very limited job in respect to what i would
consider current file system standards.

it does what its name says: generating an ext2 file system.
it does _not_:
- generate an UUID
- set the revision level to >0 (that might indicate an ext3 file system)
- set the members that come with a revision >0

if later on a "tune2fs -j" is applied to such an ext2 file system (as specified by OE bitbake.conf)
then a journal is created making it effectively an ext3 file system.
this step does _not_:
- generate an UUID
- set the revision level to >0 (that might indicate an ext3 file system)
- set the members that come with a revision >0
this might or might not be correct in terms of the tool.
with my limited knowledge level=0 might not be allowed to receive a journal - or alternatively when the journal is added the level value and members should see an update.

my short term choice was the addition of "e2fschk -y <image>" to my local version of the OE bitbake.conf file. (see patch below. Note: that my local file is not a current version, ext4 and misc packer formats are missing but you should be able to get the clue on the subject.)
this step _does_:
- generate an UUID
- set the revision level to >0 (that might indicate an ext3 file system)
- set the members that come with a revision >0

as a result i get sane, checked and thus most probably working file system image. any later fs check on the image will either succeed or fail depending on what changes the file system has seen since its creation.
if that step is not applied i would never be able to automatically verify the file system since it had errors inside at already its release time.

regards, Alex.
-- 
NEU: FreePhone - 0ct/min Handyspartarif mit Geld-zurück-Garantie!		
Jetzt informieren: http://www.gmx.net/de/go/freephone

--========GMX32602131134453416697
Content-Type: text/x-patch; charset="iso-8859-15"; name="bitbake.conf.diff"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="bitbake.conf.diff"

--- bitbake.conf.orig	2011-07-22 15:56:09.000000000 +0200
+++ bitbake.conf	2011-07-22 15:55:18.000000000 +0200
@@ -330,8 +330,8 @@
 IMAGE_CMD_cramfs = "mkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
 IMAGE_CMD_ext2 = "genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}"
 IMAGE_CMD_ext2.gz = "rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz && mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz; genext2fs -b ${IMAGE_ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2 ${EXTRA_IMAGECMD}; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.gz; rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz"
-IMAGE_CMD_ext3 = "genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3"
-IMAGE_CMD_ext3.gz = "rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz && mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz; genext2fs -b ${IMAGE_ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.gz; rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz"
+IMAGE_CMD_ext3 = "genext2fs -b ${ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3; e2fsck -y ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3"
+IMAGE_CMD_ext3.gz = "rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz && mkdir ${DEPLOY_DIR_IMAGE}/tmp.gz; genext2fs -b ${IMAGE_ROOTFS_SIZE} -d ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3 ${EXTRA_IMAGECMD}; tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; e2fsck -y ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3; mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext3.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.gz; rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz"
 IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
 IMAGE_CMD_squashfs-lzma = "mksquashfs-lzma ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzma ${EXTRA_IMAGECMD} -noappend"
 IMAGE_CMD_tar = "cd ${IMAGE_ROOTFS} && tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar ."

--========GMX32602131134453416697--
