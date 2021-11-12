Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A14DC433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 07:29:30 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.12516.1636702169809031798
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Nov 2021 23:29:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1AC7TSPe018350
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Nov 2021 23:29:29 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1AC7TNHW004431
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Nov 2021 23:29:28 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 11 Nov 2021 23:29:23 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 11 Nov 2021 23:29:22 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/2] mozjs-91: fix do_configure failure
Date: Fri, 12 Nov 2021 15:27:25 +0800
Message-ID: <20211112072725.36086-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211112072725.36086-1-changqing.li@windriver.com>
References: <20211112072725.36086-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Nov 2021 07:29:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93915

From: Changqing Li <changqing.li@windriver.com>

do_configure fails occasionally with following error:
| File "/firefox-91.1.0/build/moz.configure/util.configure", line 239, in try_invoke_compiler
| os.remove(path)
| FileNotFoundError: [Errno 2] No such file or directory: '/tmp/conftest.jr1qrcw3.cpp'

change the temp file's prefix to avoid it is deleted by others

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...ix-one-occasionally-reproduced-confi.patch | 50 +++++++++++++++++++
 .../recipes-extended/mozjs/mozjs-91_91.2.0.bb |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-91/0001-util.configure-fix-one-occasionally-reproduced-confi.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/0001-util.configure-fix-one-occasionally-reproduced-confi.patch b/meta-oe/recipes-extended/mozjs/mozjs-91/0001-util.configure-fix-one-occasionally-reproduced-confi.patch
new file mode 100644
index 000000000..5472eddbb
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-91/0001-util.configure-fix-one-occasionally-reproduced-confi.patch
@@ -0,0 +1,50 @@
+From b13cad4abc53f816f64c8b0af70cb46820746c72 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 11 Nov 2021 16:05:54 +0800
+Subject: [PATCH] util.configure: fix one occasionally reproduced configure
+ failure
+
+error:
+| checking whether the C++ compiler supports -Wno-range-loop-analysis...
+| DEBUG: Creating /tmp/conftest.jr1qrcw3.cpp with content:
+| DEBUG: | int
+| DEBUG: | main(void)
+| DEBUG: | {
+| DEBUG: |
+| DEBUG: | ;
+| DEBUG: | return 0;
+| DEBUG: | }
+| DEBUG: Executing: aarch64-wrs-linux-g++ -mcpu=cortex-a53 -march=armv8-a+crc -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/mozjs/91.1.0-r0/recipe-sysroot /tmp/conftest.jr1qrcw3.cpp -Werror -Wrange-loop-analysis -c
+| DEBUG: The command returned non-zero exit status 1.
+| DEBUG: Its error output was:
+...
+| File "/mozjs/91.1.0-r0/firefox-91.1.0/build/moz.configure/util.configure", line 239, in try_invoke_compiler
+| os.remove(path)
+| FileNotFoundError: [Errno 2] No such file or directory: '/tmp/conftest.jr1qrcw3.cpp'
+
+It should be another process that deleted this file by using
+"rm -rf conftest*" inappropriately
+
+Upstream-Status: Submitted [https://bugzilla.mozilla.org/show_bug.cgi?id=1740667]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ build/moz.configure/util.configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build/moz.configure/util.configure b/build/moz.configure/util.configure
+index 8f35e89c73..84e256647d 100644
+--- a/build/moz.configure/util.configure
++++ b/build/moz.configure/util.configure
+@@ -222,7 +222,7 @@ def try_invoke_compiler(compiler, language, source, flags=None, onerror=None):
+         "C++": ".cpp",
+     }[language]
+ 
+-    fd, path = mkstemp(prefix="conftest.", suffix=suffix, text=True)
++    fd, path = mkstemp(prefix="try_invoke_compiler_conftest.", suffix=suffix, text=True)
+     try:
+         source = source.encode("ascii", "replace")
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91_91.2.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-91_91.2.0.bb
index d6114b15a..9150e1881 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-91_91.2.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-91_91.2.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fire
            file://riscv32.patch \
            file://0005-nojit-32bit-arch-fix.patch \
            file://0006-Fix-build-on-powerpc.patch \
+           file://0001-util.configure-fix-one-occasionally-reproduced-confi.patch \
            "
 SRC_URI[sha256sum] = "3ef3cfd321d0c2c80ee1b41b8baf7a1ea4daf93c29e1377274933440ff5e42c3"
 
-- 
2.17.1


