Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 034686D130
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 16:21:18 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so3535422eek.33
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 09:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=CodIHtR1FdyAYTYKDILFE9zHaCoKGUxLRblETCCayfk=;
	b=fw4ae9vc4wmxY31fgrbK4Kn2GeYh+lrbFPdm8sCRVZwmmNYxMhOHkoW2wJdURDhxIf
	9HCEjnMPFSC1SwUyGWxoQXI7flPTpO0VLqIqpYKZZ3lyIsVrG0tHOBieK4rGHYun+j9h
	ucdyuicSq6DCb8TJh9gL0XA/tTw+7PWD2KGzsAIiLOELlayjgo1ToiIgdQaCr2oOse76
	QDGoDQAEyhQp5/UHWOksVamYewJcQ/fqCaAIeG/8F6c0VDifHMiFjwMzQXjh9Y3bcD4y
	FMrVb4Fgq4w4vt3CrZZH/iuCBhy7U+wpca+fkW29rB9X4s8YlltvKP1EOcXHjeXklxAR
	+62w==
X-Received: by 10.15.32.7 with SMTP id z7mr1737676eeu.78.1381767680616;
	Mon, 14 Oct 2013 09:21:20 -0700 (PDT)
Received: from mizar.localdomain ([95.237.174.211])
	by mx.google.com with ESMTPSA id d8sm155236487eeh.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Oct 2013 09:21:20 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Oct 2013 18:21:17 +0200
Message-Id: <1381767677-12914-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] zaurus.inc: remove code for JFFS2 now split in machine configuration
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
X-List-Received-Date: Mon, 14 Oct 2013 16:21:20 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus.inc | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index 2f5d2e7..480c855 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -6,13 +6,6 @@ IMAGE_FSTYPES ?= "tar.gz jffs2 sum.jffs2 ubifs"
 INITRAMFS_FSTYPES ?= "cpio.gz cpio.lzma"
 IMAGE_DEVICE_TABLES = ""
 
-# kernel now supports favourlzo
-EXTRA_IMAGECMD_jffs2 = "-p -l --eraseblock=${ERASEBLOCKSIZE}"
-EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
-
-EXTRA_IMAGECMD_jffs2_collie = "--pad=14680064 --little-endian --eraseblock=0x20000 -n"
-EXTRA_IMAGECMD_sum.jffs2_collie = "--pad -l --eraseblock=0x20000 -n"
-
 #########
 # xserver
 #########
-- 
1.8.1.5


