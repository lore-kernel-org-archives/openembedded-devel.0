Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.1591.1627971187088917603
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Aug 2021 23:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1736D5m0010299
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 2 Aug 2021 23:13:06 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 2 Aug 2021 23:13:05 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 2 Aug 2021 23:13:04 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] jemalloc: add new recipe
Date: Tue, 3 Aug 2021 14:10:39 +0800
Message-ID: <20210803061039.42552-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

jemalloc is a general purpose malloc(3) implementation that emphasizes
fragmentation avoidance and scalable concurrency support.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../jemalloc/jemalloc_5.2.1.bb                | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb

diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
new file mode 100644
index 000000000..4738f0e78
--- /dev/null
+++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
@@ -0,0 +1,24 @@
+# Copyright (C) 2021 Mingli Yu <mingli.yu@windriver.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "General-purpose scalable concurrent malloc implementation"
+
+DESCRIPTION = "jemalloc is a general purpose malloc(3) implementation that emphasizes \
+fragmentation avoidance and scalable concurrency support."
+
+HOMEPAGE = "https://github.com/jemalloc/jemalloc"
+LICENSE = "BSD"
+
+SECTION = "libs"
+
+LIC_FILES_CHKSUM = "file://README;md5=6900e4a158982e4c4715bf16aa54fa10"
+
+SRC_URI = "git://github.com/jemalloc/jemalloc.git"
+
+SRCREV = "ea6b3e973b477b8061e0076bb257dbd7f3faa756"
+
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+EXTRA_AUTORECONF += "--exclude=autoheader"
-- 
2.17.1

