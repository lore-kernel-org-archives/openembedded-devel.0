Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web09.3931.1614846537852349158
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 00:29:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,222,1610380800"; 
   d="scan'208";a="105151998"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Mar 2021 16:28:55 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id D2DC24CE931B
	for <openembedded-devel@lists.openembedded.org>; Thu,  4 Mar 2021 16:28:49 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 4 Mar 2021 16:28:50 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] wireguard-tools: upgrade 1.0.20200827 -> 1.0.20210223
Date: Thu, 4 Mar 2021 16:28:48 +0800
Message-ID: <1614846528-104531-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: D2DC24CE931B.A2F50
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...rd-tools_1.0.20200827.bb => wireguard-tools_1.0.20210223.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_1.0.20200827.bb => wireguard-tools_1.0.20210223.bb} (92%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200827.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210223.bb
similarity index 92%
rename from meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200827.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210223.bb
index c4214dee6f..4af7e3e669 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200827.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210223.bb
@@ -1,6 +1,6 @@
 require wireguard.inc
 
-SRCREV = "7a321ce808ef9cec1f45cce92befcc9e170d3aa9"
+SRCREV = "6d3b876492298d0e311053567ecd7084972a8bc8"
 SRC_URI = "git://git.zx2c4.com/wireguard-tools"
 
 inherit bash-completion systemd pkgconfig
-- 
2.25.1



