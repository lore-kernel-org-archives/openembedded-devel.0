Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 591DA7458B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:17:52 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id r5-v6so7209816pgv.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 01:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UMt37Gi+IHKRveLweamzPgn67PF0X55stNv7csuYYGs=;
	b=H51/+jzds9OTGKLnDPVUZp7PTrdIY3be0Ek2Zl6GfOKZv7WaNCJu48FvRoTRnAYPmk
	zfiwMDu+uI7yV1AD4/VcdtASRJKvML6oIxBzbpEb3E93KPJbVd8TfxrSZi1IjVlP1XAZ
	qgIsCPXOifmf0OnK3un9GPhcJOeXnxKhCQYCPEXZGbbaub74ZaQIDqi2i7218lbD7KrG
	KvpFKQxcGJL9SpZfZF0ke2zi5Zsw6FXDtmGGwlFM3Wjep8tktY64MwPN74HDIhoJbtOF
	3Q5nqNHazpmPpZPX1tce2wYpV1J87q24wYL/yNTxV+JZJsZvPZBq3gNfNWp+BJ9LNu1S
	8kyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UMt37Gi+IHKRveLweamzPgn67PF0X55stNv7csuYYGs=;
	b=QZZREKVDiWsOAYNPv0WMHR8usdXJGhAtg7TKzip36ISfeL/4OrIqW/EL1yR2c7sXwY
	h1NziSvm3JOFHaawxCwmI3T0lTHd53z5GduNiyR/ibsZxC4zJYVQLEvYB9Ci0DqNBJEV
	Niuorll2yBe740sgz4IvBwAxxbQ8d/1zWgUoP0l37IzOUfIZIBAhaLaqADQp9PmSOgsJ
	W4KetnvkUMEXfyNQX+/I2zmFmNSUNjBUAM9LWESXecOt/a/G8OVWuT4cRbYgZLIQiUlF
	OTUS1ZKTg9uA6BmzwVUCmlp7GxMRAKNIfBk+ICM1r124MoqqZ20wDF+YtOdHBR/GFSB7
	WnBg==
X-Gm-Message-State: AOUpUlFSJqV+shWtLs9FbTmXNSxn/3IU1JRhprFPEoo1ne1RaJK6JXdW
	rmJe9oJ2fkt4aSZM7kGTSlZtgsQ8
X-Google-Smtp-Source: AA+uWPxr7fC6VRTBSoBMUA057sD8RWrbIuE/kQ46CPh2XFBuYGZ13DtI8Xk/65ylXP9CwEIT1gABuA==
X-Received: by 2002:a63:6345:: with SMTP id
	x66-v6mr16260135pgb.43.1534148273043; 
	Mon, 13 Aug 2018 01:17:53 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	b64-v6sm23414971pfg.66.2018.08.13.01.17.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 01:17:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 01:17:23 -0700
Message-Id: <20180813081742.6961-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813081742.6961-1-raj.khem@gmail.com>
References: <20180813081742.6961-1-raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH 02/21] kexecboot: Fix build with glibc 2.28+
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Aug 2018 08:17:52 -0000

Update to latest srcrev at the same time.
Fix out of tree builds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...top_srcdir-to-compiler-include-paths.patch | 27 +++++++++++++++++
 .../files/0002-include-sys-sysmacros.h.patch  | 30 +++++++++++++++++++
 .../recipes-bsp/kexecboot/kexecboot_git.bb    | 10 ++++---
 3 files changed, 63 insertions(+), 4 deletions(-)
 create mode 100644 meta-initramfs/recipes-bsp/kexecboot/files/0001-Add-top_srcdir-to-compiler-include-paths.patch
 create mode 100644 meta-initramfs/recipes-bsp/kexecboot/files/0002-include-sys-sysmacros.h.patch

diff --git a/meta-initramfs/recipes-bsp/kexecboot/files/0001-Add-top_srcdir-to-compiler-include-paths.patch b/meta-initramfs/recipes-bsp/kexecboot/files/0001-Add-top_srcdir-to-compiler-include-paths.patch
new file mode 100644
index 0000000000..0565133d95
--- /dev/null
+++ b/meta-initramfs/recipes-bsp/kexecboot/files/0001-Add-top_srcdir-to-compiler-include-paths.patch
@@ -0,0 +1,27 @@
+From d302547305727797e0172ba89e7519252c400021 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 11 Aug 2018 14:37:22 -0700
+Subject: [PATCH 1/2] Add top_srcdir to compiler include paths
+
+Helps in compiling with out of tree build dir
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/Makefile.am | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index d04a3a8..6449c5a 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -1,5 +1,7 @@
+ bin_PROGRAMS=kexecboot
+ 
++kexecboot_CFLAGS = -I$(top_srcdir)
++
+ kexecboot_SOURCES = \
+ 	util.c \
+ 	cfgparser.c \
+-- 
+2.18.0
+
diff --git a/meta-initramfs/recipes-bsp/kexecboot/files/0002-include-sys-sysmacros.h.patch b/meta-initramfs/recipes-bsp/kexecboot/files/0002-include-sys-sysmacros.h.patch
new file mode 100644
index 0000000000..f12ae99e72
--- /dev/null
+++ b/meta-initramfs/recipes-bsp/kexecboot/files/0002-include-sys-sysmacros.h.patch
@@ -0,0 +1,30 @@
+From c587012cbe448c9295f50497812ca3530cabbb51 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 11 Aug 2018 14:39:01 -0700
+Subject: [PATCH 2/2] include sys/sysmacros.h
+
+glibc 2.28+ does not include this header implicitly via other system
+headers anymore
+
+src/devicescan.c:373: undefined reference to `makedev'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/devicescan.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/devicescan.c b/src/devicescan.c
+index 4f2f497..0b2b253 100644
+--- a/src/devicescan.c
++++ b/src/devicescan.c
+@@ -20,6 +20,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <sys/types.h>
++#include <sys/sysmacros.h>
+ #include <sys/stat.h>
+ #include <fcntl.h>
+ #include <unistd.h>
+-- 
+2.18.0
+
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
index 9f5dad7c64..8799a3e4cc 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
@@ -38,15 +38,17 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 PV = "0.6+git${SRCPV}"
 S = "${WORKDIR}/git"
-SRC_URI = "git://github.com/kexecboot/kexecboot.git"
-SRCREV = "4c4f127e79ac5b8d6b6e2fbb938ccbf12b04c531"
+SRC_URI = "git://github.com/kexecboot/kexecboot.git \
+           file://0001-Add-top_srcdir-to-compiler-include-paths.patch \
+           file://0002-include-sys-sysmacros.h.patch \
+           "
+SRCREV = "d5ffd81bf6a1a2087cdc6c606cae98099229131c"
 inherit autotools
 
 EXTRA_OECONF = "--enable-textui --enable-delay=2 --enable-evdev-rate=1000,250"
 
 do_install () {
-    install -d ${D}${bindir}
-    install -m 0755 kexecboot ${D}${bindir}
+    install -D -m 0755 ${B}/src/kexecboot ${D}${bindir}/kexecboot
     install -d ${D}/proc
     install -d ${D}/mnt
     install -d ${D}/dev
-- 
2.18.0


