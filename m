Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.44647.1590464864749942135
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 May 2020 20:47:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,435,1583164800"; 
   d="scan'208";a="93093666"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 26 May 2020 11:47:47 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 5256950A996F
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 May 2020 11:47:42 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 26 May 2020 11:47:41 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] rsyslog: upgrade 8.2002 -> 8.2004
Date: Tue, 26 May 2020 20:47:38 +0800
Message-ID: <1590497258-25173-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1590497258-25173-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1590497258-25173-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5256950A996F.A2658
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../rsyslog/{rsyslog_8.2002.0.bb => rsyslog_8.2004.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2002.0.bb => rsyslog_8.2004.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2002.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2004.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2002.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2004.0.bb
index ca8fddc713..68e96ef7a5 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2002.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2004.0.bb
@@ -29,8 +29,8 @@ SRC_URI_append_libc-musl = " \
     file://0001-Include-sys-time-h.patch \
 "
 
-SRC_URI[md5sum] = "fbe6d18205170e22bad470954d0dc874"
-SRC_URI[sha256sum] = "fe86c14d860da1202c76616feac0539ea5a40a4ad182d74b7d6d2419cc2381f8"
+SRC_URI[md5sum] = "375a60ab0f461367f84f07a5dbda6de2"
+SRC_URI[sha256sum] = "5fc3d7b775f0879a40606d960491812a602e22f62e006ce027ed7bcf4c9f27d9"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.17.1



