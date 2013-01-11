Received: from mail-wi0-f179.google.com ([209.85.212.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TticP-0003S3-Rt
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jan 2013 18:42:14 +0100
Received: by mail-wi0-f179.google.com with SMTP id o1so1177495wic.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2013 09:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=/cS0BjUkFgHCHrIQCqrVxQzkf643UFZnLxbbl6u4QiE=;
	b=zTo8+0nXjwQ3Pmz9nA2czdWdQbuiKnkxWIoXXQ+k024zQEP0ru91exH6SYKDr3mC6b
	Mqmn25Jkb0+a/RwgcDovBHgLhEUELQjBqjer4SDd3fsUUwIPp6qntoyhPK3pNHtZ0/Eg
	QjFhHTyQKKmX+CIe3rLa85ot0NiHjMHHJbk2btuXqlLuhRMwAlT1DSvPJnSCA/+087J9
	JJrRHfw2bZfYBBixmmVj8D5jShq+Q11tMEBoqJ8jb3AB5x77n9kPu8xP0aFajbPNvylg
	3Lj7Vn5lcv17uAF6NmygKW2kgOrMA4U04aME2yiMcD6ePh9g7GKeSI0CooEqK+OAmzjw
	eQnQ==
X-Received: by 10.194.236.166 with SMTP id uv6mr122174767wjc.34.1357925213108; 
	Fri, 11 Jan 2013 09:26:53 -0800 (PST)
Received: from mizar.localdomain
	(host253-249-dynamic.31-79-r.retail.telecomitalia.it.
	[79.31.249.253])
	by mx.google.com with ESMTPS id bz12sm8217212wib.5.2013.01.11.09.26.51
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 11 Jan 2013 09:26:51 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Jan 2013 18:26:40 +0100
Message-Id: <1357925200-12243-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1357856764-10950-1-git-send-email-andrea.adami@gmail.com>
References: <1357856764-10950-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-oe][meta-initramfs][PATCH v2] klibc_2.0.2: apply FIX_V4BX patch for armv4 targets only
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
X-List-Received-Date: Fri, 11 Jan 2013 17:42:16 -0000

 * linker fix is needed to avoid 'bx, lr' instruction on armv4
 * patch is applied only for armv4 for eabi builds
 * http://wiki.debian.org/ArmEabiPort#Choice_of_minimum_CPU

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../klibc/klibc-2.0.2/armv4-fix-v4bx.patch         |   15 +++++++++++++++
 meta-initramfs/recipes-devtools/klibc/klibc.inc    |   12 +++++++++---
 2 files changed, 24 insertions(+), 3 deletions(-)
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
index a95706e..fa31f73 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://usr/klibc/LICENSE;md5=d75181f10e998c21eb147f6d2e43ce8
 # debugsources.list: No such file or directory:
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 KLIBC_ARCH = '${TARGET_ARCH}'
 KLIBC_ARCH_armeb = 'arm'
@@ -21,11 +21,17 @@ KLIBC_ARCH_i586 = 'i386'
 KLIBC_ARCH_i686 = 'i386'
 KLIBC_ARCH_pentium = 'i386'
 
+export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
+
 SRCREV = "f05ff116bb9edbbb81d82fa47b78e630ce878470"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git;protocol=git"
 
-SRC_URI_append_linux-gnueabi = " file://klibc-config-eabi.patch"
-SRC_URI_append_linux-uclibceabi = " file://klibc-config-eabi.patch"
+SRC_URI_append_linux-gnueabi = " file://klibc-config-eabi.patch \
+                                 file://armv4-fix-v4bx.patch \
+                               "
+SRC_URI_append_linux-uclibceabi = " file://klibc-config-eabi.patch \
+                                    file://armv4-fix-v4bx.patch \
+                                  "
 
 SRC_URI += "file://klibc-linux-libc-dev.patch \
             file://prefix.patch \
-- 
1.7.8.6



