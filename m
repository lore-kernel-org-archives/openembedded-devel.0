Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RmEQ8-0007ee-M8
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Jan 2012 01:58:04 +0100
Received: from mizar.localdomain (87.2.250.15) by smtp207.alice.it (8.6.023.02)
	id 4F05A66500EB5999; Sun, 15 Jan 2012 01:50:30 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 15 Jan 2012 01:50:26 +0100
Message-Id: <1326588627-28727-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld] [PATCH 1/2] zaurus.inc: add settings for INITRAMFS_FSTYPES
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
X-List-Received-Date: Sun, 15 Jan 2012 00:58:04 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index 4419192..7ff56fc 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -10,6 +10,7 @@ ERASEBLOCKSIZE_akita = "0x20000"
 ERASEBLOCKSIZE_spitz = "0x20000"
 
 IMAGE_FSTYPES ?= "tar.gz jffs2 sum.jffs2"
+INITRAMFS_FSTYPES ?= "cpio.gz cpio.lzma"
 
 # kernel now supports favourlzo
 EXTRA_IMAGECMD_jffs2 = "-p -l --eraseblock=${ERASEBLOCKSIZE}"
-- 
1.7.3.4



