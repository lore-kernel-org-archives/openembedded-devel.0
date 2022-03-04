Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E5CC433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 09:57:01 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.5392.1646387819841931182
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 01:57:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2249uwpK019487
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 4 Mar 2022 01:56:58 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 4 Mar 2022 01:56:57 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 4 Mar 2022 01:56:56 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] gosu: add new recipe
Date: Fri, 4 Mar 2022 17:56:56 +0800
Message-ID: <20220304095656.4193707-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 09:57:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95781

From: Mingli Yu <mingli.yu@windriver.com>

gosu is a simple Go-based setuid+setgid+setgroups+exec tool.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-support/gosu/gosu_1.14.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-support/gosu/gosu_1.14.bb

diff --git a/meta-oe/recipes-support/gosu/gosu_1.14.bb b/meta-oe/recipes-support/gosu/gosu_1.14.bb
new file mode 100644
index 000000000..624adf309
--- /dev/null
+++ b/meta-oe/recipes-support/gosu/gosu_1.14.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Simple Go-based setuid+setgid+setgroups+exec"
+HOMEPAGE = "https://github.com/tianon/gosu"
+DESCRIPTION = "This is a simple tool grown out of the simple fact that su and sudo have very strange and often annoying TTY and signal-forwarding behavior."
+LICENSE = "Apache-2.0 "
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+GO_IMPORT = "github.com/tianon/gosu"
+SRC_URI = "git://${GO_IMPORT}.git;branch=master;protocol=https \
+           git://github.com/opencontainers/runc;name=runc;destsuffix=${S}/src/github.com/opencontainers/runc;branch=main;protocol=https \
+"
+SRCREV = "9f7cd138a1ebc0684d43ef6046bf723978e8741f"
+SRCREV_runc = "d7f7b22a85a2387557bdcda125710c2506f8d5c5"
+inherit go
+
+do_compile:prepend() {
+    # New Go versions has Go modules support enabled by default
+    export GO111MODULE=off
+}
+
+RDEPENDS:${PN}-dev += "bash"
-- 
2.25.1


