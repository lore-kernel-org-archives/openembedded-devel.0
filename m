Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.2916.1595584273698386904
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2020 02:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,390,1589212800"; 
   d="scan'208";a="96851467"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Jul 2020 17:51:09 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 77CEE4CE4BD0
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2020 17:51:03 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 24 Jul 2020 17:51:05 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-webserver] [PATCH] apache-websocket: upgrade 0.1.1 -> 0.1.2
Date: Fri, 24 Jul 2020 17:50:59 +0800
Message-ID: <1595584262-85677-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 77CEE4CE4BD0.A6059
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-httpd/apache-mod/apache-websocket_git.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
index 3cbab22c3d..0ef2bd7f45 100644
--- a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
+++ b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
@@ -13,9 +13,9 @@ RDEPENDS_${PN} += "apache2"
 # fork contains patches from the modules ML and fixes CVE compliance issues
 SRC_URI = "git://github.com/jchampio/apache-websocket.git"
 
-SRCREV = "6968083264b90b89b1b9597a4ca03ba29e7ea2e1"
+SRCREV = "0ee34c77fc78ff08fd548706300b80a7bc7874e4"
 
-PV = "0.1.1+git${SRCPV}"
+PV = "0.1.2+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



