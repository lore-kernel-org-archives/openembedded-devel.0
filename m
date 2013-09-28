Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id E26C16A441
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2013 23:15:49 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so1913116eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2013 16:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=eJ8XFIdG5/lX4vRHCinXa8MBWkz3NdeOFuL91Ndv8DM=;
	b=CMnSonDjLGrVeJLKLGwbqxf+MW86q6iWGFYfr0giC2ydHtS0Ff7fgQBrgncOus81RJ
	/vRAsfYDoeKNcFUA1AhmEQFZhnUjvIWrvoSc76pWsN0/QCs4QTsJYUEZs9tErwybwXd9
	DiH4e5eRFL4LAeunZBZvUOeCj1qyY1eONeKPCONDO9ZWgOd/71qfTAoTc8uz1Of5TIwi
	V25ddRE53Po1wTn4GsrVpqANjjWxNLubgV17lSOYXFl+DStZOPqhcAQ/FEOtYhJHm1bl
	39O24tVLyJAE0gSdIalEJopXHmv6fvPQM1GcMoHsTslmGIebZpOu/fLB+31wMzfmN23c
	U7lQ==
X-Received: by 10.14.225.199 with SMTP id z47mr23550019eep.24.1380410150866;
	Sat, 28 Sep 2013 16:15:50 -0700 (PDT)
Received: from mizar.localdomain
	(host172-229-dynamic.20-79-r.retail.telecomitalia.it.
	[79.20.229.172])
	by mx.google.com with ESMTPSA id j7sm32747921eeo.15.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 28 Sep 2013 16:15:50 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Sep 2013 01:15:39 +0200
Message-Id: <1380410139-10193-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs][PATCH] kexecboot: add BBCLASSEXTEND for the klibc static flavor
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
X-List-Received-Date: Sat, 28 Sep 2013 23:15:51 -0000

remove kexecboot-klibc recipe
bump PV to local 0.5.9.1
remove PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb | 12 ------------
 meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb       |  5 +++--
 2 files changed, 3 insertions(+), 14 deletions(-)
 delete mode 100644 meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
deleted file mode 100644
index 4144d85..0000000
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-PV = "0.5.9"
-PR = "r10+gitr${SRCREV}"
-
-SRC_URI = "git://github.com/kexecboot/kexecboot.git"
-SRCREV = "0bcc14671aa2d84ec20f260582aca36bb901ccf1"
-S = "${WORKDIR}/git"
-
-# the binary is statically linked against klibc
-inherit klibc
-
-require kexecboot.inc
-SUMMARY = "kexecboot linux-as-bootloader, statically compiled against klibc"
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
index dd630a9..1b08805 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
@@ -1,8 +1,9 @@
-PV = "0.5.9"
-PR = "r10+gitr${SRCREV}"
+PV = "0.5.9.1"
 
 SRC_URI = "git://github.com/kexecboot/kexecboot.git"
 SRCREV = "0bcc14671aa2d84ec20f260582aca36bb901ccf1"
 S = "${WORKDIR}/git"
 
 require kexecboot.inc
+
+BBCLASSEXTEND = "klibc"
-- 
1.8.1.5


