Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id 7311960FD8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2020 19:50:12 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr
	[193.250.66.88]) by koncepto.io (Postfix) with ESMTPSA id 7CF436004D;
	Thu, 19 Mar 2020 20:50:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1584647411;
	bh=IFCwT+fpZe71SlnUi6AljOnFIQ3bZnE8r552Kv6bZqI=;
	h=From:To:Cc:Subject:Date:From;
	b=O48VhDezFnqHCjcyVJOxijmlKvTDaxUJqMxNcuOHmXmJepkRbds2gFPXfAP6bWQ3E
	PNppCiZV+BcjlkFR9EX2OFJMd2FLtswvRXtOkfj0xCYc+609YmcKXiXYiS2xhl/DmT
	PlgCSlWjnD3qheA4Kzb9tq3Mtc+rDHtQwa9sr/wOR16jCzAaJdBiTA/hPDCld1ekWJ
	kbVgyMaJPjyPLYAkKc8XGo5WQ1pxqsCu44zpRdr7U3ipZQywBF7Yxx1hs6ynJJbxLt
	brwb9hxGzk0coWQkrx4p+TOE7jsjmqRet9yEo1Idsq118+dIlk6BnNQ7g9DKhx1pyo
	KkbChcJVKO2hA==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Mar 2020 20:49:59 +0100
Message-Id: <1584647399-3555-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] nvme-cli: upgrade 1.9 -> 1.10.1
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
X-List-Received-Date: Thu, 19 Mar 2020 19:50:12 -0000

Also backport a patch to fix a build failure
with the mucl libc.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../nvme-cli/0001-fix-musl-compilation.patch       | 26 ++++++++++++++++++++++
 .../{nvme-cli_1.9.bb => nvme-cli_1.10.1.bb}        |  6 +++--
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-fix-musl-compilation.patch
 rename meta-oe/recipes-bsp/nvme-cli/{nvme-cli_1.9.bb => nvme-cli_1.10.1.bb} (85%)

diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-fix-musl-compilation.patch b/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-fix-musl-compilation.patch
new file mode 100644
index 0000000..be5d0da
--- /dev/null
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-fix-musl-compilation.patch
@@ -0,0 +1,26 @@
+From 0ff7ad2c88e3a47e7e3f6fe68c28a8d2d8a71f1f Mon Sep 17 00:00:00 2001
+From: Neel Chotai <neel@chot.ai>
+Date: Fri, 14 Feb 2020 17:56:23 +0000
+Subject: [PATCH] fix musl compilation
+
+Upstream-Status: Backport [https://github.com/linux-nvme/nvme-cli/commit/0ff7ad2c88e3a47e7e3f6fe68c28a8d2d8a71f1f]
+Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
+---
+ plugins/micron/micron-nvme.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/plugins/micron/micron-nvme.c b/plugins/micron/micron-nvme.c
+index 8240887..165fcf0 100644
+--- a/plugins/micron/micron-nvme.c
++++ b/plugins/micron/micron-nvme.c
+@@ -13,6 +13,7 @@
+ #include "nvme-print.h"
+ #include "nvme-ioctl.h"
+ #include <sys/ioctl.h>
++#include <limits.h>
+ 
+ #define CREATE_CMD
+ #include "micron-nvme.h"
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.10.1.bb
similarity index 85%
rename from meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb
rename to meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.10.1.bb
index ea8bc17..4f4bb2d 100644
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.10.1.bb
@@ -7,8 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022"
 DEPENDS = "util-linux"
 PV .= "+git${SRCPV}"
 
-SRC_URI = "git://github.com/linux-nvme/nvme-cli.git"
-SRCREV = "977e7d4cf59c3c7f89e9c093c91f991b07292e45"
+SRC_URI = "git://github.com/linux-nvme/nvme-cli.git \
+           file://0001-fix-musl-compilation.patch \
+"
+SRCREV = "1d84d6ae0c7d7ceff5a73fe174dde8b0005f6108"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


