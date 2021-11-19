Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C77C433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 03:58:59 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.4086.1637294338667225474
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 19:58:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1AJ3wveh006423
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 19:58:58 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1AJ3wqVZ009230
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 19:58:57 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 18 Nov 2021 19:58:52 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 18 Nov 2021 19:58:52 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 18 Nov 2021 19:58:51 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mozjs-91/mozjs-78: fix compile failure on centos7
Date: Fri, 19 Nov 2021 11:56:35 +0800
Message-ID: <20211119035635.20571-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Nov 2021 03:58:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94057

From: Changqing Li <changqing.li@windriver.com>

Mozjs compile failed with this failure:
/bin/sh: /lib64/libc.so.6: version `GLIBC_2.33' not found (required by
/build/tmp-glibc/work/corei7-64-wrs-linux/mozjs/91.1.0-r0/recipe-sysroot-native/usr/lib/libtinfo.so.5)

Root Cause:
cargo-host-linker has /bin/sh as it's interpreter, but cargo run the cmd
with LD_LIBRARY_PATH set to recipe-sysroot-native. The host /bin/sh
links libtinfo.so.5 under recipe-sysroot-native, which needs higher
libc. But host libc is older libc. So the incompatible problem occurred.

Solution:
rewrite cargo-host-linker in python3

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...rewrite-cargo-host-linker-in-python3.patch | 56 +++++++++++++++++++
 .../mozjs/mozjs-78_78.15.0.bb                 |  1 +
 ...rewrite-cargo-host-linker-in-python3.patch | 56 +++++++++++++++++++
 .../recipes-extended/mozjs/mozjs-91_91.2.0.bb |  1 +
 4 files changed, 114 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/0001-rewrite-cargo-host-linker-in-python3.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-91/0001-rewrite-cargo-host-linker-in-python3.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/0001-rewrite-cargo-host-linker-in-python3.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/0001-rewrite-cargo-host-linker-in-python3.patch
new file mode 100644
index 000000000..7b938179c
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/0001-rewrite-cargo-host-linker-in-python3.patch
@@ -0,0 +1,56 @@
+From 9eceb43dd676afe2f675bd65ab369ba4d14f6537 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 18 Nov 2021 07:16:39 +0000
+Subject: [PATCH] Rewrite cargo-host-linker in python3
+
+Mozjs compile failed with this failure:
+/bin/sh: /lib64/libc.so.6: version `GLIBC_2.33' not found (required by /build/tmp-glibc/work/corei7-64-wrs-linux/mozjs/91.1.0-r0/recipe-sysroot-native/usr/lib/libtinfo.so.5)
+
+Root Cause:
+cargo-host-linker has /bin/sh as it's interpreter, but cargo run the cmd
+with LD_LIBRARY_PATH set to recipe-sysroot-native. The host /bin/sh links
+libtinfo.so.5 under recipe-sysroot-native, which needs higher libc. But
+host libc is older libc. So the incompatible problem occurred.
+
+Solution:
+rewrite cargo-host-linker in python3
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ build/cargo-host-linker | 24 +++++++---
+ 1 file changed, 21 insertions(+), 3 deletions(-)
+
+diff --git a/build/cargo-host-linker b/build/cargo-host-linker
+index cbd0472bf7..ccd8bffec1 100755
+--- a/build/cargo-host-linker
++++ b/build/cargo-host-linker
+@@ -1,3 +1,21 @@
+-#!/bin/sh
+-# See comment in cargo-linker.
+-eval ${MOZ_CARGO_WRAP_HOST_LD} ${MOZ_CARGO_WRAP_HOST_LDFLAGS} '"$@"'
++#!/usr/bin/env python3
++
++import os,sys
++
++if os.environ['MOZ_CARGO_WRAP_HOST_LD'].strip():
++    binary=os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]
++else:
++    sys.exit(0)
++
++if os.environ['MOZ_CARGO_WRAP_HOST_LDFLAGS'].strip():
++    if os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[1:]:
++        args=[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[1:] + [os.environ['MOZ_CARGO_WRAP_HOST_LDFLAGS']] + sys.argv[1:]
++    else:
++        args=[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + [os.environ['MOZ_CARGO_WRAP_HOST_LDFLAGS']] + sys.argv[1:]
++else:
++    if os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[1:]:
++        args=[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[1:] + sys.argv[1:]
++    else:
++        args=[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + sys.argv[1:]
++
++os.execvp(binary, args)
+-- 
+2.33.1
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb
index c8fe8bbfa..aaf35f17a 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb
@@ -18,6 +18,7 @@ SRC_URI = " \
     file://0011-replace-include-by-code-to-fix-arm-build.patch \
     file://0012-Add-SharedArrayRawBufferRefs-to-public-API.patch \
     file://0001-util.configure-fix-one-occasionally-reproduced-confi.patch \
+    file://0001-rewrite-cargo-host-linker-in-python3.patch \
 "
 
 SRC_URI[sha256sum] = "a4438d84d95171a6d4fea9c9f02c2edbf0475a9c614d968ebe2eedc25a672151"
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-rewrite-cargo-host-linker-in-python3.patch b/meta-oe/recipes-extended/mozjs/mozjs-91/0001-rewrite-cargo-host-linker-in-python3.patch
new file mode 100644
index 000000000..7b938179c
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-91/0001-rewrite-cargo-host-linker-in-python3.patch
@@ -0,0 +1,56 @@
+From 9eceb43dd676afe2f675bd65ab369ba4d14f6537 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 18 Nov 2021 07:16:39 +0000
+Subject: [PATCH] Rewrite cargo-host-linker in python3
+
+Mozjs compile failed with this failure:
+/bin/sh: /lib64/libc.so.6: version `GLIBC_2.33' not found (required by /build/tmp-glibc/work/corei7-64-wrs-linux/mozjs/91.1.0-r0/recipe-sysroot-native/usr/lib/libtinfo.so.5)
+
+Root Cause:
+cargo-host-linker has /bin/sh as it's interpreter, but cargo run the cmd
+with LD_LIBRARY_PATH set to recipe-sysroot-native. The host /bin/sh links
+libtinfo.so.5 under recipe-sysroot-native, which needs higher libc. But
+host libc is older libc. So the incompatible problem occurred.
+
+Solution:
+rewrite cargo-host-linker in python3
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ build/cargo-host-linker | 24 +++++++---
+ 1 file changed, 21 insertions(+), 3 deletions(-)
+
+diff --git a/build/cargo-host-linker b/build/cargo-host-linker
+index cbd0472bf7..ccd8bffec1 100755
+--- a/build/cargo-host-linker
++++ b/build/cargo-host-linker
+@@ -1,3 +1,21 @@
+-#!/bin/sh
+-# See comment in cargo-linker.
+-eval ${MOZ_CARGO_WRAP_HOST_LD} ${MOZ_CARGO_WRAP_HOST_LDFLAGS} '"$@"'
++#!/usr/bin/env python3
++
++import os,sys
++
++if os.environ['MOZ_CARGO_WRAP_HOST_LD'].strip():
++    binary=os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]
++else:
++    sys.exit(0)
++
++if os.environ['MOZ_CARGO_WRAP_HOST_LDFLAGS'].strip():
++    if os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[1:]:
++        args=[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[1:] + [os.environ['MOZ_CARGO_WRAP_HOST_LDFLAGS']] + sys.argv[1:]
++    else:
++        args=[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + [os.environ['MOZ_CARGO_WRAP_HOST_LDFLAGS']] + sys.argv[1:]
++else:
++    if os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[1:]:
++        args=[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[1:] + sys.argv[1:]
++    else:
++        args=[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + sys.argv[1:]
++
++os.execvp(binary, args)
+-- 
+2.33.1
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91_91.2.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-91_91.2.0.bb
index 9150e1881..c04e8fe9d 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-91_91.2.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-91_91.2.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fire
            file://0005-nojit-32bit-arch-fix.patch \
            file://0006-Fix-build-on-powerpc.patch \
            file://0001-util.configure-fix-one-occasionally-reproduced-confi.patch \
+           file://0001-rewrite-cargo-host-linker-in-python3.patch  \
            "
 SRC_URI[sha256sum] = "3ef3cfd321d0c2c80ee1b41b8baf7a1ea4daf93c29e1377274933440ff5e42c3"
 
-- 
2.17.1


