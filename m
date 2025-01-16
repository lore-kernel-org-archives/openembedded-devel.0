Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34BD0C02180
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 11:59:00 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web11.47177.1737028735646846008
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jan 2025 03:58:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.52 with ESMTP; 16 Jan 2025 20:58:53 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto.lge.net) (10.177.227.48)
	by 156.147.1.126 with ESMTP; 16 Jan 2025 20:58:53 +0900
X-Original-SENDERIP: 10.177.227.48
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [meta-oe][PATCH] jansson: fix a symbol clash when building with cmake
Date: Thu, 16 Jan 2025 20:57:55 +0900
Message-ID: <20250116115755.30622-1-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Jan 2025 11:59:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114912

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

It exports all symbols globally which results in a symbol clash, for
example "hashtable_del" of ulogd2. It has been revealed because the
recipe inherits cmake over autotools since Langdale.
This fixes it by specifying visibility scope of symbols in its version
script which matches what is given with the libtool flag
'-export-symbols-regex' in Makefile.am.

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
---
 ...ols-starting-with-json_-and-jansson_.patch | 30 +++++++++++++++++++
 .../recipes-extended/jansson/jansson_2.14.bb  |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-extended/jansson/jansson/0001-Only-export-symbols-starting-with-json_-and-jansson_.patch

diff --git a/meta-oe/recipes-extended/jansson/jansson/0001-Only-export-symbols-starting-with-json_-and-jansson_.patch b/meta-oe/recipes-extended/jansson/jansson/0001-Only-export-symbols-starting-with-json_-and-jansson_.patch
new file mode 100644
index 0000000000..30b30b8850
--- /dev/null
+++ b/meta-oe/recipes-extended/jansson/jansson/0001-Only-export-symbols-starting-with-json_-and-jansson_.patch
@@ -0,0 +1,30 @@
+From e5c38614fb7e0bdbcaec6db6133fa62cfed62818 Mon Sep 17 00:00:00 2001
+From: Jaeyoon Jung <jaeyoon.jung@lge.com>
+Date: Wed, 15 Jan 2025 22:11:54 +0900
+Subject: [PATCH] Only export symbols starting with "json_" and "jansson_" for
+ cmake
+
+It's already done by the commit 7c707a7 and bcb6b6f, but not for cmake.
+This makes symbols in the same visibility as built with libtool.
+
+Upstream-Status: Submitted [https://github.com/akheron/jansson/pull/704]
+Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
+---
+
+ CMakeLists.txt | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 3394236..52b9934 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -325,6 +325,9 @@ if(JANSSON_BUILD_SHARED_LIBS)
+ # some linkers may only support --version-script
+       file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/jansson.sym" "JANSSON_${JANSSON_SOVERSION} {
+     global:
++          json_*;
++          jansson_*;
++    local:
+           *;
+ };
+ ")
diff --git a/meta-oe/recipes-extended/jansson/jansson_2.14.bb b/meta-oe/recipes-extended/jansson/jansson_2.14.bb
index 9f5cdcf4c0..4ac30c4dba 100644
--- a/meta-oe/recipes-extended/jansson/jansson_2.14.bb
+++ b/meta-oe/recipes-extended/jansson/jansson_2.14.bb
@@ -8,6 +8,7 @@ SRC_URI = "https://github.com/akheron/${BPN}/releases/download/v${PV}/${BP}.tar.
            file://0001-Fix-overwriting-linker-flags.patch \
            file://0001-Honour-multilib-paths.patch \
            file://0001-add-back-JSON_INTEGER_IS_LONG_LONG-for-cmake.patch \
+           file://0001-Only-export-symbols-starting-with-json_-and-jansson_.patch \
            "
 SRC_URI[sha256sum] = "fba956f27c6ae56ce6dfd52fbf9d20254aad42821f74fa52f83957625294afb9"
 
-- 
2.43.0


