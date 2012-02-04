Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Rtnmn-0004WJ-Ng
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 23:08:45 +0100
Received: from mizar.localdomain (87.14.255.111) by smtp208.alice.it
	(8.6.023.02) id 4F056E850336BEB3; Sat, 4 Feb 2012 23:00:46 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat,  4 Feb 2012 23:00:42 +0100
Message-Id: <1328392842-23520-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld][PATCH] zaurus.inc: always provide kernel in /boot
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
X-List-Received-Date: Sat, 04 Feb 2012 22:08:45 -0000

* install kernel and symlink as expected by kexecboot
* for compatibility with images using minimal tasks
* (kexec)boot tested: opie-image and core-image-minimal

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index e833ecc..bd0d6f4 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -82,7 +82,8 @@ MACHINE_EXTRA_RDEPENDS_collie = "zaurusd"
 # Install /boot/boot.cfg in target images
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS_append = " kexecboot-cfg "
 
-
+# Install kernel and symlink in /boot, add kernel-modules metapackage
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS_append = " kernel-base kernel-image "
 
 # FIXME
 # blindly import from linux-rp.inc (2.6.2x)
-- 
1.7.3.4



