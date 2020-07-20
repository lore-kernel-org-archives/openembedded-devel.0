Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.32107.1595222024484009969
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jul 2020 22:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,373,1589212800"; 
   d="scan'208";a="96599521"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Jul 2020 13:13:43 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 118134CE5064
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2020 13:13:42 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Jul 2020 13:13:44 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] wireguard-tools: upgrade 1.0.20200319 -> 1.0.20200513
Date: Mon, 20 Jul 2020 13:13:34 +0800
Message-ID: <1595222014-52567-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 118134CE5064.A29E5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...rd-tools_1.0.20200319.bb => wireguard-tools_1.0.20200513.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_1.0.20200319.bb => wireguard-tools_1.0.20200513.bb} (91%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
similarity index 91%
rename from meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
index f698b9a9af..c24e3438c7 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
@@ -1,6 +1,6 @@
 require wireguard.inc
 
-SRCREV = "a8063adc8ae9b4fc9848500e93f94bee8ad2e585"
+SRCREV = "c45d422a93d57f6fdec429640ff7f96b396beed4"
 SRC_URI = "git://git.zx2c4.com/wireguard-tools"
 
 inherit bash-completion systemd pkgconfig
-- 
2.25.1



