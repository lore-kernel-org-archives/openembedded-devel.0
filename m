Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 11D9B6CDB6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 21:34:29 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e52so3684817eek.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 14:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SPd1Lxh7HLG6QX5tAWB3n/ivLLFFbDbrGr1vu+4s9Us=;
	b=sZAEbt71mO/Z3Mn/CAc5wPwl7Op1LWl+oI2h+KGxPgNzqDNBBFhVAGuVODM5CSJPkt
	b5+cpKVLbrRypYOOCPRxkytT+pk8t2bBEOVWaVU+xnnqypNrRtRwX3DSBqI8vDx1Y1a9
	lhqOFJDYeIntobCLbpdWCYLJtXspbVL5EWVRIsUrnY4B3n3OcwzSGTVOvWG36DX+oYCQ
	OjVVZMDkRW3RuRpvmw3lL59s0NUei+7fjnfeVz/C1DDoIi8pXXOygpHXJF5f+fYhcIr+
	/NBZjsn8uqzB4PCdc8Jpl5bTXJCPtp8GS7KSL/GcyzM8K6IxuDKZamgaGacSqzZJzzbz
	9b0A==
X-Received: by 10.15.74.197 with SMTP id j45mr58580604eey.40.1381786471464;
	Mon, 14 Oct 2013 14:34:31 -0700 (PDT)
Received: from mizar.localdomain ([95.237.174.211])
	by mx.google.com with ESMTPSA id i1sm158092089eeg.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Oct 2013 14:34:30 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Oct 2013 23:34:28 +0200
Message-Id: <1381786468-9072-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] zaurus: use mkfs.jffs2 -n option only for NAND
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
X-List-Received-Date: Mon, 14 Oct 2013 21:34:30 -0000

And remove it for collie (NOR).

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/akita.conf  | 2 +-
 conf/machine/c7x0.conf   | 2 +-
 conf/machine/collie.conf | 4 ++--
 conf/machine/poodle.conf | 2 +-
 conf/machine/spitz.conf  | 4 ++--
 conf/machine/tosa.conf   | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/conf/machine/akita.conf b/conf/machine/akita.conf
index 12a2fe9..e6f020b 100644
--- a/conf/machine/akita.conf
+++ b/conf/machine/akita.conf
@@ -11,7 +11,7 @@ require conf/machine/include/tune-xscale.inc
 PACKAGE_EXTRA_ARCHS_tune-xscale += "iwmmxt" 
 MACHINE_FEATURES += "iwmmxt"
 
-EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x20000"
+EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x20000 -n"
 EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
 
 # UBI: max akita (128-7 MiB = 968 PEBs)
diff --git a/conf/machine/c7x0.conf b/conf/machine/c7x0.conf
index ffa998d..08a528e 100644
--- a/conf/machine/c7x0.conf
+++ b/conf/machine/c7x0.conf
@@ -11,7 +11,7 @@
 require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-xscale.inc
 
-EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x4000"
+EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x4000 -n"
 EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
 
 # UBI: max c7x0 (128-7 MiB = 7744 PEBs)
diff --git a/conf/machine/collie.conf b/conf/machine/collie.conf
index 26bc257..9f45f56 100644
--- a/conf/machine/collie.conf
+++ b/conf/machine/collie.conf
@@ -5,8 +5,8 @@
 require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-strongarm1100.inc
 
-EXTRA_IMAGECMD_jffs2 = "-p 14680064 -l -e 0x20000 -n"
-EXTRA_IMAGECMD_sum.jffs2 = "-p -l -e 0x20000 -n"
+EXTRA_IMAGECMD_jffs2 = "-p 14680064 -l -e 0x20000"
+EXTRA_IMAGECMD_sum.jffs2 = "-p -l -e 0x20000"
 
 # UBI: max collie (14.125 = 113 PEBs)
 # 14.125 x 1024 : 128 = 113 PEBs
diff --git a/conf/machine/poodle.conf b/conf/machine/poodle.conf
index 53dbc4a..ce3c8b3 100644
--- a/conf/machine/poodle.conf
+++ b/conf/machine/poodle.conf
@@ -8,7 +8,7 @@
 require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-xscale.inc
 
-EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x4000"
+EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x4000 -n"
 EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
 
 # UBI: max poodle (64-7 MiB = 3648 PEBs)
diff --git a/conf/machine/spitz.conf b/conf/machine/spitz.conf
index 6a74165..0ecce8b 100644
--- a/conf/machine/spitz.conf
+++ b/conf/machine/spitz.conf
@@ -12,7 +12,7 @@
 #
 # SL-C3000 (16-7 MiB = 576 PEBs)
 # 9 x 1024 : 16 = 576 PEBs
-# EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x4000"
+# EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x4000 -n"
 # MKUBIFS_ARGS = "-m 512 -e 15872 -c 576 -x zlib"
 # UBINIZE_ARGS = "-m 512 -p 16384 -s 256"
 
@@ -22,7 +22,7 @@ require conf/machine/include/tune-xscale.inc
 MACHINE_FEATURES += "iwmmxt"
 PACKAGE_EXTRA_ARCHS_tune-xscale += "iwmmxt"
 
-EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x20000"
+EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x20000 -n"
 EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
 
 # UBI: max spitz (128-7 MiB = 968 PEBs)
diff --git a/conf/machine/tosa.conf b/conf/machine/tosa.conf
index 0ec93c7..3c19225 100644
--- a/conf/machine/tosa.conf
+++ b/conf/machine/tosa.conf
@@ -8,7 +8,7 @@
 require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-xscale.inc
 
-EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x4000"
+EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x4000 -n"
 EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
 
 # UBI: max tosa (128-7 MiB = 7744 PEBs)
-- 
1.8.1.5


