Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 00A546E71A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 22:14:00 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id f15so7448905eak.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 14:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=31s/me7JnXzDZ7Q1Cu+r5TuI/WPfm/+NBS/s7AvChBU=;
	b=q9xmwigc5ZEF27N8MdRn2OMLO4nD1b13PyVg+Ln/6D59vlb/KEXXLRghDgEQgbZW12
	Sf1CUJFps7MPtW9WdCIc5EXAxJjfYyJaSu7d58H7dwnH03XSeM/gFQJGZycKlPW2raP3
	HraXpGUVepuzGY000vrSgrhn707G7x0lM1vjZR/Xg7TdKo7yCMkV0qFsbQC8PkDxihpb
	a2ngGFRUCSlpjaVRcioOYyo4zYifPKVBfMUtnMHKeymGeV5krmlyYO7IRKNkM2Rdo327
	1lPkmRJa0KVldW2LLAsG/POJDLlLNpg2MXOt5ATvKRahlxkFtNhkXiDTrYQxWAIsjcwi
	AwMQ==
X-Received: by 10.14.225.67 with SMTP id y43mr29512909eep.10.1392675241286;
	Mon, 17 Feb 2014 14:14:01 -0800 (PST)
Received: from mizar.localdomain
	(host53-14-dynamic.21-79-r.retail.telecomitalia.it. [79.21.14.53])
	by mx.google.com with ESMTPSA id
	i43sm62408687eeu.13.2014.02.17.14.14.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Feb 2014 14:14:00 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Feb 2014 23:13:57 +0100
Message-Id: <1392675237-30454-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld] zaurus: catch up with sum.jffs2 -> jffs2.sum renaming
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
X-List-Received-Date: Mon, 17 Feb 2014 22:14:02 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 README.zaurus                   | 2 +-
 conf/machine/collie.conf        | 2 +-
 conf/machine/include/zaurus.inc | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/README.zaurus b/README.zaurus
index 25680b3..76c5c1b 100644
--- a/README.zaurus
+++ b/README.zaurus
@@ -68,7 +68,7 @@ Example: one image on mtd2 and another one on mtd3 (optional)
 
 2nd rootfs: JFFS2-summary image
  flash_eraseall -j /dev/mtd3
- nandwrite /dev/mtd3 /path/to/core-image-base-<machine>-<date>.rootfs.sum.jffs2
+ nandwrite /dev/mtd3 /path/to/core-image-base-<machine>-<date>.rootfs.jffs2.sum
 
 Note: flash_eraseall is deprecated because the erase-counters are reset!
 
diff --git a/conf/machine/collie.conf b/conf/machine/collie.conf
index cb5a928..c3223ec 100644
--- a/conf/machine/collie.conf
+++ b/conf/machine/collie.conf
@@ -9,7 +9,7 @@ JFFS2_ERASEBLOCK = "0x20000"
 # For NOR flash we need the cleanmarkers so override the defaults
 EXTRA_IMAGECMD_jffs2 = "--pad=14680064 -l -e ${JFFS2_ERASEBLOCK}"
 # sumtool does not accept the argument for --pad
-EXTRA_IMAGECMD_sum.jffs2 = "-p -l -e ${JFFS2_ERASEBLOCK}"
+EXTRA_IMAGECMD_jffs2.sum = "-p -l -e ${JFFS2_ERASEBLOCK}"
 
 # UBI: max collie (14.125 = 113 PEBs)
 # 14.125 x 1024 : 128 = 113 PEBs
diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index db6ce14..10dad41 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -2,8 +2,8 @@
 # Zaurus common settings
 ########################
 
-IMAGE_FSTYPES ?= "tar.gz jffs2 sum.jffs2 ubi ubifs"
-EXTRA_IMAGECMD_sum.jffs2 = "-p -l -e ${JFFS2_ERASEBLOCK} -n"
+IMAGE_FSTYPES ?= "tar.gz jffs2 jffs2.sum ubi ubifs"
+EXTRA_IMAGECMD_jffs2.sum = "-p -l -e ${JFFS2_ERASEBLOCK} -n"
 
 INITRAMFS_FSTYPES ?= "cpio.gz cpio.lzma"
 IMAGE_DEVICE_TABLES = ""
-- 
1.8.1.5


