Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.5292.1600305518553123477
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2020 18:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,434,1592841600"; 
   d="scan'208";a="99331554"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 17 Sep 2020 09:18:37 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 1724648990C1
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2020 09:18:33 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 17 Sep 2020 09:18:32 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] fio: upgrade 3.22 -> 3.23
Date: Thu, 17 Sep 2020 21:18:35 +0800
Message-ID: <1600348715-4366-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 1724648990C1.AEC83
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-benchmark/fio/{fio_3.22.bb => fio_3.23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-benchmark/fio/{fio_3.22.bb => fio_3.23.bb} (96%)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.22.bb b/meta-oe/recipes-benchmark/fio/fio_3.23.bb
similarity index 96%
rename from meta-oe/recipes-benchmark/fio/fio_3.22.bb
rename to meta-oe/recipes-benchmark/fio/fio_3.23.bb
index b50ed9f279..49bca59550 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.22.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.23.bb
@@ -22,7 +22,7 @@ PACKAGECONFIG_NUMA_armeb = ""
 PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
 PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
-SRCREV = "477b6753ad068983d49fea0abc91fab82da9bad0"
+SRCREV = "8650ad75b47d9d9f45a25f4dd46ec0a997332de2"
 SRC_URI = "git://git.kernel.dk/fio.git \
 "
 
-- 
2.25.1



