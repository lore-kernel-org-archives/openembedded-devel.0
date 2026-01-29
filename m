Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8A8D61003
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 11:17:16 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12774.1769685430830442730
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jan 2026 03:17:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nhu8Ghg7;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42fed090e5fso746704f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 03:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769685429; x=1770290229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hq123HJ1vRExFDsConloCuXV3IoDykGA0kGKUiGL22o=;
        b=Nhu8Ghg7Q6mCaFpA4kp5hYbR/y3sNeN7Oebs7qnmxxY1puTpCA3Hm80TWVUYTEln40
         rKhrP6UhdDHVztR7Lo3uDiiHpEeS96Jsem8JUG70aTV9N9QWSldO6AsLHoGM63OHetJn
         ItOqGpU/F3sAa4Sa5BOJVWcEHaBt1MkTCTOtX+HoT2LCwHkRJ272p5lWmfahUXfEvEK4
         1MzbbYKu6bgeOIfiaGZa1nj4l0sFVjjD92WJtF76m8IKtLFaS/YaHRg3Y86+7/SFAtyB
         8FFAZdjYgcE9CQvjQH/LOs1yrrG6SD9wO9g0HCEHzy48YBiD9lbb1WDeHmMvRWPPqTTO
         hy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769685429; x=1770290229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hq123HJ1vRExFDsConloCuXV3IoDykGA0kGKUiGL22o=;
        b=ANhUGNkj8Bm2q7VSiJBA0C70/SYPjKNNU7q+AJzEmywDILfE2IUtquk8ieSmSpf7Vw
         Ba7ZpNo24En/GKWkZ2awPdqJW7yZeeq+5T5c4w4LcJLrLWuzA/KCPWnKuMEklEgu8x8o
         WgkjgmXFnF0640Uh1bMxu6WXLVu5vJxKRTrSjG571NaLdlmhR52gobLAmKhKiHfHXKUw
         xY18E/uMqdfBycXfgSggD3gORaM7Yizxl8ALD+ASsVzfl32zPXBbCcrro12hr8zVkpvX
         9pXZ0Vec7UYA5xqQ1QC88b80kp5hWRN6WsrgjVcmzNfB9JjMJyypxI3wmUTvjGdUGdCf
         1ZFw==
X-Gm-Message-State: AOJu0YywQVCiwWqi3di6Q04bdMzix6c8ffXIQUpo2q+5TFmPW9fyXKJY
	JjyGZFEfO8+lfgTjtyOD3TM4UDmm97AL/fPxKIY525sAdy7e6Ac/uus0EINepA==
X-Gm-Gg: AZuq6aKU958F5gWdZfRZHF7JfMj478zAhHMr3O2RBpY74bpdUANWqtAYJx2Dpy0nwh2
	VsInBVlk1hPE99tgJ+MfU/TmiH+v/euuzVGv9b8KxyHbC15cyKXNreB6JU7N+FGZLd5QPdY+Wk4
	roraU39ULDlj8bE0c2d9/enPfxgw4rvSpX6BUFI9ywgrrQgOrwdJ3/g00kxeW+/JdTtAMt2n5Dy
	Qbn0/ZLzyj7R1clE4r1VsDmuBLA+Bz3Sk7ACN0OGAnVZM1otZbmneupova5Qx07yF4K73Sd8/Ac
	xYEM7u/7JA3ojWabfRSJLDOhbIj0Ha5wggtxc0fJbWm+R8dBOrIyPDDJK1u0QGovJ+W3JYyNG9v
	rfWqiKUsN4ZrRjuzv2mpLSY/0c+uI+iauM9j2sj/841/GxQJ5/IIzDqrmPPUyNRpymqwk+aBYfs
	rWSyXYIKdq
X-Received: by 2002:a5d:588d:0:b0:435:8f88:7235 with SMTP id ffacd0b85a97d-435dd0a389emr12687323f8f.33.1769685429027;
        Thu, 29 Jan 2026 03:17:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4824sm14718443f8f.1.2026.01.29.03.17.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 03:17:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/6] dediprog-flasher: upgrade 1.14.20 -> 1.14.21
Date: Thu, 29 Jan 2026 12:17:03 +0100
Message-ID: <20260129111706.903623-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129111706.903623-1-skandigraun@gmail.com>
References: <20260129111706.903623-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 11:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123990

Drop the patches that are included in this release.

Changelog: https://github.com/DediProgSW/SF100Linux/compare/V1.14.20.x...V1.14.21,x

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...01-add-support-for-cross-compilation.patch | 21 ----------
 ...2-Makefile-add-conditional-stripping.patch | 39 -------------------
 ...1.14.20.bb => dediprog-flasher_1.14.21.bb} |  9 +----
 3 files changed, 2 insertions(+), 67 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0001-add-support-for-cross-compilation.patch
 delete mode 100644 meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0002-Makefile-add-conditional-stripping.patch
 rename meta-oe/recipes-bsp/dediprog-flasher/{dediprog-flasher_1.14.20.bb => dediprog-flasher_1.14.21.bb} (78%)

diff --git a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0001-add-support-for-cross-compilation.patch b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0001-add-support-for-cross-compilation.patch
deleted file mode 100644
index fbc0f5a18e..0000000000
--- a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0001-add-support-for-cross-compilation.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Author: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
-Date:   Fri Jul 5 16:39:13 2024 +0200
-Upstream-Status: Submitted [https://github.com/DediProgSW/SF100Linux/pull/86]
-
-    Makefile: allow overriding CC
-    
-    Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
-
-diff --git a/Makefile b/Makefile
-index 139e5c0c3c3c..226303a6921e 100644
---- a/Makefile
-+++ b/Makefile
-@@ -12,7 +12,7 @@ endif
- endif
- 
- PROGRAM = dpcmd
--CC      = gcc
-+CC     ?= gcc
- PREFIX ?= /usr/local
- 
- PKG_CONFIG ?= pkg-config
diff --git a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0002-Makefile-add-conditional-stripping.patch b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0002-Makefile-add-conditional-stripping.patch
deleted file mode 100644
index 0fc8ac5bd2..0000000000
--- a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0002-Makefile-add-conditional-stripping.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From dac9d0ea5c419049c9ab0a5ba90d15d77a3271b0 Mon Sep 17 00:00:00 2001
-From: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
-Date: Mon, 22 Jul 2024 13:02:59 +0000
-Subject: [PATCH] Makefile: add conditional stripping
-Upstream-Status: Submitted [https://github.com/DediProgSW/SF100Linux/pull/88]
-
-This patch introduces a `NOSTRIP` conditional flag to the `install`
-target in the Makefile. The purpose of this flag is to allow the
-disabling of binary stripping during installation. This is
-particularly useful in development environments, such as BitBake,
-which handle stripping internally.
-
-When `NOSTRIP` is set to `1`, the `strip` command will be skipped
-during the installation process, preventing potential conflicts or
-redundant operations.
-
-Signed-off-by: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
-
----
- Makefile | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index 139e5c0..8b33320 100644
---- a/Makefile
-+++ b/Makefile
-@@ -58,7 +58,9 @@ install: $(PROGRAM)
- 	[ $(shell id -u) -eq 0 ] || (echo "Error: install needs root privileges" && false)
- 	install -v -o 0 -g 0 -m 755 -d $(DESTDIR)$(PREFIX)/bin $(DESTDIR)$(PREFIX)/share/DediProg
- 	echo -n "install: " && install -v -o 0 -g 0 -m 0755 $(PROGRAM) $(DESTDIR)$(PREFIX)/bin/$(PROGRAM)
-+ifneq ($(NOSTRIP),1)
- 	strip $(DESTDIR)$(PREFIX)/bin/$(PROGRAM)
-+endif
- 	install -v -o 0 -g 0 -m 755 -d $(DESTDIR)$(PREFIX)/share/DediProg
- 	echo -n "install: " && install -v -o 0 -g 0 -m 0644 ChipInfoDb.dedicfg $(DESTDIR)$(PREFIX)/share/DediProg/ChipInfoDb.dedicfg
- 	install -v -o 0 -g 0 -m 755 -d $(DESTDIR)/etc/udev/rules.d
--- 
-2.30.2
-
diff --git a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.21.bb
similarity index 78%
rename from meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
rename to meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.21.bb
index e0041b58e6..9f00d00ec3 100644
--- a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
+++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.21.bb
@@ -5,18 +5,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a23a74b3f4caf9616230789d94217acb"
 
 DEPENDS = "libusb"
 
-SRCREV = "e691f2d432144e3dbc82e9e0eea1ebaed4f3becf"
+SRCREV = "42edbcc60217f3fb39d5c6e5a68bedaa32844482"
 SRC_URI = " \
-    git://github.com/DediProgSW/SF100Linux.git;protocol=https;branch=master \
-    file://0001-add-support-for-cross-compilation.patch \
-    file://0002-Makefile-add-conditional-stripping.patch \
+    git://github.com/DediProgSW/SF100Linux.git;protocol=https;branch=master;tag=V${PV},x \
     "
 
 EXTRA_OEMAKE = "NOSTRIP=1 DESTDIR=${D} PREFIX=${prefix}"
 
-PV = "1.0+${SRCPV}"
-
-
 do_install() {
     oe_runmake install
 }

