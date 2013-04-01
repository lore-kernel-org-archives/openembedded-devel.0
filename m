Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UMb4j-00074C-HJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Apr 2013 11:30:49 +0200
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id EC464EA048
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Apr 2013 11:23:21 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 8667AA40709; Mon,  1 Apr 2013 11:13:59 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Apr 2013 11:13:26 +0200
Message-Id: <ed2406384da34b0dc86c693e481cda9c244f803c.1364806552.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364806552.git.apelete@seketeli.net>
References: <cover.1364806552.git.apelete@seketeli.net>
In-Reply-To: <cover.1364806552.git.apelete@seketeli.net>
References: <cover.1364806552.git.apelete@seketeli.net>
Subject: [meta-handheld][PATCH 2/2] ben-nanonote: clean machine conf according to oe-core rules
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
X-List-Received-Date: Mon, 01 Apr 2013 09:30:49 -0000

The following changes were done to comply with oe-core rules:
- use DEFAULTTUNE from conf/machine/include/tune-mips32.inc in oe-core
  repository instead of setting TARGET_ARCH,
- remove IMAGE_FSTYPES setting, this is done in distro configuration.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 conf/machine/ben-nanonote.conf       |    3 ---
 conf/machine/include/tune-mips32.inc |    3 ---
 2 files changed, 6 deletions(-)
 delete mode 100644 conf/machine/include/tune-mips32.inc

diff --git a/conf/machine/ben-nanonote.conf b/conf/machine/ben-nanonote.conf
index e53cb3f..1ce5815 100644
--- a/conf/machine/ben-nanonote.conf
+++ b/conf/machine/ben-nanonote.conf
@@ -2,7 +2,6 @@
 #@NAME: Ben Nanonote
 #@DESCRIPTION: Machine configuration for the Qi-Hardware's Ben Nanonote
 
-TARGET_ARCH = "mipsel"
 require conf/machine/include/tune-mips32.inc
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-jlime-ben-nanonote"
@@ -11,8 +10,6 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-jlime-ben-nanonote"
 #KERNEL_IMAGETYPE = "uImage"
 KERNEL_IMAGETYPE = "vmlinux.bin"
 
-IMAGE_FSTYPES =+ "jffs2"
-
 PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
 PREFERRED_VERSION_xserver-kdrive = "1.3.0.0"
 
diff --git a/conf/machine/include/tune-mips32.inc b/conf/machine/include/tune-mips32.inc
deleted file mode 100644
index 67edca2..0000000
--- a/conf/machine/include/tune-mips32.inc
+++ /dev/null
@@ -1,3 +0,0 @@
-TARGET_CC_ARCH = "-march=mips32"
-FEED_ARCH = "${TARGET_ARCH}"
-BASE_PACKAGE_ARCH = "${TARGET_ARCH}"
-- 
1.7.10.4



