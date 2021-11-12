Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F2A4C433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 07:29:26 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.12515.1636702164912312978
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Nov 2021 23:29:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1AC7TMUF006572
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Nov 2021 23:29:23 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 11 Nov 2021 23:29:22 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 11 Nov 2021 23:29:21 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] mozjs-78: fix do_configure failure
Date: Fri, 12 Nov 2021 15:27:24 +0800
Message-ID: <20211112072725.36086-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Nov 2021 07:29:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93914

From: Changqing Li <changqing.li@windriver.com>

do_configure fails occasionally with following error:
| File "/firefox-91.1.0/build/moz.configure/util.configure", line 239, in try_invoke_compiler
| os.remove(path)
| FileNotFoundError: [Errno 2] No such file or directory: '/tmp/conftest.jr1qrcw3.cpp'

change the temp file's prefix to avoid it is deleted by others

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...ix-one-occasionally-reproduced-confi.patch | 50 +++++++++++++++++++
 .../mozjs/mozjs-78_78.15.0.bb                 |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/0001-util.configure-fix-one-occasionally-reproduced-confi.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/0001-util.configure-fix-one-occasionally-reproduced-confi.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/0001-util.configure-fix-one-occasionally-reproduced-confi.patch
new file mode 100644
index 000000000..e943cf1ba
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/0001-util.configure-fix-one-occasionally-reproduced-confi.patch
@@ -0,0 +1,50 @@
+From 430fd956b91c6208f166753578234c2f5db6352f Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 11 Nov 2021 21:17:38 +0800
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
+index 7ee1a498ad..511e257ad9 100644
+--- a/build/moz.configure/util.configure
++++ b/build/moz.configure/util.configure
+@@ -217,7 +217,7 @@ def try_invoke_compiler(compiler, language, source, flags=None, onerror=None):
+         'C++': '.cpp',
+     }[language]
+ 
+-    fd, path = mkstemp(prefix='conftest.', suffix=suffix, text=True)
++    fd, path = mkstemp(prefix='try_invoke_compiler_conftest.', suffix=suffix, text=True)
+     try:
+         source = source.encode('ascii', 'replace')
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb
index 61c586115..c8fe8bbfa 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_78.15.0.bb
@@ -17,6 +17,7 @@ SRC_URI = " \
     file://0010-riscv-Set-march-correctly.patch \
     file://0011-replace-include-by-code-to-fix-arm-build.patch \
     file://0012-Add-SharedArrayRawBufferRefs-to-public-API.patch \
+    file://0001-util.configure-fix-one-occasionally-reproduced-confi.patch \
 "
 
 SRC_URI[sha256sum] = "a4438d84d95171a6d4fea9c9f02c2edbf0475a9c614d968ebe2eedc25a672151"
-- 
2.17.1


