Received: from smtp202.alice.it ([82.57.200.98])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1QXaVc-0004mv-53
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Jun 2011 16:58:56 +0200
Received: from localhost.localdomain (95.244.3.148) by smtp202.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4DEE15AB003380CF; Fri, 17 Jun 2011 16:55:27 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jun 2011 16:55:22 +0200
Message-Id: <1308322522-11406-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] bitbake.conf: remove -e from LZMA_COMPRESSION_LEVEL because no such option exist in lzma
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
X-List-Received-Date: Fri, 17 Jun 2011 14:58:56 -0000

Without this patch we have:
  + cpio -o -H newc
  + lzma -c -e -9
  lzma: invalid option -- 'e'
during a initramfs-kexecboot-klibc-image.

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 17a494d..9e67320 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -149,7 +149,7 @@ QEMU_OPTIONS_armv7a   = "-cpu cortex-a8"
 
 # default compression levels
 XZ_COMPRESSION_LEVEL ?= "-e -9"
-LZMA_COMPRESSION_LEVEL ?= "-e -9"
+LZMA_COMPRESSION_LEVEL ?= "-9"
 
 # default integrity check
 XZ_INTEGRITY_CHECK ?= "crc32"
-- 
1.7.0.4



