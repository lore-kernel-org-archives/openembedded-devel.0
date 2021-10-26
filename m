Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01E1C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 07:59:59 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.9222.1635235198367437625
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 00:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 19Q7xuDB022284
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 26 Oct 2021 00:59:56 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 19Q7xkFL021130
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Oct 2021 00:59:55 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 26 Oct 2021 00:59:53 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 26 Oct 2021 00:59:52 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-oe][hardknott][PATCH 6/7] jemalloc: improve reproducibility
Date: Tue, 26 Oct 2021 15:58:36 +0800
Message-ID: <20211026075837.39670-6-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211026075837.39670-1-mingli.yu@windriver.com>
References: <20211026075837.39670-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Oct 2021 07:59:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93586

From: Mingli Yu <mingli.yu@windriver.com>

Remove build host info from config file to improve reproducibility.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.17.1


