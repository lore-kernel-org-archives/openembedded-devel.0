Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3AC7E608B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 22:29:31 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so89301697wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 15:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=z2Vow5ajmvo4faFGAZwDpZlYBP7fZniQ3lCkJBfIZ6Q=;
	b=Dszx4X6fSQvq4SCJ46efca3XADl9WWiJ8wtKaymVeYZSHG6V0+bYFBzqa7l/J/oOHm
	kBN2Kp0lR0AvR9ZBnX7NfO/V5Re94/Ir+qA0ViJCZX59u5s7eAZheVmWtYA03Rby7k9H
	hG/Bm0HnRK8XnjmHxJ1O0GqqfEXKrIqLvtQwHWFE9MqoS6msoHHT/qHSJWa0Wq1/b7yN
	TKRfTNpwD+eGRLpLJkG9zF79x7CcDSreXpCNs7BU7IVBluLBGCYVbTWlXJcHmTzXila/
	804p2kIlOZ5E+shhATTAKSrStfrmcJ9kBcbCG4klT9pYRoLjFbbJ91/KmgJ9PB9i2cjr
	Zx9g==
X-Received: by 10.194.174.201 with SMTP id bu9mr44655348wjc.73.1443047371691; 
	Wed, 23 Sep 2015 15:29:31 -0700 (PDT)
Received: from T520.homenet.telecomitalia.it
	(host227-255-dynamic.0-87-r.retail.telecomitalia.it. [87.0.255.227])
	by smtp.gmail.com with ESMTPSA id p20sm2495786wie.5.2015.09.23.15.29.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Sep 2015 15:29:31 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Sep 2015 00:29:28 +0200
Message-Id: <1443047368-11176-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH] kexecboot_0.6: fix build with gcc 5
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
X-List-Received-Date: Wed, 23 Sep 2015 22:29:34 -0000

Resolving the issue:

rgb.h:55:1: warning: inline function 'rgba2comp' declared but never defined
|  rgba2comp(kx_rgba rgba, kx_ccomp *red, kx_ccomp *green,
|  ^

Fix C99 inline semantic as documented here:
https://gcc.gnu.org/gcc-5/porting_to.html

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../files/0005-rgb.h-fix-build-with-gcc5.patch     | 34 ++++++++++++++++++++++
 .../recipes-bsp/kexecboot/kexecboot_0.6.bb         |  2 ++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-initramfs/recipes-bsp/kexecboot/files/0005-rgb.h-fix-build-with-gcc5.patch

diff --git a/meta-initramfs/recipes-bsp/kexecboot/files/0005-rgb.h-fix-build-with-gcc5.patch b/meta-initramfs/recipes-bsp/kexecboot/files/0005-rgb.h-fix-build-with-gcc5.patch
new file mode 100644
index 0000000..e451435
--- /dev/null
+++ b/meta-initramfs/recipes-bsp/kexecboot/files/0005-rgb.h-fix-build-with-gcc5.patch
@@ -0,0 +1,34 @@
+From b2c4fc69868a4831ec798ad98f5e7fce200cf0e3 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Thu, 24 Sep 2015 00:02:48 +0200
+Subject: [PATCH] rgb.h: fix build with gcc 5 (C99 inline semantic)
+
+Building with gcc 5.2 we trigger the following error:
+
+rgb.h:55:1: warning: inline function 'rgba2comp' declared but never defined
+|  rgba2comp(kx_rgba rgba, kx_ccomp *red, kx_ccomp *green,
+|  ^
+
+https://gcc.gnu.org/gcc-5/porting_to.html
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ rgb.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rgb.h b/rgb.h
+index 0ba987a..4f64622 100644
+--- a/rgb.h
++++ b/rgb.h
+@@ -51,7 +51,7 @@ typedef struct {
+ } kx_named_color;
+ 
+ /* Convert RGBA uint32 to red/green/blue/alpha components */
+-inline void
++extern inline void
+ rgba2comp(kx_rgba rgba, kx_ccomp *red, kx_ccomp *green,
+ 		kx_ccomp *blue, kx_ccomp *alpha);
+ 
+-- 
+1.9.1
+
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
index 9061c27..3397c29 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
@@ -47,6 +47,8 @@ SRC_URI += "\
             file://0002-kexecboot-fix-configure-warnings.patch \
             file://0003-kexecboot-do-not-hardcode-MOUNTPOINT.patch \
             file://0004-kexecboot.c-workaround-for-absolute-kernel-and-initr.patch \
+            \
+            file://0005-rgb.h-fix-build-with-gcc5.patch \
             "
 
 inherit autotools
-- 
1.9.1


