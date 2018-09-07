Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C2303797AC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 10:45:41 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r1-v6so16609616wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2018 03:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=rw24Yyv3ky7pLKklQzx57ZajHEYL1AnfbUYxNdCR2q4=;
	b=nuql/irmkOKYrTA6Nozf3jPlNc/hOR9eBTOBuCVvuDwBX3UA7GN6MC4tKaYgFD11Xb
	jyERinESWYxoM462T+HAJeo5aARvfh3HI7JG4SsS1OWYpEL1ELSgLewLAJ+abkfCCdJe
	VNXMBdN90G4WkQMYNOsSeIppeGCZLidKlllUcUFkxgCUsJmT4Qk9TjneCLdHRz6i/egX
	Vguo2aLaXra17YhxYmqRKX/EQWSvzJoZwhwVC24PZBln0oWiVJwEe4QePjeHtSE3obKl
	gzy7MnncHvNqEKKM8I/3toBx2Fl2n++4ekqX9htmFzaW/FiMqot2I9B1ghqsu+vfVlbu
	4nZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rw24Yyv3ky7pLKklQzx57ZajHEYL1AnfbUYxNdCR2q4=;
	b=T/88K0K/l0lYEbPj0EP2hWtAe3Sul6E/qHFTLWzejvCDTczofIdXKYH3Tu121SBKb+
	H4QnlEeOQSsEr3gFV8xYJ6aP9pUtUZ23JiOqHoEJzvPkUTSsz0jelKTUgxxUmgyJbtAW
	aEqN8RMlpTCug3WQ5sVysxdA9QHKZim988S9aShbTLbKbc5ijKupF5TEAPjOpSlIECKg
	asEb7zUqywUJ9Bap8ohIPe2BM6Y7ruO3fIYQjAgzIsI/VJ/NqaQOdJbv/Ehv9XgwocFQ
	C0kP3c2bbHl7yAhIrfgS1ZjMEMFi03NP+BanzY4GMwpGEwUmf5qzFrxh9AQTYJcvH17k
	6Rqw==
X-Gm-Message-State: APzg51D4jk8H8Z5XHwiLmZ5lsGoW7Y0JgplpFn37t2PWVQ6lvWJvLCM9
	85sXyEKIw+vQJkNvlalLQtGJEKfl
X-Google-Smtp-Source: ANB0VdYksjkIF92/gcaB+jZzOJZhfViNkDCeJ6+SwpRvJ11OOLKT3A8qmPmYyZ+xMqRnxwywu/mGvw==
X-Received: by 2002:a1c:d0c8:: with SMTP id
	h191-v6mr4672819wmg.155.1536317141981; 
	Fri, 07 Sep 2018 03:45:41 -0700 (PDT)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host63-251-dynamic.54-79-r.retail.telecomitalia.it. [79.54.251.63])
	by smtp.gmail.com with ESMTPSA id
	r66-v6sm13431125wmb.37.2018.09.07.03.45.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Sep 2018 03:45:41 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Sep 2018 12:45:34 +0200
Message-Id: <1536317134-10940-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] kexecboot: upgrade to rev. 4c01d6960aa6
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
X-List-Received-Date: Fri, 07 Sep 2018 10:45:42 -0000

Remove upstreamed patches, get new options for kexec.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 ...-Add-top_srcdir-to-compiler-include-paths.patch | 27 ---------------
 .../files/0002-include-sys-sysmacros.h.patch       | 30 ----------------
 .../recipes-bsp/kexecboot/kexecboot_git.bb         | 40 ++--------------------
 3 files changed, 2 insertions(+), 95 deletions(-)
 delete mode 100644 meta-initramfs/recipes-bsp/kexecboot/files/0001-Add-top_srcdir-to-compiler-include-paths.patch
 delete mode 100644 meta-initramfs/recipes-bsp/kexecboot/files/0002-include-sys-sysmacros.h.patch

diff --git a/meta-initramfs/recipes-bsp/kexecboot/files/0001-Add-top_srcdir-to-compiler-include-paths.patch b/meta-initramfs/recipes-bsp/kexecboot/files/0001-Add-top_srcdir-to-compiler-include-paths.patch
deleted file mode 100644
index 0565133..0000000
--- a/meta-initramfs/recipes-bsp/kexecboot/files/0001-Add-top_srcdir-to-compiler-include-paths.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From d302547305727797e0172ba89e7519252c400021 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 11 Aug 2018 14:37:22 -0700
-Subject: [PATCH 1/2] Add top_srcdir to compiler include paths
-
-Helps in compiling with out of tree build dir
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/Makefile.am | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index d04a3a8..6449c5a 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -1,5 +1,7 @@
- bin_PROGRAMS=kexecboot
- 
-+kexecboot_CFLAGS = -I$(top_srcdir)
-+
- kexecboot_SOURCES = \
- 	util.c \
- 	cfgparser.c \
--- 
-2.18.0
-
diff --git a/meta-initramfs/recipes-bsp/kexecboot/files/0002-include-sys-sysmacros.h.patch b/meta-initramfs/recipes-bsp/kexecboot/files/0002-include-sys-sysmacros.h.patch
deleted file mode 100644
index f12ae99..0000000
--- a/meta-initramfs/recipes-bsp/kexecboot/files/0002-include-sys-sysmacros.h.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c587012cbe448c9295f50497812ca3530cabbb51 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 11 Aug 2018 14:39:01 -0700
-Subject: [PATCH 2/2] include sys/sysmacros.h
-
-glibc 2.28+ does not include this header implicitly via other system
-headers anymore
-
-src/devicescan.c:373: undefined reference to `makedev'
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/devicescan.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/devicescan.c b/src/devicescan.c
-index 4f2f497..0b2b253 100644
---- a/src/devicescan.c
-+++ b/src/devicescan.c
-@@ -20,6 +20,7 @@
- #include <stdlib.h>
- #include <string.h>
- #include <sys/types.h>
-+#include <sys/sysmacros.h>
- #include <sys/stat.h>
- #include <fcntl.h>
- #include <unistd.h>
--- 
-2.18.0
-
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
index 8799a3e..6d79e8f 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
@@ -1,36 +1,3 @@
-###########################
-# Configure options:
-#
-#  --enable-static-linking compile kexecboot as static executable [default=no]
-#  --enable-fbui           support framebuffer menu [default=yes]
-#  --enable-fbui-width     limit FB UI width to specified value [default=no]
-#  --enable-fbui-height    limit FB UI height to specified value [default=no]
-#  --enable-textui         support console text user interface [default=no]
-#  --enable-cfgfiles       support config files [default=yes]
-#  --enable-icons          support custom icons (depends on fbui) [default=yes]
-#  --enable-zaurus         compile Sharp Zaurus specific code [default=no]
-#  --enable-zimage         compile with zImage support [default=yes]
-#  --enable-uimage         compile with uImage support [default=no]
-#  --enable-machine-kernel look for machine-specific zImage kernel [default=no]
-#  --enable-devices-recreating
-#                          enable devices re-creating [default=yes]
-#  --enable-debug          enable debug output [default=no]
-#  --enable-host-debug     allow for non-destructive executing of kexecboot on
-#                            host system [default=no]
-#  --enable-numkeys        enable menu item selection by keys [0-9] [default=yes]
-#  --enable-bg-buffer      enable buffer for pre-drawed FB GUI background
-#
-#  --enable-timeout        allow to boot 1st kernel after timeout in seconds
-#                            [default=no]
-#  --enable-delay          specify delay before device scanning, allowing
-#                            initialization of old CF/SD cards [default=1]
-#  --enable-bpp            enable support of specified bpp modes
-#                            (all,32,24,18,16,4,2,1) [default=all]
-#  --enable-evdev-rate     change evdev (keyboard/mouse) repeat rate
-#                            in milliseconds e.g. "1000,250" [default=no]
-#  --with-kexec-binary     look for kexec binary at path
-#                            [default="/usr/sbin/kexec"]
-##########################
 SUMMARY = "kexecboot linux-as-bootloader"
 DESCRIPTION = "kexecboot is a graphical linux-as-bootloader implementation based on kexec."
 HOMEPAGE = "http://kexecboot.org"
@@ -38,11 +5,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 PV = "0.6+git${SRCPV}"
 S = "${WORKDIR}/git"
-SRC_URI = "git://github.com/kexecboot/kexecboot.git \
-           file://0001-Add-top_srcdir-to-compiler-include-paths.patch \
-           file://0002-include-sys-sysmacros.h.patch \
-           "
-SRCREV = "d5ffd81bf6a1a2087cdc6c606cae98099229131c"
+SRC_URI = "git://github.com/kexecboot/kexecboot.git"
+SRCREV = "4c01d6960aa6a9d03675605062469ab777fa2b01"
 inherit autotools
 
 EXTRA_OECONF = "--enable-textui --enable-delay=2 --enable-evdev-rate=1000,250"
-- 
2.7.4


