Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.44322.1598838330962126970
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Aug 2020 18:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,373,1592841600"; 
   d="scan'208";a="98715790"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 31 Aug 2020 09:45:26 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 6A3D348990E0
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2020 09:45:25 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 31 Aug 2020 09:45:29 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] [oe] [meta-oe] [PATCH] fio: upgrade 3.21 -> 3.22
Date: Mon, 31 Aug 2020 21:45:24 +0800
Message-ID: <1598881526-68512-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6A3D348990E0.A3D25
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-benchmark/fio/{fio_3.21.bb => fio_3.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-benchmark/fio/{fio_3.21.bb => fio_3.22.bb} (96%)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.21.bb b/meta-oe/recipes-benchmark/fio/fio_3.22.bb
similarity index 96%
rename from meta-oe/recipes-benchmark/fio/fio_3.21.bb
rename to meta-oe/recipes-benchmark/fio/fio_3.22.bb
index 83f38fc7b..b50ed9f27 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.21.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.22.bb
@@ -22,7 +22,7 @@ PACKAGECONFIG_NUMA_armeb = ""
 PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
 PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
-SRCREV = "d13596b225baf61425a9ca92b0583fc3fa97765d"
+SRCREV = "477b6753ad068983d49fea0abc91fab82da9bad0"
 SRC_URI = "git://git.kernel.dk/fio.git \
 "
 
-- 
2.25.1



