Received: from mail-wg0-f52.google.com ([74.125.82.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1UBs1C-000633-G4
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Mar 2013 20:23:00 +0100
Received: by mail-wg0-f52.google.com with SMTP id 12so3229967wgh.31
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Mar 2013 11:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=iP9lhu9mRi8V4N7xQ/PydJHc0Ervg8eWsO821w8UUys=;
	b=Hc9BLRkNr46FBnFEtTe+D6lYN70G+tlBucOxpj8tJptJSsazwjwYzXbp45Sr2PWoQF
	1/hpYq/km1+ZfOuyzNN4WYzanhLGzbqhbZr8imXlrM5n3/h+bJtIzO5Jdketv9/Xhyjn
	xYuXgUpC+zAAZ9HV8GZWBca77L02bEve3EimcRiZnE+KujSQ/TCdRcVIrg9KrQCOlI8O
	NryO8KjLr7Smcb/Z2QIybt2AWg4U/QVDgIYb6X5GVANa0E9QzpU/eDByxNWxEmfJN2Yg
	99Lxad1NxkgUKYAp/hSDIlAxY/JK/tURbzJSwycFt4R/4Dx4Tnrk61E5FKnzVRqwRjX+
	lBdQ==
X-Received: by 10.194.103.72 with SMTP id fu8mr23879691wjb.42.1362251185362;
	Sat, 02 Mar 2013 11:06:25 -0800 (PST)
Received: from mizar.localdomain
	(host186-50-dynamic.5-87-r.retail.telecomitalia.it. [87.5.50.186])
	by mx.google.com with ESMTPS id j4sm4755195wiz.10.2013.03.02.11.06.22
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 02 Mar 2013 11:06:23 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Mar 2013 20:06:16 +0100
Message-Id: <1362251176-26068-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.12.4
Subject: [meta-handheld][PATCH] linux-yocto-tiny-kexecboot_3.2: set CONFIG_CRAMFS=y for Zaurus
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
X-List-Received-Date: Sat, 02 Mar 2013 19:23:07 -0000

* note: only collie is using cramfs as factory default

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-tiny-kexecboot-3.2/akita/akita-kexecboot.cfg      | 2 +-
 .../linux/linux-yocto-tiny-kexecboot-3.2/c7x0/c7x0-kexecboot.cfg        | 2 +-
 .../linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-kexecboot.cfg    | 2 +-
 .../linux/linux-yocto-tiny-kexecboot-3.2/poodle/poodle-kexecboot.cfg    | 2 +-
 .../linux/linux-yocto-tiny-kexecboot-3.2/spitz/spitz-kexecboot.cfg      | 2 +-
 .../linux/linux-yocto-tiny-kexecboot-3.2/tosa/tosa-kexecboot.cfg        | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/akita/akita-kexecboot.cfg b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/akita/akita-kexecboot.cfg
index 82bb479..84523d7 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/akita/akita-kexecboot.cfg
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/akita/akita-kexecboot.cfg
@@ -1417,7 +1417,7 @@ CONFIG_UBIFS_FS_LZO=y
 CONFIG_UBIFS_FS_ZLIB=y
 # CONFIG_UBIFS_FS_DEBUG is not set
 # CONFIG_LOGFS is not set
-# CONFIG_CRAMFS is not set
+CONFIG_CRAMFS=y
 # CONFIG_SQUASHFS is not set
 # CONFIG_VXFS_FS is not set
 # CONFIG_MINIX_FS is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/c7x0/c7x0-kexecboot.cfg b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/c7x0/c7x0-kexecboot.cfg
index 0ef169b..0265150 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/c7x0/c7x0-kexecboot.cfg
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/c7x0/c7x0-kexecboot.cfg
@@ -1411,7 +1411,7 @@ CONFIG_UBIFS_FS_LZO=y
 CONFIG_UBIFS_FS_ZLIB=y
 # CONFIG_UBIFS_FS_DEBUG is not set
 # CONFIG_LOGFS is not set
-# CONFIG_CRAMFS is not set
+CONFIG_CRAMFS=y
 # CONFIG_SQUASHFS is not set
 # CONFIG_VXFS_FS is not set
 # CONFIG_MINIX_FS is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-kexecboot.cfg b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-kexecboot.cfg
index e01ceae..ba5334d 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-kexecboot.cfg
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/collie/collie-kexecboot.cfg
@@ -1315,7 +1315,7 @@ CONFIG_UBIFS_FS_LZO=y
 CONFIG_UBIFS_FS_ZLIB=y
 # CONFIG_UBIFS_FS_DEBUG is not set
 # CONFIG_LOGFS is not set
-# CONFIG_CRAMFS is not set
+CONFIG_CRAMFS=y
 # CONFIG_SQUASHFS is not set
 # CONFIG_VXFS_FS is not set
 # CONFIG_MINIX_FS is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/poodle/poodle-kexecboot.cfg b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/poodle/poodle-kexecboot.cfg
index 04e53bd..5acf22c 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/poodle/poodle-kexecboot.cfg
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/poodle/poodle-kexecboot.cfg
@@ -1319,7 +1319,7 @@ CONFIG_UBIFS_FS_LZO=y
 CONFIG_UBIFS_FS_ZLIB=y
 # CONFIG_UBIFS_FS_DEBUG is not set
 # CONFIG_LOGFS is not set
-# CONFIG_CRAMFS is not set
+CONFIG_CRAMFS=y
 # CONFIG_SQUASHFS is not set
 # CONFIG_VXFS_FS is not set
 # CONFIG_MINIX_FS is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/spitz/spitz-kexecboot.cfg b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/spitz/spitz-kexecboot.cfg
index 338209d..2e864c0 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/spitz/spitz-kexecboot.cfg
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/spitz/spitz-kexecboot.cfg
@@ -1416,7 +1416,7 @@ CONFIG_UBIFS_FS_LZO=y
 CONFIG_UBIFS_FS_ZLIB=y
 # CONFIG_UBIFS_FS_DEBUG is not set
 # CONFIG_LOGFS is not set
-# CONFIG_CRAMFS is not set
+CONFIG_CRAMFS=y
 # CONFIG_SQUASHFS is not set
 # CONFIG_VXFS_FS is not set
 # CONFIG_MINIX_FS is not set
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/tosa/tosa-kexecboot.cfg b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/tosa/tosa-kexecboot.cfg
index 855d70b..e055f5b 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/tosa/tosa-kexecboot.cfg
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.2/tosa/tosa-kexecboot.cfg
@@ -1320,7 +1320,7 @@ CONFIG_UBIFS_FS_LZO=y
 CONFIG_UBIFS_FS_ZLIB=y
 # CONFIG_UBIFS_FS_DEBUG is not set
 # CONFIG_LOGFS is not set
-# CONFIG_CRAMFS is not set
+CONFIG_CRAMFS=y
 # CONFIG_SQUASHFS is not set
 # CONFIG_VXFS_FS is not set
 # CONFIG_MINIX_FS is not set
-- 
1.7.12.4



