Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.8134.1602668057438133726
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2020 02:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,374,1596470400"; 
   d="scan'208";a="100151225"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 Oct 2020 17:34:16 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 1218948990F9
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2020 17:34:16 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 14 Oct 2020 17:34:15 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] memtester: upgrade 4.4.0 -> 4.5.0
Date: Wed, 14 Oct 2020 17:34:14 +0800
Message-ID: <1602668054-125165-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 1218948990F9.A0BFE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../memtester/{memtester_4.4.0.bb => memtester_4.5.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/memtester/{memtester_4.4.0.bb => memtester_4.5.0.bb} (82%)

diff --git a/meta-oe/recipes-benchmark/memtester/memtester_4.4.0.bb b/meta-oe/recipes-benchmark/memtester/memtester_4.5.0.bb
similarity index 82%
rename from meta-oe/recipes-benchmark/memtester/memtester_4.4.0.bb
rename to meta-oe/recipes-benchmark/memtester/memtester_4.5.0.bb
index 646ff90ba1..1a041101bd 100644
--- a/meta-oe/recipes-benchmark/memtester/memtester_4.4.0.bb
+++ b/meta-oe/recipes-benchmark/memtester/memtester_4.5.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 SRC_URI = "http://pyropus.ca/software/memtester/old-versions/${BP}.tar.gz \
            file://Makefile.patch \
            "
-SRC_URI[md5sum] = "e1883b69cd7c0bb74ef6a475c93a4fbf"
-SRC_URI[sha256sum] = "6ffe23e6e6449b42c577c7953778fb6f698050196797a94fc619d9badc59f8e8"
+SRC_URI[md5sum] = "674a8a88ff54bdb229ca4148218a41f1"
+SRC_URI[sha256sum] = "8ed52b0d06d4aeb61954994146e2a5b2d20448a8f3ce3ee995120e6dbde2ae37"
 
 do_compile () {
     echo '${CC} ${CFLAGS} -DPOSIX -c' > conf-cc
-- 
2.25.1



