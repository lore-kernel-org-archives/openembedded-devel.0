Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.5932.1610434214361378327
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 22:50:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,340,1602518400"; 
   d="scan'208";a="103391339"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 12 Jan 2021 14:50:08 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 259524CE602D
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 14:50:05 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 12 Jan 2021 14:50:03 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] igmpproxy: upgrade 0.2.1 -> 0.3
Date: Tue, 12 Jan 2021 14:49:53 +0800
Message-ID: <1610434193-106217-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 259524CE602D.A2125
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../igmpproxy/{igmpproxy_0.2.1.bb => igmpproxy_0.3.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/igmpproxy/{igmpproxy_0.2.1.bb => igmpproxy_0.3.bb} (74%)

diff --git a/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.2.1.bb b/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.3.bb
similarity index 74%
rename from meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.2.1.bb
rename to meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.3.bb
index 004433b6b9..119475f25f 100644
--- a/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.2.1.bb
+++ b/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.3.bb
@@ -5,8 +5,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=432040ff3a55670c1dec0c32b209ad69"
 
 SRC_URI = "https://github.com/pali/igmpproxy/releases/download/${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "3a9c2cb42c1f5ee0cb769a4884545641"
-SRC_URI[sha256sum] = "d351e623037390f575c1203d9cbb7ba33a8bdef85a3c5e1d2901c5a2a38449a1"
+SRC_URI[md5sum] = "5565874d9631103109a72452cecb5ce7"
+SRC_URI[sha256sum] = "d1fc244cb2fbbf99f720bda3e841fe59ece9b6919073790b4b892739b1b844eb"
 
 UPSTREAM_CHECK_URI = "https://github.com/pali/${BPN}/releases"
 
-- 
2.25.1



