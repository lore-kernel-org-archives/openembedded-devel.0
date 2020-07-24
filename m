Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.2962.1595584451056562809
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2020 02:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,390,1589212800"; 
   d="scan'208";a="96851531"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Jul 2020 17:54:10 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id D510F4CE4BDF
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2020 17:54:08 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 24 Jul 2020 17:54:10 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] dnsmasq: upgrade 2.81 -> 2.82
Date: Fri, 24 Jul 2020 17:54:08 +0800
Message-ID: <1595584448-85828-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: D510F4CE4BDF.A59D4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb | 8 --------
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.82.bb | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.82.bb

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
deleted file mode 100644
index 92415386c2..0000000000
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require dnsmasq.inc
-
-SRC_URI[dnsmasq-2.81.md5sum] = "e43808177a773014b5892ccba238f7a8"
-SRC_URI[dnsmasq-2.81.sha256sum] = "3c28c68c6c2967c3a96e9b432c0c046a5df17a426d3a43cffe9e693cf05804d0"
-SRC_URI += "\
-    file://lua.patch \
-"
-
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.82.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.82.bb
new file mode 100644
index 0000000000..4ca1f3cc91
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.82.bb
@@ -0,0 +1,8 @@
+require dnsmasq.inc
+
+SRC_URI[dnsmasq-2.82.md5sum] = "3c710dee3edba510ed11a6e3d9e0d9cb"
+SRC_URI[dnsmasq-2.82.sha256sum] = "62f33bfac1a1b4a5dab8461b4664e414f7d6ced1d2cf141e9cdf9c3c2a424f65"
+SRC_URI += "\
+    file://lua.patch \
+"
+
-- 
2.25.1



