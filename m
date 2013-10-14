Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id F11DE6CEB9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 22:05:28 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d41so3594237eek.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 15:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QS/fbabfaKrGlxh9Olss3h7K5S0PFnp61aDjN/sY1Ro=;
	b=JzeJSz+AblOflxLah8ztmSbGAqH62TYsz/3SPhiS7Wbp2q9NkBELjfWOWgiV0HKOoy
	NrfAAthj7fYQ/lrwyRRNWQw2lNPYhsK1sVe+6dIP5FFiyXzE/aJnNeyrV6I+Di4+ydXz
	kg0/TdKrXPLcY7dk14mjJ2HhQuWoP8yRTtFbiFhK2kJhAV7Wn3DlXat683bgYt2Dgzr4
	P1WH5RuCGhCzzwrktddrdQXbdHcxsmUceTfVA/uoMxBvikjsO1RkajZHV1fVQGNyRCKX
	nT6niaftuHOM/27N852WVt5wp3HPICWb4CstBCg/XMk56PStRqcm7ks+Ua2z848fSE+e
	pdbw==
X-Received: by 10.14.194.131 with SMTP id m3mr59484369een.45.1381788330010;
	Mon, 14 Oct 2013 15:05:30 -0700 (PDT)
Received: from mizar.localdomain ([95.237.174.211])
	by mx.google.com with ESMTPSA id
	a6sm158417670eei.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Oct 2013 15:05:29 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2013 00:05:26 +0200
Message-Id: <1381788326-9316-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] zaurus: simplify JFFS2 creation using code in image_fstype.bbclass
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Oct 2013 22:05:30 -0000

fix ${ERASEBLOCKSIZE} remnant for collie

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/akita.conf  | 3 +--
 conf/machine/c7x0.conf   | 3 +--
 conf/machine/collie.conf | 8 +++++---
 conf/machine/poodle.conf | 3 +--
 conf/machine/spitz.conf  | 5 ++---
 conf/machine/tosa.conf   | 3 +--
 6 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/conf/machine/akita.conf b/conf/machine/akita.conf
index 12a2fe9..a6f6f14 100644
--- a/conf/machine/akita.conf
+++ b/conf/machine/akita.conf
@@ -11,8 +11,7 @@ require conf/machine/include/tune-xscale.inc
 PACKAGE_EXTRA_ARCHS_tune-xscale += "iwmmxt" 
 MACHINE_FEATURES += "iwmmxt"
 
-EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x20000"
-EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
+JFFS2_ERASEBLOCK = "0x20000"
 
 # UBI: max akita (128-7 MiB = 968 PEBs)
 # 121 x 1024 : 128 = 968 PEBs
diff --git a/conf/machine/c7x0.conf b/conf/machine/c7x0.conf
index ffa998d..4254258 100644
--- a/conf/machine/c7x0.conf
+++ b/conf/machine/c7x0.conf
@@ -11,8 +11,7 @@
 require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-xscale.inc
 
-EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x4000"
-EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
+JFFS2_ERASEBLOCK = "0x4000"
 
 # UBI: max c7x0 (128-7 MiB = 7744 PEBs)
 # 121 x 1024 : 16 = 7744 PEBs
diff --git a/conf/machine/collie.conf b/conf/machine/collie.conf
index 26bc257..baa2c0f 100644
--- a/conf/machine/collie.conf
+++ b/conf/machine/collie.conf
@@ -5,10 +5,12 @@
 require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-strongarm1100.inc
 
-EXTRA_IMAGECMD_jffs2 = "-p 14680064 -l -e 0x20000 -n"
-EXTRA_IMAGECMD_sum.jffs2 = "-p -l -e 0x20000 -n"
+JFFS2_ERASEBLOCK = "0x20000"
+
+EXTRA_IMAGECMD_jffs2 = "-p 14680064 -l -e ${JFFS2_ERASEBLOCK}"
+EXTRA_IMAGECMD_sum.jffs2 = "-p -l -e ${JFFS2_ERASEBLOCK}"
 
 # UBI: max collie (14.125 = 113 PEBs)
 # 14.125 x 1024 : 128 = 113 PEBs
 MKUBIFS_ARGS = "-m 2048 -e 129024 -c 113 -x zlib"
-UBINIZE_ARGS = "-m 2048 -p ${ERASEBLOCKSIZE} -s 512"
+UBINIZE_ARGS = "-m 2048 -p 131072 -s 512"
diff --git a/conf/machine/poodle.conf b/conf/machine/poodle.conf
index 53dbc4a..9d11893 100644
--- a/conf/machine/poodle.conf
+++ b/conf/machine/poodle.conf
@@ -8,8 +8,7 @@
 require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-xscale.inc
 
-EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x4000"
-EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
+JFFS2_ERASEBLOCK = "0x4000"
 
 # UBI: max poodle (64-7 MiB = 3648 PEBs)
 # 57 x 1024 : 16 = 3648 PEBs
diff --git a/conf/machine/spitz.conf b/conf/machine/spitz.conf
index 6a74165..9d41637 100644
--- a/conf/machine/spitz.conf
+++ b/conf/machine/spitz.conf
@@ -12,7 +12,7 @@
 #
 # SL-C3000 (16-7 MiB = 576 PEBs)
 # 9 x 1024 : 16 = 576 PEBs
-# EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x4000"
+# JFFS2_ERASEBLOCK = "0x4000"
 # MKUBIFS_ARGS = "-m 512 -e 15872 -c 576 -x zlib"
 # UBINIZE_ARGS = "-m 512 -p 16384 -s 256"
 
@@ -22,8 +22,7 @@ require conf/machine/include/tune-xscale.inc
 MACHINE_FEATURES += "iwmmxt"
 PACKAGE_EXTRA_ARCHS_tune-xscale += "iwmmxt"
 
-EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x20000"
-EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
+JFFS2_ERASEBLOCK = "0x20000"
 
 # UBI: max spitz (128-7 MiB = 968 PEBs)
 # 121 x 1024 : 128 = 968 PEBs
diff --git a/conf/machine/tosa.conf b/conf/machine/tosa.conf
index 0ec93c7..7e8c0da 100644
--- a/conf/machine/tosa.conf
+++ b/conf/machine/tosa.conf
@@ -8,8 +8,7 @@
 require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-xscale.inc
 
-EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x4000"
-EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
+JFFS2_ERASEBLOCK = "0x4000"
 
 # UBI: max tosa (128-7 MiB = 7744 PEBs)
 # 121 x 1024 : 16 = 7744 PEBs
-- 
1.8.1.5


