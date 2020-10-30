Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.9178.1604035847734110086
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2020 22:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,432,1596470400"; 
   d="scan'208";a="100749128"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Oct 2020 13:30:46 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id D6EBF4CE34DE
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2020 13:30:45 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 30 Oct 2020 13:30:46 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] radvd: upgrade 2.18 -> 2.19
Date: Fri, 30 Oct 2020 13:30:44 +0800
Message-ID: <1604035844-70793-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: D6EBF4CE34DE.A57F3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-daemons/radvd/radvd_2.18.bb | 5 -----
 meta-networking/recipes-daemons/radvd/radvd_2.19.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/radvd/radvd_2.18.bb
 create mode 100644 meta-networking/recipes-daemons/radvd/radvd_2.19.bb

diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.18.bb b/meta-networking/recipes-daemons/radvd/radvd_2.18.bb
deleted file mode 100644
index 6097b209d..000000000
--- a/meta-networking/recipes-daemons/radvd/radvd_2.18.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-
-require radvd.inc
-
-SRC_URI[md5sum] = "26ead3a0d5cfbe4c81c3089eaf7b3250"
-SRC_URI[sha256sum] = "4f573e36b96ba92d03b5abbbd5f059b9c8994967812c77852f44049ac5a448fd"
diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.19.bb b/meta-networking/recipes-daemons/radvd/radvd_2.19.bb
new file mode 100644
index 000000000..553987e3d
--- /dev/null
+++ b/meta-networking/recipes-daemons/radvd/radvd_2.19.bb
@@ -0,0 +1,5 @@
+
+require radvd.inc
+
+SRC_URI[md5sum] = "e9c425ac48ecb96ea5ea2912c78969f9"
+SRC_URI[sha256sum] = "c36470706fec3a9e6bed394ffea08acaff5dac647848d26b96bb9b9c65d58da0"
-- 
2.25.1



