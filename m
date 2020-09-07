Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.32256.1599441675832332100
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Sep 2020 18:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,400,1592841600"; 
   d="scan'208";a="98949052"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 07 Sep 2020 09:21:13 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B48FE48990E1
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Sep 2020 09:21:12 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 7 Sep 2020 09:21:14 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-filesystems] [PATCH] fuse3: upgrade 3.9.2 -> 3.9.3
Date: Mon, 7 Sep 2020 21:21:05 +0800
Message-ID: <1599484865-64779-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B48FE48990E1.A3662
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-support/fuse/{fuse3_3.9.2.bb => fuse3_3.9.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-support/fuse/{fuse3_3.9.2.bb => fuse3_3.9.3.bb} (95%)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.9.2.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.9.3.bb
similarity index 95%
rename from meta-filesystems/recipes-support/fuse/fuse3_3.9.2.bb
rename to meta-filesystems/recipes-support/fuse/fuse3_3.9.3.bb
index 357a1de1d..8ef9ee12c 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.9.2.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.9.3.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://GPL2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.xz \
 "
-SRC_URI[sha256sum] = "6999b6d48e7c0a79628fa901f6e66def3513cab4ffdd8097821e7dc3cdeae08a"
+SRC_URI[sha256sum] = "cd45270a064d2ae14f17cfc914f1555106d6c5091025b0b2698b860399d4ede6"
 
 S = "${WORKDIR}/fuse-${PV}"
 
-- 
2.25.1



