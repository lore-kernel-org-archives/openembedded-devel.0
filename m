Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E6A3105D9AD
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 09:33:11 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.102201.1775640784128149402
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2026 02:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=e1LewH3c;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2026040809330000adfe6d6e0002070f-r52hia@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026040809330000adfe6d6e0002070f
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 08 Apr 2026 11:33:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=DgMCFi4sN2ZzVIDa9hLypmX5drTmH+DF88v+YA//yF4=;
 b=e1LewH3cTlFNfXYQfAozndcwSEtbYK28u62jbO+7QmGoQzln9pqS7BBVtWf8sZX4Mkdjwn
 lq+WTYCLo1na30wyF3UC9N9nKzzz4j7xE3+TVyu9sBg/BdT+PuuI6+F24AOEXiK7Whj7gOC8
 8zcMcKqWegf47Ql3a3xwZ+6XmgZcJuMEuYF/xX9Hy91CCMNL80SR8zdOt7h0CJqZSF/yXLdF
 0XKr4Lf3D9dkb2tY9dN0qLe8ApQ/qwktGhQ02b4wv7ieKzHj7LNE1lvDv1uOaJVr74Xs5zQa
 KsvEBKQ61l53LJSakHAl2tGDkXRTNZOEzyT157/QB0oYJA5wUSRl86uA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 1/2] poco: fix powerpc build
Date: Wed,  8 Apr 2026 11:32:15 +0200
Message-ID: <20260408093216.737233-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2026 09:33:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126103

From: Peter Marko <peter.marko@siemens.com>

Add patch which was also submitted upstream to quill.
Poco should get it when they update quill component.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...ll-rdtsc-fallback-for-32-bit-powerpc.patch | 35 +++++++++++++++++++
 meta-oe/recipes-support/poco/poco_1.15.1.bb   |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-support/poco/poco/0003-quill-rdtsc-fallback-for-32-bit-powerpc.patch

diff --git a/meta-oe/recipes-support/poco/poco/0003-quill-rdtsc-fallback-for-32-bit-powerpc.patch b/meta-oe/recipes-support/poco/poco/0003-quill-rdtsc-fallback-for-32-bit-powerpc.patch
new file mode 100644
index 0000000000..734b65efa2
--- /dev/null
+++ b/meta-oe/recipes-support/poco/poco/0003-quill-rdtsc-fallback-for-32-bit-powerpc.patch
@@ -0,0 +1,35 @@
+From dce2cc2886a9097971856e69737cc5c05c9239ea Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Wed, 8 Apr 2026 10:54:25 +0200
+Subject: [PATCH] quill: use soft rdtsc fallback on 32-bit PowerPC
+
+Quill's rdtsc helper already avoids __rdtsc() on ARM and PPC64, but
+32-bit PowerPC was not included in that guard. On powerpc targets this
+falls through to the x86-specific intrinsic and fails with:
+
+  error: '__rdtsc' was not declared in this scope
+
+Treat common 32-bit PowerPC compiler define the same way as PPC64 and
+use the existing steady_clock-based fallback.
+
+Upstream-Status: Submitted [https://github.com/odygrd/quill/pull/911]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ dependencies/quill/include/quill/core/Rdtsc.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dependencies/quill/include/quill/core/Rdtsc.h b/dependencies/quill/include/quill/core/Rdtsc.h
+index 3d0ae9f26..67f26cb89 100644
+--- a/dependencies/quill/include/quill/core/Rdtsc.h
++++ b/dependencies/quill/include/quill/core/Rdtsc.h
+@@ -100,7 +100,7 @@ QUILL_NODISCARD QUILL_ATTRIBUTE_HOT inline uint64_t rdtsc() noexcept
+   __asm__ volatile("stck %0" : "=Q"(tsc) : : "cc");
+   return tsc;
+ }
+-#elif (defined(_M_ARM) || defined(_M_ARM64) || defined(__PPC64__))
++#elif (defined(_M_ARM) || defined(_M_ARM64) || defined(__PPC64__) || defined(__PPC__))
+ QUILL_NODISCARD QUILL_ATTRIBUTE_HOT inline uint64_t rdtsc() noexcept
+ {
+   // soft failover
+-- 
+2.47.2
diff --git a/meta-oe/recipes-support/poco/poco_1.15.1.bb b/meta-oe/recipes-support/poco/poco_1.15.1.bb
index 7dd87606ef..35fd13f538 100644
--- a/meta-oe/recipes-support/poco/poco_1.15.1.bb
+++ b/meta-oe/recipes-support/poco/poco_1.15.1.bb
@@ -11,6 +11,7 @@ DEPENDS = "libpcre2 utf8proc zlib"
 SRC_URI = "git://github.com/pocoproject/poco.git;branch=poco-${PV};protocol=https;tag=poco-${PV}-release \
            file://0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch \
            file://0002-DataTest-disable-testSQLChannel-test.patch \
+           file://0003-quill-rdtsc-fallback-for-32-bit-powerpc.patch \
            file://run-ptest \
            "
 SRCREV = "a1aacbba1bda4301db01bb1a2c2ab80677756b90"

