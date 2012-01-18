Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Rnedc-0002r3-OX
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jan 2012 00:09:52 +0100
Received: from mizar.localdomain (87.0.248.69) by smtp205.alice.it (8.6.023.02)
	id 4EECA2D804895BD3; Thu, 19 Jan 2012 00:02:16 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Jan 2012 00:02:08 +0100
Message-Id: <1326927730-21142-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1326927730-21142-1-git-send-email-andrea.adami@gmail.com>
References: <1326927730-21142-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld] [PATCH 1/3] zaurus-updater: Inhibit toolchain dependencies
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
X-List-Received-Date: Wed, 18 Jan 2012 23:09:52 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/zaurus-utils/zaurus-updater.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/zaurus-utils/zaurus-updater.bb b/recipes-bsp/zaurus-utils/zaurus-updater.bb
index 450f4bb..93fabeb 100644
--- a/recipes-bsp/zaurus-utils/zaurus-updater.bb
+++ b/recipes-bsp/zaurus-utils/zaurus-updater.bb
@@ -2,7 +2,9 @@ DESCRIPTION = "Encrypted shellscript for the Zaurus ROM update"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://updater.sh;endline=59;md5=667f442c1e555f21adb58957306612cc"
 DEPENDS = "encdec-updater-native"
-PR = "r26"
+PR = "r27"
+
+INHIBIT_DEFAULT_DEPS = "1"
 
 SRC_URI = "file://updater.sh"
 
@@ -20,7 +22,6 @@ do_compile() {
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 PACKAGES = ""
 
-
 COMPATIBLE_MACHINE = "(poodle|c7x0|spitz|akita|tosa)"
 
 inherit deploy
-- 
1.7.3.4



