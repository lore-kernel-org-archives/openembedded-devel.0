Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id CFE176AB50
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 22:03:14 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id cc10so4132982wib.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 15:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=q3L0WtdU6sQ72ano8OekVdFUfyIZitAwHS9F1YdxdVU=;
	b=DZF2r6JO589LxkimdvIDIyjAJboH89mtz+/DjEnJ+FkSZArw6UUJSDRQTvhE0pwc67
	jZPW5g0sutTJk0nEeS7NdcD+ZGzPVAHUqO+GbaljfD09ADuaIDSsvsfK8AmKh4Oji8tk
	A9wqCu7FR9qQffnyub1SqEro5QHMnc5BF/BRu7TBZ5xOBUy+L3nZmslWgOrwCcJhVJnB
	KB5mI4AldSUH6rECLH8D0iA0MkG/Ed4Mx+2BR2e4pB02njbDNCaCkm3shbteANdZpYYf
	cd07G9NQIpREMPuKREbsnNpx+FGc3qQoDT3Cf+NmAx9r5pfHQOOX83kSc4vHV0VjWY8O
	NVbw==
X-Received: by 10.194.82.69 with SMTP id g5mr6910102wjy.85.1396303394918;
	Mon, 31 Mar 2014 15:03:14 -0700 (PDT)
Received: from mizar.localdomain
	(host89-230-dynamic.20-79-r.retail.telecomitalia.it. [79.20.230.89])
	by mx.google.com with ESMTPSA id o4sm35960069eef.20.2014.03.31.15.03.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Mar 2014 15:03:14 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 00:03:10 +0200
Message-Id: <1396303390-17134-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs][PATCH] linux-yocto-tiny-kexecboot: remove ${PR} remnant
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
X-List-Received-Date: Mon, 31 Mar 2014 22:03:15 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb
index 20a9791..8c7f717 100644
--- a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb
+++ b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb
@@ -4,7 +4,7 @@ SUMMARY = "Yocto tiny kernel embedding a minimalistic kexecboot initramfs"
 PACKAGES = ""
 PROVIDES = ""
 
-KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${PV}-${PR}-${MACHINE}"
+KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${PV}-${MACHINE}"
 KERNEL_IMAGE_SYMLINK_NAME = "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${MACHINE}"
 
 INITRAMFS_IMAGE = "initramfs-kexecboot-klibc-image"
-- 
1.8.1.5


