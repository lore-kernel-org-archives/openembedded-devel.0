Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.13751.1606442729888167517
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2020 18:05:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,373,1599494400"; 
   d="scan'208";a="101800825"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Nov 2020 10:05:29 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B42814CE5CE3
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2020 10:05:27 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 27 Nov 2020 10:05:27 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] snort: upgrade 2.9.16.1 -> 2.9.17
Date: Fri, 27 Nov 2020 10:05:26 +0800
Message-ID: <1606442726-117358-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B42814CE5CE3.A2F83
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../snort/{snort_2.9.16.1.bb => snort_2.9.17.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/snort/{snort_2.9.16.1.bb => snort_2.9.17.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.16.1.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.17.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/snort/snort_2.9.16.1.bb
rename to meta-networking/recipes-connectivity/snort/snort_2.9.17.bb
index e967f7a03..324114f63 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.16.1.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.17.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://www.snort.org/downloads/archive/snort/${BP}.tar.gz \
     file://disable-run-test-program-while-cross-compiling.patch \
     file://configure.in-disable-tirpc-checking-for-fedora.patch \
 "
-SRC_URI[sha256sum] = "e3ac45a1a3cc2c997d52d19cd92f1adf5641c3a919387adab47a4d13a9dc9f8e"
+SRC_URI[sha256sum] = "c3b234c3922a09b0368b847ddb8d1fa371b741f032f42aa9ab53d67b428dc648"
 
 UPSTREAM_CHECK_URI = "https://www.snort.org/downloads"
 UPSTREAM_CHECK_REGEX = "snort-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.25.1



