Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.5975.1593480471667516957
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 18:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,296,1589212800"; 
   d="scan'208";a="95532670"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Jun 2020 09:28:05 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id C159D4CE4B14
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 09:17:33 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 30 Jun 2020 09:28:00 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] rsyslog: upgrade 0.2004.0 -> 0.2006.0
Date: Tue, 30 Jun 2020 09:27:59 +0800
Message-ID: <1593480479-5155-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: C159D4CE4B14.A55A7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../rsyslog/{rsyslog_8.2004.0.bb => rsyslog_8.2006.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2004.0.bb => rsyslog_8.2006.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2004.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2004.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
index 68e96ef7a..ff6699509 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2004.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2006.0.bb
@@ -29,8 +29,8 @@ SRC_URI_append_libc-musl = " \
     file://0001-Include-sys-time-h.patch \
 "
 
-SRC_URI[md5sum] = "375a60ab0f461367f84f07a5dbda6de2"
-SRC_URI[sha256sum] = "5fc3d7b775f0879a40606d960491812a602e22f62e006ce027ed7bcf4c9f27d9"
+SRC_URI[md5sum] = "33de768941953ceeca9d1a437b47891b"
+SRC_URI[sha256sum] = "d9589e64866f2fdc5636af4cae9d60ebf1e3257bb84b81ee953ede6a05878e97"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.17.1



