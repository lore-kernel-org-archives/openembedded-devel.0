Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1UOFVu-0004D8-NF
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 00:53:46 +0200
Received: by mail-ee0-f48.google.com with SMTP id b15so1592939eek.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2013 15:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=762ZxRsaBuPLRutJMKjgYfjsGHV1wzYTBRbx/fwk1OY=;
	b=NoflH+itK5e0ibSUPhA9KUPTl/ZaAmb3mpBenObJ5SxOm7SLOtypG0HHOclNf8uORF
	GT49q2zNv5S4xL/G8pzh5mcpoLznm+wt1PIqEu47qb9fhyuGdt2MULVibO462LkKVrdD
	hhSC8xc5sm2n6QnpFas2B11FUd+wJ1wwKxliC+vnwb3YSp/l5L7FQ1qm63ZoeWkfdKBb
	NCeR4BMmPn0gzLsnrpoERnW94j+SyQ0d7wT2wtXZ53YKJK5MjhCdrcrymTLpefmFFLzj
	JsZwRZRAHXY92L5kSxwHmNBluMNqJONkLgJL4HSjzZkVgE3iM4CKV7bxLRWYv7RdX3xP
	WF2w==
X-Received: by 10.15.34.199 with SMTP id e47mr13853517eev.35.1365201387900;
	Fri, 05 Apr 2013 15:36:27 -0700 (PDT)
Received: from mizar.localdomain
	(host43-27-dynamic.248-95-r.retail.telecomitalia.it. [95.248.27.43])
	by mx.google.com with ESMTPS id u44sm17899351eel.7.2013.04.05.15.36.26
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 15:36:27 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Apr 2013 00:36:22 +0200
Message-Id: <1365201382-13638-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.12.4
Subject: [meta-handheld][PATCH] linux-yocto-tiny-kexecboot_3.2: removed unused, non-working MTD-RW patch
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
X-List-Received-Date: Fri, 05 Apr 2013 22:53:49 -0000

* kexecboot doesn't need RW but just RO

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../collie/collie-mtd-rw.patch                               | 12 ------------
 recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bbappend |  1 -
 2 files changed, 13 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-mtd-rw.patch

diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-mtd-rw.patch b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-mtd-rw.patch
deleted file mode 100644
index 193004d..0000000
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-mtd-rw.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
-index fa9c0a9..bf6b04f 100644
---- a/drivers/mtd/maps/sa1100-flash.c
-+++ b/drivers/mtd/maps/sa1100-flash.c
-@@ -206,6 +206,7 @@ static int sa1100_probe_subdev(struct sa_subdev_info *subdev, struct resource *r
- 		goto err;
- 	}
- 	subdev->mtd->owner = THIS_MODULE;
-+	subdev->mtd->unlock(subdev->mtd, 0xc0000, subdev->mtd->size - 0xc0000);
- 
- 	printk(KERN_INFO "SA1100 flash: CFI device at 0x%08lx, %uMiB, %d-bit\n",
- 		phys, (unsigned)(subdev->mtd->size >> 20),
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bbappend b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bbappend
index 7f03732..b1d9c7f 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bbappend
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bbappend
@@ -43,7 +43,6 @@ SRC_URI_append_collie = " \
            file://qvga/logo_linux_clut224.ppm.bz2 \
            file://revert-check-on-console-device.patch \
            "
-#           file://collie-mtd-rw.patch
 
 SRC_URI_append_poodle = " \
            file://poodle-tiny.scc \
-- 
1.7.12.4



