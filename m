Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 412EEC25B76
	for <webhook@archiver.kernel.org>; Sat,  8 Jun 2024 07:11:36 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.2127.1717830693691883006
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Jun 2024 00:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dhfUYf2p;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-702555eb23bso2397487b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Jun 2024 00:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717830693; x=1718435493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zNmAbOw1+ThVfbbPMui4v/Edx8rLn1kesVmV9NdONGk=;
        b=dhfUYf2ptTIQyaOMoXROZXvrrJMMkn8KREN6k9dCtGCI2tvsOOKwjLq3Hx4N1AOz/n
         2A4W86WIS4r5Cmla1UNT4Oo7UHXYQhfn2QbnYdZ+f/cj2CL5PqSKBdac5nXsr1SqqKr8
         vuPou4JmvARnRFRK8MZUhncdEeCpNMFqWsUezqJHCcihgFE+gXd2ogr+pEhbdR5V537X
         Ycs5FW8Cd5ltvjht0K/yFX2XOvwdayMzmz3UEmJZa2XMVo7vLXs8J4Cv8bwQ+91eLPJ8
         Uu6M86xAL7Hf2Sjk+lWZVp2w/8V5kjNua6u5nJVQun4X4Hv1cmc6myKQyHVue3cmD8pF
         +sDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717830693; x=1718435493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zNmAbOw1+ThVfbbPMui4v/Edx8rLn1kesVmV9NdONGk=;
        b=PiACrHe+jhWl5K3u0lJe4j5Vis3oK2v1PbGe3QDstTFCCtBAQD2N5kJVVAvKY8qnyX
         IyeG07nJg1dSGfu0+dIu4mf+DAhid0sgRmJc0aKVIXCiNe0MgcJh4QOoVCboKfd40CsN
         epkgOMVuGJeKlpoLncovTLGjoRuZmhx70+d6IrObv7fNKfT/F45M0A+lm5YQq6NFiy+B
         sgVfWBkAhhzgCaR35kCDaMRIyADvJOcW0r1iD988Dt7JdL/oBSs374hPU3cLY/V5zLzB
         yp/o3TGRik7TTqwQ2Wg3PM9PCOvsGw1fWdhLM/JHwmoGUCyGiVz1OxqUSjFTNyiMzHNo
         ppUw==
X-Gm-Message-State: AOJu0YxMVAnNVSoXwYehV8Xj7fClxi2VncxluTUinUjfXhPYxYVKx/WC
	QhOIQVlgcOhY5A5fFsovb8+FY9y9nOv0ba9FdflhxoRR0th4G2ay1eMElY38
X-Google-Smtp-Source: AGHT+IGR6yrpY7ohUBh7+TrhiDjwwiqf1s5EVM080EGwbIyRTC1QWAnc0sfRqMMsVndYrE2FhsA6zw==
X-Received: by 2002:a05:6a00:189f:b0:704:2d5d:4e53 with SMTP id d2e1a72fcca58-7042d5d5241mr81512b3a.14.1717830692417;
        Sat, 08 Jun 2024 00:11:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6de264ae026sm3551130a12.65.2024.06.08.00.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jun 2024 00:11:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] fwupd-efi: Upgrade to 1.6
Date: Sat,  8 Jun 2024 00:11:29 -0700
Message-ID: <20240608071130.3986236-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Jun 2024 07:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110773

Drop cc settings patch this code piece has been removed upstream
Add a patch to use native python
Disable incompatible-pointer-types warning as error with gcc-14

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ..._binary.py-Use-env-to-detect-python3.patch | 23 ++++++++
 meta-oe/recipes-bsp/fwupd/fwupd-efi/cc.patch  | 53 -------------------
 .../{fwupd-efi_1.3.bb => fwupd-efi_1.6.bb}    | 18 ++++---
 3 files changed, 35 insertions(+), 59 deletions(-)
 create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd-efi/0001-efi-generate_binary.py-Use-env-to-detect-python3.patch
 delete mode 100644 meta-oe/recipes-bsp/fwupd/fwupd-efi/cc.patch
 rename meta-oe/recipes-bsp/fwupd/{fwupd-efi_1.3.bb => fwupd-efi_1.6.bb} (61%)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd-efi/0001-efi-generate_binary.py-Use-env-to-detect-python3.patch b/meta-oe/recipes-bsp/fwupd/fwupd-efi/0001-efi-generate_binary.py-Use-env-to-detect-python3.patch
new file mode 100644
index 0000000000..c362681421
--- /dev/null
+++ b/meta-oe/recipes-bsp/fwupd/fwupd-efi/0001-efi-generate_binary.py-Use-env-to-detect-python3.patch
@@ -0,0 +1,23 @@
+From 4c8f95fedecbc590eb7cd98aaf97912fa36b8f2e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Jun 2024 23:58:36 -0700
+Subject: [PATCH] efi/generate_binary.py: Use env to detect python3
+
+This enables python3 from native sysroot correctly
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ efi/generate_binary.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/efi/generate_binary.py b/efi/generate_binary.py
+index 443472a..a4611bb 100755
+--- a/efi/generate_binary.py
++++ b/efi/generate_binary.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python3
++#!/usr/bin/env python3
+ #
+ # Copyright (C) 2021 Javier Martinez Canillas <javierm@redhat.com>
+ # Copyright (C) 2021 Richard Hughes <richard@hughsie.com>
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd-efi/cc.patch b/meta-oe/recipes-bsp/fwupd/fwupd-efi/cc.patch
deleted file mode 100644
index 6fd2eca941..0000000000
--- a/meta-oe/recipes-bsp/fwupd/fwupd-efi/cc.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-Change the efi-cc argument to take an array, so that we can pass compiler flags
-such as --sysroot.
-
-In the long term changing the fwupd-efi build to use the standard Meson
-CC/LD/etc would be the preferred fix.
-
-Upstream-Status: Inappropriate [better fix in progress]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/efi/generate_sbat.py b/efi/generate_sbat.py
-index e42b365..4831a48 100755
---- a/efi/generate_sbat.py
-+++ b/efi/generate_sbat.py
-@@ -7,6 +7,7 @@
- #
- # pylint: disable=missing-docstring, invalid-name
- 
-+import shlex
- import subprocess
- import sys
- import argparse
-@@ -19,7 +20,7 @@ def _generate_sbat(args):
-     FWUPD_URL = "https://github.com/fwupd/fwupd-efi"
- 
-     subprocess.run(
--        [args.cc, "-x", "c", "-c", "-o", args.outfile, "/dev/null"], check=True
-+        shlex.split(args.cc) + ["-x", "c", "-c", "-o", args.outfile, "/dev/null"], check=True
-     )
- 
-     # not specified
-diff --git a/efi/meson.build b/efi/meson.build
-index 68ea4aa..dcf0d43 100644
---- a/efi/meson.build
-+++ b/efi/meson.build
-@@ -187,7 +187,7 @@ o_file5 = custom_target('fwup-sbat.o',
-                         command : [
-                           generate_sbat,
-                           '@OUTPUT@',
--                          '--cc', efi_cc,
-+                          '--cc', ' '.join(efi_cc),
-                           '--objcopy', objcopy,
-                           '--project-name', meson.project_name(),
-                           '--project-version', meson.project_version(),
-diff --git a/meson_options.txt b/meson_options.txt
-index d869cd2..17ef7fb 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -1,4 +1,4 @@
--option('efi-cc', type : 'string', value : 'gcc', description : 'the compiler to use for EFI modules')
-+option('efi-cc', type : 'array', value : ['gcc'], description : 'the compiler to use for EFI modules')
- option('efi-ld', type : 'string', value : 'ld', description : 'the linker to use for EFI modules')
- option('efi-libdir', type : 'string', description : 'path to the EFI lib directory')
- option('efi-ldsdir', type : 'string', description : 'path to the EFI lds directory')
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.3.bb b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.6.bb
similarity index 61%
rename from meta-oe/recipes-bsp/fwupd/fwupd-efi_1.3.bb
rename to meta-oe/recipes-bsp/fwupd/fwupd-efi_1.6.bb
index b53cabeaeb..d72f2d9c53 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.3.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.6.bb
@@ -3,23 +3,23 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://github.com/fwupd/fwupd-efi;protocol=https;branch=main \
-           file://cc.patch"
-SRCREV = "36ce593f58e391cca43fd388824496ff98d83480"
+           file://0001-efi-generate_binary.py-Use-env-to-detect-python3.patch"
+
+SRCREV = "58a2928f778278ab1f7f8fcddbab81ba587a8962"
 S = "${WORKDIR}/git"
 
-DEPENDS = "gnu-efi"
+DEPENDS = "gnu-efi python3-pefile-native"
 
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 
-inherit meson
+inherit meson pkgconfig python3native
 
 # These should be configured as needed
 SBAT_DISTRO_ID ?= "${DISTRO}"
 SBAT_DISTRO_SUMMARY ?= "${DISTRO_NAME}"
 SBAT_DISTRO_URL ?= ""
 
-EXTRA_OEMESON += "-Defi-cc="${@meson_array('CC', d)}" \
-                  -Defi-ld='${HOST_PREFIX}ld' \
+EXTRA_OEMESON += "\
                   -Defi-includedir=${STAGING_INCDIR}/efi \
                   -Defi-libdir=${STAGING_LIBDIR} \
                   -Defi_sbat_distro_id='${SBAT_DISTRO_ID}' \
@@ -31,3 +31,9 @@ EXTRA_OEMESON += "-Defi-cc="${@meson_array('CC', d)}" \
 
 # The compile assumes GCC at present
 TOOLCHAIN = "gcc"
+
+# Multiple errors like below with gcc14
+#| ../git/efi/fwupdate.c:611:20: error: passing argument 5 of 'fwup_log' from incompatible pointer type [-Wincompatible-pointer-types]
+#|   611 |         fwup_debug(L"n_updates: %d", n_updates);
+#|       |                    ^~~~~~~~~~~~~~~~
+TOOLCHAIN_OPTIONS += "-Wno-error=incompatible-pointer-types"

