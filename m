Received: from mail-wg0-f53.google.com ([74.125.82.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TtQoQ-0004Vo-Ci
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 23:41:40 +0100
Received: by mail-wg0-f53.google.com with SMTP id fn15so533941wgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 14:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=+WRpyvqq6hL4YkPCjOMWj1sxQUuaphM5R41MoC6q2sU=;
	b=KIwYqpSQmBkqtSmA5ffB4dHZRk6HoOm6q7V045b5x3z8yXw0/Xai6xXNMZ+/0U0xpc
	0JJ/cGXBkogKPLP6IlDj+SK99xZHfOeRlc+JBM5DUaomipZwRdn/ojyIPH+2vdwuUDb3
	L6Ip28j5aEZ79DEFYESR+FN2XVt+OilBh7WN/YUT64c0saF5J3p+phUgFYJXhyPNP5KB
	QMO7YRDA8VvDL+LPtv5NeLR9p4cxDk3d3Smwb4Ru6IQc6bKqm9MexJ30CD4ct4eGaMq9
	2HxXFLLQsi1ak7aDIi6pNWQfNK5Ek2OY4Ty35NhKOzkf+pCSXnFLM2h/V9lH0ZZ+xnl1
	8+pg==
X-Received: by 10.180.73.80 with SMTP id j16mr11935635wiv.5.1357856772454;
	Thu, 10 Jan 2013 14:26:12 -0800 (PST)
Received: from mizar.localdomain
	(host188-49-dynamic.5-87-r.retail.telecomitalia.it. [87.5.49.188])
	by mx.google.com with ESMTPS id eo10sm4442674wib.9.2013.01.10.14.26.10
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 14:26:11 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jan 2013 23:26:04 +0100
Message-Id: <1357856764-10950-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][meta-initramfs][PATCH] klibc_2.0.2: apply FIX_V4BX patch for armv4 targets only
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
X-List-Received-Date: Thu, 10 Jan 2013 22:41:45 -0000

 * linker fix is needed to avoid 'bx, lr' instruction on armv4
 * patch is applied only for armv4 for eabi builds
 * http://wiki.debian.org/ArmEabiPort#Choice_of_minimum_CPU

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../klibc/klibc-2.0.2/armv4-fix-v4bx.patch         |   15 +++++++++++++++
 meta-initramfs/recipes-devtools/klibc/klibc.inc    |    8 ++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/armv4-fix-v4bx.patch

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/armv4-fix-v4bx.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/armv4-fix-v4bx.patch
new file mode 100644
index 0000000..6bb384b
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.2/armv4-fix-v4bx.patch
@@ -0,0 +1,15 @@
+Status: not applicable upstream, in OE/Yocto we use $(FIX_V4BX)
+which is "" in case of armv5 or thumbs.
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+--- a/usr/klibc/arch/arm/MCONFIG	2013-01-09 01:12:02.000000000 +0100
++++ b/usr/klibc/arch/arm/MCONFIG	2013-01-08 23:45:59.000000000 +0100
+@@ -29,6 +29,7 @@
+ KLIBCSHAREDFLAGS = -Ttext 0x01800200
+ ifeq ($(CONFIG_AEABI),y)
+ KLIBCREQFLAGS += -mabi=aapcs-linux -mno-thumb-interwork
++KLIBCLDFLAGS += $(FIX_ARMV4_EABI_BX)
+ else
+ KLIBCREQFLAGS += -mabi=apcs-gnu -mno-thumb-interwork
+ endif
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index a95706e..39feff9 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://usr/klibc/LICENSE;md5=d75181f10e998c21eb147f6d2e43ce8
 # debugsources.list: No such file or directory:
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 KLIBC_ARCH = '${TARGET_ARCH}'
 KLIBC_ARCH_armeb = 'arm'
@@ -21,10 +21,14 @@ KLIBC_ARCH_i586 = 'i386'
 KLIBC_ARCH_i686 = 'i386'
 KLIBC_ARCH_pentium = 'i386'
 
+export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
+
 SRCREV = "f05ff116bb9edbbb81d82fa47b78e630ce878470"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git;protocol=git"
 
-SRC_URI_append_linux-gnueabi = " file://klibc-config-eabi.patch"
+SRC_URI_append_linux-gnueabi = " file://klibc-config-eabi.patch \
+                                 file://armv4-fix-v4bx.patch \
+                                "
 SRC_URI_append_linux-uclibceabi = " file://klibc-config-eabi.patch"
 
 SRC_URI += "file://klibc-linux-libc-dev.patch \
-- 
1.7.8.6



