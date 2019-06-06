Return-Path: <stefan@agner.ch>
X-Greylist: delayed 441 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 06 Jun 2019 14:17:09 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 3FFFF6D666
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jun 2019 14:17:09 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 281555C06C5;
	Thu,  6 Jun 2019 16:09:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1559830189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=S8KfjzF/p9/r/ZL6GVjBS6o9TuExCqcMLIwbFg1DVFs=;
	b=W9qK3TQ7GqizBICQtBNVxUBMA9ClwEOj75PoOn9Cyamk3URtNfgHvZrvFVeYG12S/6occ7
	TgNmXei3Z3Tsu0sF/N8fDuIG2iaCkmeUpfWhVJRz8Cl9S1CMQpWeoQYB8Qo3MFeLGi0cQY
	KpfM1a0MeH21WGLWae5lQSKt4VRs38A=
From: Stefan Agner <stefan@agner.ch>
To: raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Thu,  6 Jun 2019 16:09:14 +0200
Message-Id: <20190606140914.28713-1-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [meta-oe][PATCH] haveged: fix CPU cache size detection
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Jun 2019 14:17:09 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Fix ENOMEM error in case the kernel reports cache size of -1. This
lead to the following error when starting haveged:
  haveged starting up
  haveged: Couldn't initialize HAVEGE rng 5

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 .../haveged/fix-cpu-cache-size-detection.patch       | 20 ++++++++++++++++++++
 meta-oe/recipes-extended/haveged/haveged_1.9.4.bb    |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-extended/haveged/haveged/fix-cpu-cache-size-detection.patch

diff --git a/meta-oe/recipes-extended/haveged/haveged/fix-cpu-cache-size-detection.patch b/meta-oe/recipes-extended/haveged/haveged/fix-cpu-cache-size-detection.patch
new file mode 100644
index 000000000..5b68f1966
--- /dev/null
+++ b/meta-oe/recipes-extended/haveged/haveged/fix-cpu-cache-size-detection.patch
@@ -0,0 +1,20 @@
+Some ARM cpus does not report the cache size or say it is -1
+
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=866306
+
+Upstream-status: Pending
+
+Index: haveged-1.9.2/src/havegetune.c
+===================================================================
+--- haveged-1.9.2.orig/src/havegetune.c
++++ haveged-1.9.2/src/havegetune.c
+@@ -795,6 +795,9 @@ static int vfs_configInfoCache(
+          ctype = vfs_configFile(pAnchor, path, vfs_configType);
+          strcpy(path+plen, "size");
+          size  = vfs_configFile(pAnchor, path, vfs_configInt);
++         if (size == -1) {
++             size = ctype == 'I' ? GENERIC_ICACHE : GENERIC_DCACHE;
++         }
+          cfg_cacheAdd(pAnchor, SRC_VFS_INDEX,  pArgs[1], level, ctype, size);
+          }
+      }
diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.4.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.4.bb
index 32aab59f1..d0e1a29dd 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.4.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.4.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM="file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRCREV = "faa40ff345af194d3253f5fb030403e3c9831c36"
 SRC_URI = "git://github.com/jirka-h/haveged.git \
            file://haveged-init.d-Makefile.am-add-missing-dependency.patch \
+           file://fix-cpu-cache-size-detection.patch \
 "
 S = "${WORKDIR}/git"
 
-- 
2.13.6


