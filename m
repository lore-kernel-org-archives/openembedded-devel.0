Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F60EC433FE
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 08:00:04 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.8989.1635235202885507238
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 01:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 19Q7xtTL022275
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 26 Oct 2021 00:59:55 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 19Q7xkFG021130
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Oct 2021 00:59:55 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 26 Oct 2021 00:59:46 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 26 Oct 2021 00:59:45 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-oe][hardknott][PATCH 1/7] jemalloc: add new recipe
Date: Tue, 26 Oct 2021 15:58:31 +0800
Message-ID: <20211026075837.39670-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Oct 2021 08:00:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93589

From: Mingli Yu <mingli.yu@windriver.com>

jemalloc is a general purpose malloc(3) implementation that emphasizes
fragmentation avoidance and scalable concurrency support.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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


