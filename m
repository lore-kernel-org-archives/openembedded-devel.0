Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id BD8216E7BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 23:19:33 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id b57so7427327eek.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 15:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=PtoHhWEcHuixEuv7VVIYuXn6Bmn2+idEXm50Q/c7Mss=;
	b=xWeXSA2SsOhbW3hmA5QfKXlnnI/EBji5OMVu2O1IPBg9/Ab2TuUXnLY594T6MXAaK2
	JjUPpcyF84FhCuuPBnywJIxjKL8/jpFBNWtWMQJiiv8xBC+iHqyTPoSKmFILA82WV2rJ
	hKSc1986lOrCHQcqzVOmcgjJHgyEqXKsAsalqVNzOtVnQ9lXQCUyagHhT9l8gB+gKU50
	XH7kpjBIzuEU6O7SFxriD5k+Qu5bpShGJYsGRz81WiKZvFRiUAe5z11NESAuf8QG4+BI
	Wx6gEOxIDGEE6KrTxDWL4Uc+dycwVTwLC13u8XTY9rLo0Z80qYcTO4ohVFGn+DqRhaex
	w52w==
X-Received: by 10.14.107.9 with SMTP id n9mr30138858eeg.21.1392679174275;
	Mon, 17 Feb 2014 15:19:34 -0800 (PST)
Received: from mizar.localdomain
	(host53-14-dynamic.21-79-r.retail.telecomitalia.it. [79.21.14.53])
	by mx.google.com with ESMTPSA id v6sm62779696eef.2.2014.02.17.15.19.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Feb 2014 15:19:33 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Feb 2014 00:19:30 +0100
Message-Id: <1392679170-31419-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] zaurus: use the new JFFS2_SUM_EXTRA_ARGS for jffs2.sum
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
X-List-Received-Date: Mon, 17 Feb 2014 23:19:34 -0000

adapt after commit 295c6c1452c8789a8b1d0090ff09a5cd7cf16507 in oe-core

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/collie.conf        | 2 +-
 conf/machine/include/zaurus.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/collie.conf b/conf/machine/collie.conf
index c3223ec..30e3df2 100644
--- a/conf/machine/collie.conf
+++ b/conf/machine/collie.conf
@@ -9,7 +9,7 @@ JFFS2_ERASEBLOCK = "0x20000"
 # For NOR flash we need the cleanmarkers so override the defaults
 EXTRA_IMAGECMD_jffs2 = "--pad=14680064 -l -e ${JFFS2_ERASEBLOCK}"
 # sumtool does not accept the argument for --pad
-EXTRA_IMAGECMD_jffs2.sum = "-p -l -e ${JFFS2_ERASEBLOCK}"
+JFFS2_SUM_EXTRA_ARGS = "-p -l -e ${JFFS2_ERASEBLOCK}"
 
 # UBI: max collie (14.125 = 113 PEBs)
 # 14.125 x 1024 : 128 = 113 PEBs
diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index 10dad41..38464d6 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -3,7 +3,7 @@
 ########################
 
 IMAGE_FSTYPES ?= "tar.gz jffs2 jffs2.sum ubi ubifs"
-EXTRA_IMAGECMD_jffs2.sum = "-p -l -e ${JFFS2_ERASEBLOCK} -n"
+JFFS2_SUM_EXTRA_ARGS = "-p -l -e ${JFFS2_ERASEBLOCK} -n"
 
 INITRAMFS_FSTYPES ?= "cpio.gz cpio.lzma"
 IMAGE_DEVICE_TABLES = ""
-- 
1.8.1.5


