Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Rnedf-0002r3-1b
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jan 2012 00:09:55 +0100
Received: from mizar.localdomain (87.0.248.69) by smtp205.alice.it (8.6.023.02)
	id 4EECA2D804895C2E; Thu, 19 Jan 2012 00:02:18 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Jan 2012 00:02:10 +0100
Message-Id: <1326927730-21142-4-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1326927730-21142-1-git-send-email-andrea.adami@gmail.com>
References: <1326927730-21142-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld] [PATCH 3/3] zaurus-installer: Inhibit toolchain dependencies
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
X-List-Received-Date: Wed, 18 Jan 2012 23:09:55 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/zaurus-utils/zaurus-installer.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/zaurus-utils/zaurus-installer.bb b/recipes-bsp/zaurus-utils/zaurus-installer.bb
index 7eb8fb5..785836f 100644
--- a/recipes-bsp/zaurus-utils/zaurus-installer.bb
+++ b/recipes-bsp/zaurus-utils/zaurus-installer.bb
@@ -3,7 +3,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 DEPENDS = "${@base_conditional('MACHINE', 'collie', 'linux-kexecboot', 'zaurus-updater linux-kexecboot', d)}"
 DEPENDS += "${@base_conditional('MACHINE', 'spitz', 'zaurus-legacy-tar', '', d)}"
-PR = "r5"
+PR = "r6"
+
+INHIBIT_DEFAULT_DEPS = "1"
 
 do_compile() {
         :
-- 
1.7.3.4



