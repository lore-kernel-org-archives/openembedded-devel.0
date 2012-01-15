Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RmDgR-0006Ue-Uc
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Jan 2012 01:10:52 +0100
Received: from mizar.localdomain (87.2.250.15) by smtp205.alice.it (8.6.023.02)
	id 4EECA2D803FF8E1E; Sun, 15 Jan 2012 01:03:20 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 15 Jan 2012 01:03:06 +0100
Message-Id: <1326585786-22118-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1326585786-22118-1-git-send-email-andrea.adami@gmail.com>
References: <1326585786-22118-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld] [PATCH 2/2] zaurus.inc: remove IMAGE_DEVICE_TABLES settings
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
X-List-Received-Date: Sun, 15 Jan 2012 00:10:52 -0000

* Zaurus devices are now only using devtmpfs enabled kernels

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus.inc |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index ee24900..4419192 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -17,11 +17,6 @@ EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
 
 EXTRA_IMAGEDEPENDS += "zaurus-installer"
 
-IMAGE_DEVICE_TABLES = "files/device_table-minimal.txt \
-                       files/device_table_add-scsi.txt \
-                       files/device_table_add-loop.txt \
-                       "
-
 #########
 # xserver
 #########
-- 
1.7.3.4



