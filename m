Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.32103.1595222012716960304
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jul 2020 22:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,373,1589212800"; 
   d="scan'208";a="96599503"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Jul 2020 13:13:31 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 9FE7B4CE1505
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2020 13:13:26 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Jul 2020 13:13:29 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] [oe] [meta-networking] [PATCH] wireguard-module: upgrade 1.0.20200401 -> 1.0.20200712
Date: Mon, 20 Jul 2020 13:12:15 +0800
Message-ID: <1595221935-52519-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 9FE7B4CE1505.A6752
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...-module_1.0.20200401.bb => wireguard-module_1.0.20200712.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-module_1.0.20200401.bb => wireguard-module_1.0.20200712.bb} (95%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200712.bb
similarity index 95%
rename from meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200712.bb
index 73199592c8..bc94e29ea3 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200712.bb
@@ -1,6 +1,6 @@
 require wireguard.inc
 
-SRCREV = "43f57dac7b8305024f83addc533c9eede6509129"
+SRCREV = "d553aa7c52ac78c1963886afb74ba861b0b7b0fc"
 
 SRC_URI = "git://git.zx2c4.com/wireguard-linux-compat"
 
-- 
2.25.1



