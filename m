Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.28993.1612150852415451966
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Jan 2021 19:40:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1113eeWb007238
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sun, 31 Jan 2021 19:40:50 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 31 Jan 2021 19:40:43 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Sun, 31 Jan 2021 19:40:42 -0800
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Randy.MacLeod@windriver.com>
Subject: [PATCH 1/1] meta-oe: add crash to NON_MULTILIB_RECIPES
Date: Mon, 1 Feb 2021 11:40:37 +0800
Message-ID: <20210201034037.16383-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210201034037.16383-1-kai.kang@windriver.com>
References: <20210201034037.16383-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Crash has to be built as the same bitsize (32-bit/64-bit) as the kernel.
So add it to NON_MULTILIB_RECIPES to make it keeps same bitsize with the
kernel. For example, it is 'crash' rather than 'lib32-crash' which is
installed to 32-bit rootfs with 64-bit kernel.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 1f6086164..3de301550 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -98,3 +98,5 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
 "
 
 DEFAULT_TEST_SUITES_pn-meta-oe-ptest-image = " ${PTESTTESTSUITE}"
+
+NON_MULTILIB_RECIPES_append = " crash"
-- 
2.17.1

