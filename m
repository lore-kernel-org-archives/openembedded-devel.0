Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 57C9C6D009
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 20:59:07 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so3671509ead.33
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 13:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ifOYe+Q+TTL60MBcyeu63TvfDe6hvHiMmdukhH0W5pE=;
	b=Y73NuYhI4TvCGgL341184KeZ/gJy4wUvvaSUbZ30OZolD0icrbEtk/IC5NrrokURkg
	Zn8iyjten1pVXVZLETDjnanwTHWRNE3KFmfZsLlnvnvCPKq3AcehmHPYnKos+ASPOS8N
	6qCLms6N4IZDcgOo1enPTLkluGxh++bi6+BedRZCCYNCqkOjhFCqYOTijBpFdZpaAfpv
	PZ2LXkVro5MvxYBxaERJYl8EO6hAsUCQ801XgPpE/ksonTnMVLAvuOiRb+B/DOe/fm15
	DvY9NdgjGblrRFplJTxi9ueMFv2VFa0UVzMn7FSAY1M2wISh1b0lMEsT8aUUBD0lNJuO
	5EWA==
X-Received: by 10.14.45.70 with SMTP id o46mr59255825eeb.19.1381784348315;
	Mon, 14 Oct 2013 13:59:08 -0700 (PDT)
Received: from mizar.localdomain ([95.237.174.211])
	by mx.google.com with ESMTPSA id
	h52sm157785313eez.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Oct 2013 13:59:07 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Oct 2013 22:59:04 +0200
Message-Id: <1381784344-2812-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] spitz.conf: reorder and add full example for SL-C3000
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
X-List-Received-Date: Mon, 14 Oct 2013 20:59:08 -0000

This device has different eraseblock size.
Explain it clearly with example ready to un-comment.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/spitz.conf | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/conf/machine/spitz.conf b/conf/machine/spitz.conf
index d4243fa..6a74165 100644
--- a/conf/machine/spitz.conf
+++ b/conf/machine/spitz.conf
@@ -7,21 +7,21 @@
 # SL-C3100 (borzoi) mtdparts=sharpsl-nand:7168k@0k(smf),32768k@7168k(root),-(home)
 # SL-C3200 (terrier) mtdparts=sharpsl-nand:7168k@0k(smf),44032k@7168k(root),-(home)
 
-require conf/machine/include/zaurus.inc
-require conf/machine/include/tune-xscale.inc
-
-MACHINE_FEATURES += "iwmmxt"
-PACKAGE_EXTRA_ARCHS_tune-xscale += "iwmmxt"
-
-# Warning! SL-C3000 has "0x4000" (16MiB NAND) 
+# Warning! SL-C3000 has "0x4000" eraseblock size (16MiB NAND) 
 # C3100 and C3200 have same 128MiB NAND device as akita
 #
 # SL-C3000 (16-7 MiB = 576 PEBs)
 # 9 x 1024 : 16 = 576 PEBs
-# ERASEBLOCKSIZE = "0x4000"
+# EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x4000"
 # MKUBIFS_ARGS = "-m 512 -e 15872 -c 576 -x zlib"
 # UBINIZE_ARGS = "-m 512 -p 16384 -s 256"
 
+require conf/machine/include/zaurus.inc
+require conf/machine/include/tune-xscale.inc
+
+MACHINE_FEATURES += "iwmmxt"
+PACKAGE_EXTRA_ARCHS_tune-xscale += "iwmmxt"
+
 EXTRA_IMAGECMD_jffs2 = "-p -l -e 0x20000"
 EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
 
-- 
1.8.1.5


