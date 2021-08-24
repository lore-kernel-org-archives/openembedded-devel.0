Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.34485.1629775445560257558
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Aug 2021 20:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 17O3O3s0015928
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Aug 2021 20:24:04 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 17O3O3Fh006105
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Aug 2021 20:24:03 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 23 Aug 2021 20:24:02 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 23 Aug 2021 20:24:02 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] jemalloc: improve reproducibility
Date: Tue, 24 Aug 2021 11:20:37 +0800
Message-ID: <20210824032037.6791-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Remove build host info from config file to improve reproducibility.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
index b5d53bb11..d4fed864d 100644
--- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
+++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
@@ -28,6 +28,12 @@ EXTRA_AUTORECONF += "--exclude=autoheader"
 
 EXTRA_OECONF:append:libc-musl = " --with-jemalloc-prefix=je_"
 
+do_install:append() {
+	sed -i -e 's@${STAGING_DIR_HOST}@@g' \
+               -e 's@${STAGING_DIR_NATIVE}@@g' \
+               -e 's@${WORKDIR}@@g' ${D}${bindir}/jemalloc-config
+}
+
 do_compile_ptest() {
 	oe_runmake tests
 }
-- 
2.29.2

