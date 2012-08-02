Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Swpph-0000Kd-KF
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2012 09:28:33 +0200
Received: from mizar.localdomain (87.0.250.46) by smtp206.alice.it (8.6.023.02)
	id 500F3F9501DB4DFC; Thu, 2 Aug 2012 09:16:54 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Aug 2012 09:16:49 +0200
Message-Id: <1343891809-3929-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1343891809-3929-1-git-send-email-andrea.adami@gmail.com>
References: <1343891809-3929-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/2] zaurus.inc: ensure formfactor is installed in every image
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
X-List-Received-Date: Thu, 02 Aug 2012 07:28:33 -0000

* formfactor.bbappend of meta-handheld will provide rotation reading for psplash.
* This will be removed once formfactor will be a runtime dependency
* of oe-core's psplash.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index 899664a..cfcee14 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -110,8 +110,8 @@ MACHINE_EXTRA_RDEPENDS_collie = "zaurusd"
 # If set here, each image will also build linux-yocto-tiny-kexecboot and the updater
 # EXTRA_IMAGEDEPENDS += "zaurus-installer"
 
-# Install /boot/boot.cfg in target images
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS_append = " kexecboot-cfg "
+# Install /boot/boot.cfg in target images and formfactor (psplash checks rotation)
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS_append = " kexecboot-cfg formfactor"
 
 # Install kernel and symlink in /boot
-MACHINE_ESSENTIAL_EXTRA_RDEPENDS_append = " kernel-base kernel-image "
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS_append = " kernel-base kernel-image"
-- 
1.7.8.6



