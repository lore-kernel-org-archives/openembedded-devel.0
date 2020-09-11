Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.3595.1599787346217727558
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2020 18:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,413,1592841600"; 
   d="scan'208";a="99114370"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Sep 2020 09:22:25 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B730C48990D3
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 09:22:22 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 11 Sep 2020 09:22:22 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] collectd: upgrade 5.11.0 -> 5.12.0
Date: Fri, 11 Sep 2020 21:22:17 +0800
Message-ID: <1599830537-14902-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B730C48990D3.A3B77
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../collectd/{collectd_5.11.0.bb => collectd_5.12.0.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/collectd/{collectd_5.11.0.bb => collectd_5.12.0.bb} (96%)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.11.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
similarity index 96%
rename from meta-oe/recipes-extended/collectd/collectd_5.11.0.bb
rename to meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
index a70e82e03..40a8442a5 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.11.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
@@ -15,8 +15,8 @@ SRC_URI = "http://collectd.org/files/collectd-${PV}.tar.bz2 \
            file://0006-libcollectdclient-Fix-string-overflow-errors.patch \
            file://0001-Remove-including-sys-sysctl.h-on-glibc-based-systems.patch \
            "
-SRC_URI[md5sum] = "13b1c946f6684abe453e24b5cd80ec45"
-SRC_URI[sha256sum] = "37b10a806e34aa8570c1cafa6006c604796fae13cc2e1b3e630d33dcba9e5db2"
+SRC_URI[md5sum] = "2b23a65960bc323d065234776a542e04"
+SRC_URI[sha256sum] = "5bae043042c19c31f77eb8464e56a01a5454e0b39fa07cf7ad0f1bfc9c3a09d6"
 
 inherit autotools python3native update-rc.d pkgconfig systemd
 
-- 
2.25.1



