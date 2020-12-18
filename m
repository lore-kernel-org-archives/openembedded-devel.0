Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.6580.1608276166179060302
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Dec 2020 23:22:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; 
   d="scan'208";a="102706987"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Dec 2020 15:22:45 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id C2E9C4CE600B
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Dec 2020 15:22:44 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Dec 2020 15:22:45 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] fio: upgrade 3.24 -> 3.25
Date: Sat, 19 Dec 2020 03:22:37 +0800
Message-ID: <1608319357-4820-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: C2E9C4CE600B.A5742
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-benchmark/fio/{fio_3.24.bb => fio_3.25.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-benchmark/fio/{fio_3.24.bb => fio_3.25.bb} (96%)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.24.bb b/meta-oe/recipes-benchmark/fio/fio_3.25.bb
similarity index 96%
rename from meta-oe/recipes-benchmark/fio/fio_3.24.bb
rename to meta-oe/recipes-benchmark/fio/fio_3.25.bb
index 1a42fd45c..6ab7ab79d 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.24.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.25.bb
@@ -22,7 +22,7 @@ PACKAGECONFIG_NUMA_armeb = ""
 PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
 PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
-SRCREV = "45d3aa1f57be23db180f8db3d133e8094370f35c"
+SRCREV = "fd80924b22fef6ce0d5580724d91490347445f90"
 SRC_URI = "git://git.kernel.dk/fio.git \
 "
 
-- 
2.25.1



