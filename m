Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.8177.1609726127948071390
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 18:08:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,472,1599494400"; 
   d="scan'208";a="103150517"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Jan 2021 10:08:46 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 68C684CE602D
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Jan 2021 10:08:43 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 4 Jan 2021 10:08:44 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] dash: upgrade 0.5.11.2 -> 0.5.11.3
Date: Mon, 4 Jan 2021 22:08:41 +0800
Message-ID: <1609769321-7180-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 68C684CE602D.A18B1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../dash/{dash_0.5.11.2.bb => dash_0.5.11.3.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-shells/dash/{dash_0.5.11.2.bb => dash_0.5.11.3.bb} (85%)

diff --git a/meta-oe/recipes-shells/dash/dash_0.5.11.2.bb b/meta-oe/recipes-shells/dash/dash_0.5.11.3.bb
similarity index 85%
rename from meta-oe/recipes-shells/dash/dash_0.5.11.2.bb
rename to meta-oe/recipes-shells/dash/dash_0.5.11.3.bb
index f59e6d1f7..92d9bc83d 100644
--- a/meta-oe/recipes-shells/dash/dash_0.5.11.2.bb
+++ b/meta-oe/recipes-shells/dash/dash_0.5.11.3.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b5262b4a1a1bff72b48e935531976d2e"
 inherit autotools update-alternatives
 
 SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz"
-SRC_URI[md5sum] = "b9b71c72e40fdc4db9b4ffb81fc3bebc"
-SRC_URI[sha256sum] = "00fb7d68b7599cc41ab151051c06c01e9500540183d8aa72116cb9c742bd6d5f"
+SRC_URI[md5sum] = "c7016b513f701d88c70b3082eb183581"
+SRC_URI[sha256sum] = "62b9f1676ba6a7e8eaec541a39ea037b325253240d1f378c72360baa1cbcbc2a"
 
 EXTRA_OECONF += "--bindir=${base_bindir}"
 
-- 
2.25.1



